package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Adocao;
import service.AdocaoService;

public class AdotarPetController extends HttpServlet {
	static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		HttpSession session = request.getSession();
		
		if(request.getParameter("id") != null) {
			int idAdocao = Integer.parseInt(request.getParameter("id"));
			try {
				AdocaoService adocaoService = new AdocaoService();
				Adocao adocao = adocaoService.carregar(idAdocao);
				
				session.setAttribute("adocao", adocao);
				// REMOVE ADOÇÕES PARA NÃO DAR CONFLITO NA PAGINA
				session.removeAttribute("adocoes");
				request.getRequestDispatcher("adotarPet.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}else if(request.getParameter("success") != null || request.getParameter("error") != null){
			request.getRequestDispatcher("adotarPet.jsp").forward(request, response);
		}else {
			AdocaoService adocaoService = new AdocaoService();
			ArrayList<Adocao> adocoes = adocaoService.carregarLista();
			try {
				// REMOVE ADOÇÃO PARA NÃO DAR CONFLITO NA PAGINA
				session.removeAttribute("adocao");
				session.setAttribute("adocoes", adocoes);
				//response.sendRedirect("adotarPet.jsp");
				request.getRequestDispatcher("adotarPet.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * Metodo usado para fazer a adoção
	 * */
	public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		int idAdotante = Integer.parseInt(request.getParameter("idUsuario"));
		int idAdocao = Integer.parseInt(request.getParameter("idAdocao"));
		
		AdocaoService adocaoService = new AdocaoService();

		try {
			boolean adotado = adocaoService.adotar(idAdotante, idAdocao);
			String url = "adotarPet?success=true";
			if(!adotado) {
				url = "adotarPet?error=true";
			}
			request.getRequestDispatcher(url).forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.getRequestDispatcher("adotarPet?error=true").forward(request, response);
		}
		
	}
}

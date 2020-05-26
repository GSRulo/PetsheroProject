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

public class HomeController extends HttpServlet {
	static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		HttpSession session = request.getSession();
		
		try {
			AdocaoService adocaoService = new AdocaoService();
			ArrayList<Adocao> adocoes = adocaoService.carregarLista(true,false);
			
			session.setAttribute("adocoesLimit", adocoes);
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}

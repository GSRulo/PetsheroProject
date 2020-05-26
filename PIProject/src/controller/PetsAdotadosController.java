package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Adocao;
import model.SexoPet;
import service.AdocaoService;

public class PetsAdotadosController extends HttpServlet {
	static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		HttpSession session = request.getSession();
		AdocaoService adocaoService = new AdocaoService();
		int idUsuario = (int) session.getAttribute("idUsuario");
		
		try {
			/**
			 * Todos os pets da base
			 * */
			ArrayList<Adocao> adocoes = adocaoService.carregarLista(false,false);
			/**
			 * Pets que o perfil adotou
			 * */
			ArrayList<Adocao> filterAdotados = new ArrayList<Adocao>();
			/**
			 * Pets que o perfil incluiu na lista de adoção
			 * */
			ArrayList<Adocao> filterAdicionados = new ArrayList<Adocao>();
			
			/**
			 * Filtra os pets que o perfil adotou e o os pets que incluiu na lista de adoção
			 * */
			
			for(Adocao adocao: adocoes) {
				if(adocao.getIdAdotante() == idUsuario) {
					filterAdotados.add(adocao);
				}else if(adocao.getFkUsuario() == idUsuario) {
					filterAdicionados.add(adocao);
				}
			}
			
			session.setAttribute("filterAdotados", filterAdotados);
			session.setAttribute("filterAdicionados", filterAdicionados);
			
			request.getRequestDispatcher("petsAdotados.jsp").forward(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		AdocaoService adService = new AdocaoService();
		
		String idade = request.getParameter("idade");
		SexoPet sexoPet = null;
		String tamanho = request.getParameter("tamanho");
		String cor = request.getParameter("cor");
		String descricao = request.getParameter("descricao");
		String tipoAnimal = request.getParameter("tipo_animal");
		int idAdocao = -1;
		
		if(request.getParameter("idAdocao") != null) {
			idAdocao = Integer.parseInt(request.getParameter("idAdocao"));
		}
		
		if(request.getParameter("sexo_animal") != null) {
			sexoPet = SexoPet.getValor(request.getParameter("sexo_animal"));
		}
		
		String delete = request.getParameter("delete");
		
		if(delete != null) {
			try {
				int idDelete = Integer.parseInt(delete);
				boolean deletado = adService.excluir(idDelete);
				
				String url = "petsAdotados.jsp";
				if(deletado) {
					url += "?deleteSuccess=true"; 
				}else {
					url += "?deleteError=true";
				}
				
				request.getRequestDispatcher(url).forward(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				request.getRequestDispatcher("petsAdotados.jsp?deleteError=true").forward(request, response);
			}
		}else {
			try {
				Adocao adocao = new Adocao();
				adocao.setIdAdocao(idAdocao);
				adocao.setSexoPet(sexoPet);
				adocao.setIdade(idade);
				adocao.setTamanho(tamanho);
				adocao.setCor(cor);
				adocao.setDescricao(descricao);
				adocao.setTipo(tipoAnimal);
				
				boolean atualizado = adService.atualizar(adocao);
				if(atualizado) {
					request.getRequestDispatcher("petsAdotados.jsp?successUpdate=true").forward(request, response);
				}else {
					request.getRequestDispatcher("petsAdotados.jsp?errorUpdate=true").forward(request, response);
				}
				
			} catch (Exception e) {
				request.getRequestDispatcher("petsAdotados.jsp?errorUpdate=true").forward(request, response);
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
		
	}
}

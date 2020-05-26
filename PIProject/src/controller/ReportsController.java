package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Reports;
import model.Status;
import service.ReportsService;

public class ReportsController extends HttpServlet {
	static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		HttpSession session = request.getSession();
		
		/**
		 * Carrega todas as listas de denuncias
		 * */
		try {
			ReportsService rservice = new ReportsService();
			ArrayList<Reports> reportsList = rservice.carregarLista();
			/**
			 * Lista aberta
			 * */
			ArrayList<Reports> disponiveis = new ArrayList<Reports>();
			/**
			 * Lista Encerrada
			 * */
			ArrayList<Reports> encerradas = new ArrayList<Reports>();
			for(Reports r: reportsList) {
				if(r.getStatus().getNameStatus() == "Encerrado") {
					encerradas.add(r);
				}else {
					disponiveis.add(r);
				}
			}
			session.setAttribute("denunciasAbertas", disponiveis);
			session.setAttribute("denunciasEncerradas", encerradas);
			
			request.getRequestDispatcher("denuncia.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		ReportsService rservice = new ReportsService();
		Reports reports = new Reports();
		
		String titulo = request.getParameter("titulo_reports");
		String descricao = request.getParameter("descricao");
		int idUsuario = (int) session.getAttribute("idUsuario");
		int editar = -1;
		int delete = -1;
		
		/**
		 * Editar
		 * */
		if(request.getParameter("editar") != null) {
			editar = Integer.parseInt(request.getParameter("editar"));
			reports.setIdReports(editar);
			reports.setTitulo(titulo);
			reports.setDescricao(descricao);
			reports.setStatus(Status.getValor(request.getParameter("status_report")));
			
			try {
				boolean atualizado = rservice.atualizar(reports);
				if(atualizado) {
					request.getRequestDispatcher("denuncia.jsp?successEdit=true").forward(request, response);
				}else {
					request.getRequestDispatcher("denuncia.jsp?errorEdit=true").forward(request, response);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				request.getRequestDispatcher("denuncia.jsp?errorEdit=true").forward(request, response);
			}
		}
		/**
		 * Deletar
		 * */
		else if(request.getParameter("delete") != null) {
			delete = Integer.parseInt(request.getParameter("delete"));
			boolean deletado = rservice.excluir(delete);
			if(deletado) {
				request.getRequestDispatcher("denuncia.jsp?successDelete=true").forward(request, response);
			}else {
				request.getRequestDispatcher("denuncia.jsp?errorDelete=true").forward(request, response);
			}
		}
		/**
		 * Cadastrar
		 * */
		else {
			try {
				reports.setStatus(Status.ABERTO);
				reports.setTitulo(titulo);
				reports.setDescricao(descricao);
				reports.setFkUsuario(idUsuario);
				
				rservice.criar(reports);
				request.getRequestDispatcher("denuncia.jsp?success=true").forward(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				request.getRequestDispatcher("denuncia.jsp?error=true").forward(request, response);
			}
		}
		
	}
}

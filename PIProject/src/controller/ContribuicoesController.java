package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Necessidade;
import model.Status;
import model.UsuarioNeces;
import service.NecessidadeService;
import service.UsuarioNecesService;

public class ContribuicoesController extends HttpServlet {
	static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		HttpSession session = request.getSession();
		
		try {
			NecessidadeService nesService = new NecessidadeService();
			
			ArrayList<Necessidade> necessidades = nesService.carregarLista();
			ArrayList<Necessidade> necEncerrada = new ArrayList<Necessidade>();
			ArrayList<Necessidade> necDisponiveis = new ArrayList<Necessidade>();
			
			for(Necessidade n: necessidades) {
				if(n.getStatus().getNameStatus() == "Encerrado") {
					necEncerrada.add(n);
				}else {
					necDisponiveis.add(n);
				}
			}
			
			session.setAttribute("necessidades", necDisponiveis);
			session.setAttribute("necEncerrada", necEncerrada);
			
			request.getRequestDispatcher("contribuicoes.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		HttpSession session = request.getSession();
		
		int idUsuario = (int) session.getAttribute("idUsuario");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String titulo = request.getParameter("titulo");
		String descricao = request.getParameter("descricao");
		String banco = request.getParameter("banco");
		String agencia = request.getParameter("agencia");
		String conta = request.getParameter("conta");
		String delete = request.getParameter("delete");
		
		int edit = 0;
		if(request.getParameter("edit") != null) {
			edit = Integer.parseInt(request.getParameter("edit"));
		}
		
		NecessidadeService nesService = new NecessidadeService();
		UsuarioNecesService ususarioNescService = new UsuarioNecesService();
		
		/**
		 * DELETA
		 * */
		if(delete != null) {
			int idNecessidade = Integer.parseInt(request.getParameter("delete"));
			boolean excluirUsuarioNec = ususarioNescService.excluir(idUsuario, idNecessidade);
			boolean excluirNecessidade = nesService.excluir(idNecessidade);
			
			if(excluirUsuarioNec && excluirNecessidade) {
				request.getRequestDispatcher("contribuicoes.jsp?successDelete=true").forward(request, response);
			}else {
				request.getRequestDispatcher("contribuicoes.jsp?errorDelete=true").forward(request, response);
			}
		}else {
			float valor = Float.parseFloat(request.getParameter("valor_arrecadar"));
			Necessidade necessidade = new Necessidade();
			
			try {
				Status status = Status.ABERTO;
				necessidade.setTitulo(titulo);
				necessidade.setDescricao(descricao);
				necessidade.setBanco(banco);
				necessidade.setAgencia(agencia);
				necessidade.setConta(conta);
				necessidade.setVlArrecadar(valor);
				
				if(request.getParameter("edit") != null && edit != -1) {
					Status statusEdit = Status.getValor(request.getParameter("status"));
					necessidade.setId(edit);
					necessidade.setStatus(statusEdit);
					boolean atualizado = nesService.atualizar(necessidade);

					if(atualizado) {
						request.getRequestDispatcher("contribuicoes.jsp?successEdit=true").forward(request, response);
					}else {
						request.getRequestDispatcher("contribuicoes.jsp?errorEdit=true").forward(request, response);
					}
				}else {
					necessidade.setStatus(status);
					int idCadastro = nesService.criar(necessidade);
					
					UsuarioNeces usuarioNesc = new UsuarioNeces(idUsuario,idCadastro);
					
					boolean cadastrado = ususarioNescService.criar(usuarioNesc);
					if(cadastrado) {
						request.getRequestDispatcher("contribuicoes.jsp?success=true").forward(request, response);
					}else {
						request.getRequestDispatcher("contribuicoes.jsp?error=true").forward(request, response);
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
	}
}

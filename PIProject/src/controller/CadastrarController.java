package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Usuario;
import service.UsuarioService;

public class CadastrarController extends HttpServlet {
	static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String tipo_usuario = request.getParameter("tipo_usuario");
		String telefone = request.getParameter("telefone");
		String documento = request.getParameter("documento");
		
		Usuario usuario = new Usuario(0, nome, tipo_usuario, documento, email, telefone, senha);
		UsuarioService userService = new UsuarioService();
		
		try {
			userService.criar(usuario);
			HttpSession session = request.getSession();
			session.setAttribute("usuario", usuario);
			
			response.sendRedirect("home");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

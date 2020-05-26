package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Usuario;
import service.UsuarioService;

public class AuthController extends HttpServlet {
	static final long serialVersionUID = 1L;
	
	/**
	 * Metodo usado para fazer o sista de sair 
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		String logout = request.getParameter("logout");
		HttpSession session = request.getSession();
		if(logout != null) {
			session.invalidate();
			response.sendRedirect("login.jsp");
		}
	}
	/**
	 * Login do usuario
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String email = request.getParameter("usuario");
		String senha = request.getParameter("senha");

		try {
			UsuarioService usuarioSerice = new UsuarioService();
			Usuario usuario = usuarioSerice.autenticacao(email, senha);	
			
			if(usuario.getIdUsuario() != -1) {
				HttpSession session = request.getSession();
				session.setAttribute("usuario", usuario);
				session.setAttribute("idUsuario", usuario.getIdUsuario());
				
				response.sendRedirect("home");
			}else {
				response.sendRedirect("login.jsp?error=authentication");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}

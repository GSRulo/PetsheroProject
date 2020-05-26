package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Usuario;
import service.UsuarioService;

public class PerfilController extends HttpServlet {
	static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		Boolean checkSenha = Boolean.parseBoolean(request.getParameter("checkSenha"));
		String telefone = request.getParameter("telefone");
		String newPassword = request.getParameter("newPassword");
		
		try {
			HttpSession session = request.getSession();
			int idUsuario = (int) session.getAttribute("idUsuario");
			
			UsuarioService usuarioService = new UsuarioService();
			Usuario usuarioAlterado = new Usuario();
			
			usuarioAlterado.setTel(telefone);
			usuarioAlterado.setSenha(newPassword);
			usuarioAlterado.setIdUsuario(idUsuario);
			/**
			 * caso checkSenha seja true ira atualizar a senha
			 * */
			boolean atualizado = usuarioService.atualizar(usuarioAlterado, checkSenha);
			
			if(atualizado) {
				Usuario usuario = usuarioService.carregar(idUsuario);
				session.removeAttribute("usuario");
				session.setAttribute("usuario", usuario);
				response.sendRedirect("perfil.jsp?success=true");
			}else {
				response.sendRedirect("perfil.jsp?error=true");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			response.sendRedirect("perfil.jsp?error=true");
			e.printStackTrace();
		}
	}
}

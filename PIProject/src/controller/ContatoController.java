package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SendEmail;


public class ContatoController extends HttpServlet {
	static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String assunto = request.getParameter("assunto");
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String mensagem = request.getParameter("mensagem");
		
		SendEmail enviar = new SendEmail();
		enviar.enviarEmail(nome, email, assunto, mensagem);
		
		response.sendRedirect("contato.jsp?send=true");
		
	}
}

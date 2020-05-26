package controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.Adocao;
import model.SexoPet;
import model.Status;
import model.Usuario;
import service.AdocaoService;

@MultipartConfig(maxFileSize = 16177215)
public class AdicionarPetController extends HttpServlet {
	static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String idade = request.getParameter("idade");
		String tipoPet = request.getParameter("tipo_animal");
		SexoPet sexoPet =  SexoPet.getValor((String) request.getParameter("sexo_animal"));
		String tamanho = request.getParameter("tamanho");
		String cor = request.getParameter("cor");
		String descricao = request.getParameter("descricao");
		Part foto = request.getPart("img");
		
		
		HttpSession session = request.getSession();
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		AdocaoService adocaoService = new AdocaoService();
		
		Status status = Status.ABERTO;
		try {
			Adocao adocao = new Adocao();
			InputStream img = foto.getInputStream();
			
			adocao.setIdade(idade);
			adocao.setTipo(tipoPet);
			adocao.setSexoPet(sexoPet);
			adocao.setTamanho(tamanho);
			adocao.setCor(cor);
			adocao.setDescricao(descricao);
			adocao.setFoto(img);
			adocao.setFkUsuario(usuario.getIdUsuario());
			adocao.setStatus(status);
			
			adocaoService.criar(adocao);
			
			response.sendRedirect("adicionarPet.jsp?success=true");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("adicionarPet.jsp?error=true");
		}
	}
}

package service;

import java.io.IOException;
import java.sql.SQLException;

import dao.UsuarioDAO;
import model.Usuario;

public class UsuarioService {
	UsuarioDAO dao = new UsuarioDAO();

	public int criar(Usuario u) throws SQLException, IOException {

		if (u.getNome().length() > 50 && u.getNome().length() == 0) {
			return -1;
			
		} else if (u.getTipoUsuario().length() > 30 && u.getTipoUsuario().length() == 0) {
			return -1;
			
		} else if(u.getEmail().length() > 150 && u.getEmail().length() == 0) {
			return -1;
			
		} else if(u.getTel().length() > 16 && u.getTel().length() == 0) {
			return -1;
		
		} else if (u.getSenha().length() > 30 && u.getSenha().length() == 0) {
			return -1;
		}
		
		return dao.criar(u);

	}

	public boolean atualizar(Usuario u, boolean isPassword) throws SQLException {
		return dao.atualizar(u,isPassword);
	}

	public void excluir(int id) {
		dao.excluir(id);
	}

	public Usuario carregar(int id) throws IOException {
		return dao.carregar(id);
	}
	
	public Usuario autenticacao(String email, String senha) throws SQLException {
		return dao.autenticacao(email, senha);
	}

}

package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.UsuarioNecesDAO;
import model.UsuarioNeces;

public class UsuarioNecesService {
	UsuarioNecesDAO dao = new UsuarioNecesDAO();
	
	public boolean criar(UsuarioNeces un) throws SQLException, IOException {

		if (un.getFkUsuario() == 0) {
			return false;

		} else if (un.getFkNeces() == 0) {
			return false;
		}

		return dao.criar(un);

	}
	
	public boolean excluir(int idUsuario, int idNecessidade) {
		return dao.excluir(idUsuario, idNecessidade);
	}

	public ArrayList<UsuarioNeces> carregar(int id) throws IOException {
		return dao.carregar(id);
	}
}

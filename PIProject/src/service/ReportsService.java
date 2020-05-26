package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.ReportsDAO;
import model.Reports;

public class ReportsService {
	ReportsDAO dao = new ReportsDAO();

	public int criar(Reports rp) throws SQLException, IOException {

		if (rp.getTitulo().length() > 100 && rp.getTitulo().length() == 0) {
			return -1;

		} else if (rp.getDescricao().length() == 0) {
			return -1;
		}

		return dao.criar(rp);

	}

	public boolean atualizar(Reports rp) throws SQLException {

		if (rp.getTitulo().length() > 100 && rp.getTitulo().length() == 0) {
			return false;

		} else if (rp.getDescricao().length() == 0) {
			return false;
		}

		return dao.atualizar(rp);
	}

	public boolean excluir(int id) {
		return dao.excluir(id);
	}

	public Reports carregar(int id) throws IOException {
		return dao.carregar(id);
	}
	
	/**
	 * @return Lista de todas as denuncias
	 * */
	public ArrayList<Reports> carregarLista(){
		return dao.carregarLista();
	}

}

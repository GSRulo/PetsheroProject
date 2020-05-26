package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.NecessidadeDAO;
import model.Necessidade;

public class NecessidadeService {
	NecessidadeDAO dao = new NecessidadeDAO();
	
	public int criar(Necessidade n) throws SQLException, IOException {
		return dao.criar(n);
	}

	public boolean atualizar(Necessidade n) throws SQLException {

		if (n.getTitulo().length() > 100 && n.getTitulo().length() == 0) {
			return false;

		} else if (n.getDescricao().length() == 0) {
			return false;
			
		} else if (n.getVlArrecadar() == 0) {
			return false;
			
		} else if (n.getAgencia().length() > 30 && n.getAgencia().length() == 0) {
			return false;
			
		} else if (n.getConta().length() > 30 && n.getConta().length() == 0) {
			return false;
			
		} else if (n.getBanco().length() > 30 && n.getBanco().length() == 0) {
			return false;
			
		}
		
		return dao.atualizar(n);
	}

	public boolean excluir(int id) {
		return dao.excluir(id);
	}

	public Necessidade carregar(int id) throws IOException {
		return dao.carregar(id);
	}
	
	public ArrayList<Necessidade> carregarLista() throws IOException {
		return dao.carregarLista();
	}

}

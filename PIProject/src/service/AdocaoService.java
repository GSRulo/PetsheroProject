package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.AdocaoDAO;
import model.Adocao;

public class AdocaoService {
	AdocaoDAO dao = new AdocaoDAO();

	public int criar(Adocao ad) throws SQLException, IOException {

		if (ad.getTipo().length() > 30 && ad.getTipo().length() == 0) {
			return -1;

		} else if (ad.getDescricao().length() == 0) {
			return -1;
		}

		return dao.criar(ad);

	}

	public boolean atualizar(Adocao ad) {
		
		if(ad.getIdade() == null 
				|| ad.getSexoPet().getSexo() == null
				|| ad.getTamanho() == null
				|| ad.getCor() == null
				|| ad.getDescricao() == null
				|| ad.getTipo() == null
				|| ad.getIdAdocao() <= -1
		) {
			return false;
		}
		return dao.atualizar(ad);
	}

	public boolean excluir(int id) {
		if(id <= -1) {
			return false;
		}
		return dao.excluir(id);
	}

	public Adocao carregar(int id) throws IOException {
		return dao.carregar(id);
	}
	
	public ArrayList<Adocao> carregarLista() throws IOException{
		return dao.carregarLista(false, true);
	}
	
	public ArrayList<Adocao> carregarLista(boolean isLimit, boolean allPets) throws IOException{
		return dao.carregarLista(isLimit, allPets);
	}
	
	public boolean adotar(int idAdotante, int idAdocao) {
		return dao.adotar(idAdotante, idAdocao);
	}

}

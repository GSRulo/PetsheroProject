package dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Adocao;
import model.SexoPet;
import model.Status;

public class AdocaoDAO {

	public int criar(Adocao adocao) throws SQLException, IOException {
		String insertSQL = "INSERT INTO Adocao(id, id_adotante, idade, tipo_animal, descricao, status_adocao, sexo_animal, tamanho, cor, img, dataCriacao, FK_id_usuario) VALUES(default, null, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?)";

		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(insertSQL);) {
			
			InputStream inputStream = adocao.getFoto();
			
			stmt.setString(1, adocao.getIdade());
			stmt.setString(2, adocao.getTipo());
			stmt.setString(3, adocao.getDescricao());
			stmt.setString(4, adocao.getStatus().toString());
			stmt.setString(5, adocao.getSexoPet().toString());
			stmt.setString(6, adocao.getTamanho());
			stmt.setString(7, adocao.getCor());
			stmt.setBlob(8, inputStream);
			stmt.setInt(9, adocao.getFkUsuario());

			stmt.execute();

			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stmt2 = conn.prepareStatement(sqlQuery); ResultSet rs = stmt2.executeQuery();) {
				if (rs.next()) {
					adocao.setIdAdocao(rs.getInt(1));
				}

				stmt.close();	
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return adocao.getIdAdocao();
		
	}

	public boolean atualizar(Adocao adocao) {
		String UpdateSQL = "UPDATE Adocao SET idade = ?, sexo_animal = ?, tamanho = ?, cor = ?, descricao = ?, tipo_animal = ? WHERE id = ?";
		boolean atualizado = false;
		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(UpdateSQL);) {
			
			stmt.setString(1, adocao.getIdade());
			stmt.setString(2, adocao.getSexoPet().toString());
			stmt.setString(3, adocao.getTamanho());
			stmt.setString(4, adocao.getCor());
			stmt.setString(5, adocao.getDescricao());
			stmt.setString(6, adocao.getTipo());
			stmt.setInt(7, adocao.getIdAdocao());
			
			stmt.execute();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return atualizado;
	}

	public boolean excluir(int id) {
		String DeleteSQL = "DELETE FROM Adocao WHERE id = ?";
		boolean deletado = false;
		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DeleteSQL);) {
			
			stmt.setInt(1, id);
			stmt.execute();
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deletado;
	}
	
	public ArrayList<Adocao> carregarLista(boolean isLimit, boolean allPets) throws IOException{
		ArrayList<Adocao> adocoes = new ArrayList<Adocao>();
		String SelectSQL = "SELECT a.*, u.nome, u.email, u.telefone FROM Adocao AS a JOIN Usuario AS u ON a.FK_id_usuario = u.id_usuario";
		if(isLimit) {
			SelectSQL = "SELECT * FROM Adocao WHERE status_adocao = ? ORDER BY RAND() LIMIT 7";
		}
		if(allPets) {
			SelectSQL = "SELECT a.*, u.nome, u.email, u.telefone FROM Adocao AS a JOIN Usuario AS u ON a.FK_id_usuario = u.id_usuario WHERE status_adocao = ?";
		}
		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SelectSQL);) {
			if(isLimit || allPets) {
				stmt.setString(1, "Aberto");
			}
			try (ResultSet rs = stmt.executeQuery();) {
				while(rs.next()) {
					Adocao adocao = new Adocao();
					InputStream  binaryStream =  rs.getBinaryStream("img");
					
					adocao.setIdAdocao(rs.getInt("id"));
					adocao.setIdAdotante(rs.getInt("id_adotante"));
					adocao.setSexoPet(SexoPet.getValor(rs.getString("sexo_animal")));
					adocao.setTamanho(rs.getString("tamanho"));
					adocao.setIdade(rs.getString("idade"));
					adocao.setCor(rs.getString("cor"));
					adocao.setTipo(rs.getString("tipo_animal"));
					adocao.setDescricao(rs.getString("descricao"));
					adocao.setStatus(Status.getValor(rs.getString("status_adocao")));
					adocao.setFkUsuario(rs.getInt("FK_id_usuario"));
					adocao.setFoto(binaryStream);
					adocao.setDataCriacao(rs.getTimestamp("dataCriacao"));
					adocao.setDataAdocao(rs.getTimestamp("dataAdocao"));
					

					if(!isLimit && !allPets || allPets) {
						adocao.setNome(rs.getString("nome"));
						adocao.setEmail(rs.getString("email"));
						adocao.setTelefone(rs.getString("telefone"));
					}
					
					adocoes.add(adocao);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return adocoes;
	}
	
	
	public Adocao carregar(int id) throws IOException {
		Adocao adocao = new Adocao();
		String SelectSQL = "SELECT a.*, u.nome, u.email, u.telefone FROM Adocao AS a JOIN Usuario AS u ON a.FK_id_usuario = u.id_usuario WHERE a.id = ?";

		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SelectSQL);) {

			stmt.setInt(1, id);

			try (ResultSet rs = stmt.executeQuery();) {

				if (rs.next()) {
					InputStream  binaryStream =  rs.getBinaryStream("img");
					adocao.setIdAdocao(rs.getInt("id"));
					adocao.setIdAdotante(rs.getInt("id_adotante"));
					adocao.setSexoPet(SexoPet.getValor(rs.getString("sexo_animal")));
					adocao.setTamanho(rs.getString("tamanho"));
					adocao.setIdade(rs.getString("idade"));
					adocao.setCor(rs.getString("cor"));
					adocao.setTipo(rs.getString("tipo_animal"));
					adocao.setDescricao(rs.getString("descricao"));
					adocao.setStatus(Status.getValor(rs.getString("status_adocao")));
					adocao.setFkUsuario(rs.getInt("FK_id_usuario"));
					adocao.setFoto(binaryStream);
					adocao.setDataCriacao(rs.getTimestamp("dataCriacao"));
					adocao.setDataAdocao(rs.getTimestamp("dataAdocao"));
					
					adocao.setNome(rs.getString("nome"));
					adocao.setEmail(rs.getString("email"));
					adocao.setTelefone(rs.getString("telefone"));
					
				} else {
					adocao.setIdAdocao(-1);
					adocao.setDescricao(null);
					adocao.setStatus(null);
					adocao.setFoto(null);
					adocao.setFkUsuario(-1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return adocao;
	}
	
	public boolean adotar(int idAdotante, int idAdocao) {
		String UpdateSQL = "UPDATE Adocao SET id_adotante = ?, status_adocao = ?, dataAdocao = NOW() WHERE id = ?";
		boolean adotado = false;
		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(UpdateSQL);) {
			stmt.setInt(1, idAdotante);
			stmt.setString(2, Status.ENCERRADO.getNameStatus());
			stmt.setInt(3, idAdocao);
			stmt.execute();
			
			conn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return adotado;
	}

}

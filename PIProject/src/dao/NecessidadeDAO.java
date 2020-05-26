package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Necessidade;
import model.Status;

public class NecessidadeDAO {

	public int criar(Necessidade n) throws SQLException, IOException {
		String insertSQL = "INSERT INTO Necessidades(id_necessidades, titulo, descricao, status_necessidade, valor_arrecadar, banco, agencia, conta, data_criacao) "
								+ "VALUES(default, ?, ?, ?, ?, ?, ?, ?, NOW())";
		int idCriado = -1;
		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(insertSQL);) {

			
			stmt.setString(1, n.getTitulo());
			stmt.setString(2, n.getDescricao());
			stmt.setString(3, n.getStatus().toString());
			stmt.setFloat(4, n.getVlArrecadar());
			stmt.setString(5, n.getBanco());
			stmt.setString(6, n.getAgencia());
			stmt.setString(7, n.getConta());
			
			stmt.execute();

			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stmt2 = conn.prepareStatement(sqlQuery); ResultSet rs = stmt2.executeQuery();) {
				if (rs.next()) {
					n.setId(rs.getInt(1));
				}

				stmt.close();
				return n.getId();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return idCriado;
	}
	
	public boolean atualizar(Necessidade n) throws SQLException {

		String UpdateSQL = "UPDATE Necessidades SET titulo=?, descricao=?, status_necessidade=?, valor_arrecadar=?, agencia=?, conta=?, banco=? WHERE id_necessidades = ?";
		boolean atualizado = false;
		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(UpdateSQL);) {

			stmt.setString(1, n.getTitulo());
			stmt.setString(2, n.getDescricao());
			stmt.setString(3, n.getStatus().toString());
			stmt.setFloat(4, n.getVlArrecadar());
			stmt.setString(5, n.getAgencia());
			stmt.setString(6, n.getConta());
			stmt.setString(7, n.getBanco());
			stmt.setInt(8, n.getId());	

			stmt.execute();
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return atualizado;
	}
	
	public boolean excluir(int id) {
		String DeleteSQL = "DELETE FROM Necessidades WHERE id_necessidades = ?";
		boolean excluido = false;
		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DeleteSQL);) {

			stmt.setInt(1, id);
			stmt.execute();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return excluido;
	}
	
	public Necessidade carregar(int id) throws IOException {

		Necessidade n = new Necessidade();
		n.getId();
		String SelectSQL = "SELECT * FROM Necessidades WHERE id_necessidades = ?";

		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SelectSQL);) {

			stmt.setInt(1, n.getId());

			try (ResultSet rs = stmt.executeQuery();) {

				if (rs.next()) {
					
					n.setTitulo(rs.getString("titulo"));
					n.setDescricao(rs.getString("descricao"));	
					n.setStatus(Status.getValor(rs.getString("status_necessidade")));
					n.setVlArrecadar(rs.getFloat("valor_arrecadar"));
					n.setAgencia(rs.getString("agencia"));
					n.setConta(rs.getString("banco"));
					n.setBanco(rs.getString("banco"));
					n.setDataCriacao(rs.getTimestamp("data_criacao"));

				} else {
					
					n.setId(-1);
					n.setTitulo(null);
					n.setDescricao(null);	
					n.setStatus(null);
					n.setVlArrecadar(-1);
					n.setBanco(null);
					n.setAgencia(null);
					n.setConta(null);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return n;
	}
	
	public ArrayList<Necessidade> carregarLista(){
		ArrayList<Necessidade> necessidades = new ArrayList<Necessidade>();
		String SelectSQL = "SELECT u.*, n.*, us.email, us.telefone, us.nome, us.documento FROM Necessidades AS n INNER JOIN usuarioNecessidade as u ON n.id_necessidades = u.FK_id_necessidade INNER JOIN Usuario AS us ON us.id_usuario = u.FK_id_usuario";
		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SelectSQL);) {
			try (ResultSet rs = stmt.executeQuery();) {
				
				while(rs.next()) {
					Necessidade n = new Necessidade();
					n.setTitulo(rs.getString("titulo"));
					n.setDescricao(rs.getString("descricao"));	
					n.setStatus(Status.getValor(rs.getString("status_necessidade")));
					n.setVlArrecadar(rs.getFloat("valor_arrecadar"));
					n.setAgencia(rs.getString("agencia"));
					n.setConta(rs.getString("conta"));
					n.setBanco(rs.getString("banco"));
					n.setDataCriacao(rs.getTimestamp("data_criacao"));
					n.setFkNeces(rs.getInt("FK_id_necessidade"));
					n.setFkUsuario(rs.getInt("FK_id_usuario"));
					n.setNome(rs.getString("nome"));
					n.setTelefone(rs.getString("telefone"));
					n.setEmail(rs.getString("email"));
					n.setDocumento(rs.getString("documento"));
					
					necessidades.add(n);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return necessidades;
	}

}

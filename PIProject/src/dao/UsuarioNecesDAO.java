package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.UsuarioNeces;

public class UsuarioNecesDAO {

	public boolean criar(UsuarioNeces un) throws SQLException, IOException {
		String insertSQL = "INSERT INTO usuarioNecessidade(FK_id_usuario, FK_id_necessidade) VALUES(?, ?)";
		boolean criado = false;
		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(insertSQL);) {

			stmt.setInt(1, un.getFkUsuario());
			stmt.setInt(2, un.getFkNeces());

			stmt.execute();

			String sqlQuery = "SELECT LAST_INSERT_ID()";
			
			@SuppressWarnings("unused")
			int id = 0;

			try (PreparedStatement stmt2 = conn.prepareStatement(sqlQuery); ResultSet rs = stmt2.executeQuery();) {

				if (rs.next()) {
					id = rs.getInt(1);
				}

				stmt.close();
				
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return criado;

	}
	
	public boolean excluir(int idUsuario, int idNecessidade) {
		String DeleteSQL = "DELETE FROM usuarioNecessidade WHERE FK_id_usuario = ? AND FK_id_necessidade = ?";
		boolean excluido = false;
		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DeleteSQL);) {

			stmt.setInt(1, idUsuario);
			stmt.setInt(2, idNecessidade);
			stmt.execute();
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return excluido;
	}

	public ArrayList<UsuarioNeces> carregar(int id) throws IOException {

		String SelectSQL = "SELECT * FROM usuarioNecessidade";

		UsuarioNeces un = null;
		ArrayList<UsuarioNeces> unList = new ArrayList<UsuarioNeces>();

		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SelectSQL);) {

			try (ResultSet rs = stmt.executeQuery();) {

				
				while (rs.next()) {
					un = new UsuarioNeces();

					un.setFkUsuario(rs.getInt("FK_id_usuario"));
					un.setFkNeces(rs.getInt("FK_id_necessidade"));

					unList.add(un);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		
		return unList;
	}

}

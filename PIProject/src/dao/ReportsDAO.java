package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Reports;
import model.Status;

public class ReportsDAO {

	public int criar(Reports rp) throws SQLException, IOException {
		String insertSQL = "INSERT INTO Reports(id_reports, status_report, titulo_reports, descricao, data_criacao, FK_id_usuario) VALUES(default, ?, ?, ?, NOW(), ?)";

		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(insertSQL);) {

			stmt.setString(1, rp.getStatus().toString());
			stmt.setString(2, rp.getTitulo());
			stmt.setString(3, rp.getDescricao());
			stmt.setInt(4, rp.getFkUsuario());

			stmt.execute();

			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stmt2 = conn.prepareStatement(sqlQuery); ResultSet rs = stmt2.executeQuery();) {
				if (rs.next()) {
					rp.setIdReports(rs.getInt(1));
				}

				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return rp.getIdReports();

	}

	public boolean atualizar(Reports rp) throws SQLException {

		String UpdateSQL = "UPDATE Reports SET status_report=?, titulo_reports=?, descricao = ? WHERE id_reports = ?";
		boolean atualizado = false;
		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(UpdateSQL);) {

			stmt.setString(1, rp.getStatus().toString());
			stmt.setString(2, rp.getTitulo());
			stmt.setString(3, rp.getDescricao());
			stmt.setInt(4, rp.getIdReports());

			stmt.execute();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return atualizado;
	}

	public boolean excluir(int id) {
		String DeleteSQL = "DELETE FROM Reports WHERE id_reports = ?";
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

	public Reports carregar(int id) throws IOException {

		Reports rp = new Reports();
		rp.getIdReports();
		String SelectSQL = "SELECT id_reports, status_report, titulo_reports, descricao, FK_id_usuario FROM Reports WHERE Reports.id_reports = ?";

		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SelectSQL);) {

			stmt.setInt(1, rp.getIdReports());

			try (ResultSet rs = stmt.executeQuery();) {

				if (rs.next()) {

					rp.setStatus(Status.getValor(rs.getString("status_report")));
					rp.setTitulo(rs.getString("titulo_reports"));
					rp.setDescricao(rs.getString("descricao"));					
					rp.setFkUsuario(rs.getInt("FK_id_usuario"));

				} else {

					rp.setIdReports(-1);
					rp.setStatus(null);
					rp.setTitulo(null);
					rp.setDescricao(null);
					rp.setFkUsuario(-1);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return rp;
	}
	
	public ArrayList<Reports> carregarLista(){
		ArrayList<Reports> reports = new ArrayList<Reports>();
		String SelectSQL = "SELECT * FROM Reports";

		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SelectSQL);) {

			try (ResultSet rs = stmt.executeQuery();) {

				while (rs.next()) {
					Reports rp = new Reports();
					rp.setStatus(Status.getValor(rs.getString("status_report")));
					rp.setTitulo(rs.getString("titulo_reports"));
					rp.setDescricao(rs.getString("descricao"));		
					rp.setDataCriacao(rs.getTimestamp("data_criacao"));
					rp.setFkUsuario(rs.getInt("FK_id_usuario"));
					rp.setIdReports(rs.getInt("id_reports"));
					
					reports.add(rp);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return reports;
	}

}

package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Usuario;

public class UsuarioDAO {
	
	public int criar(Usuario u) throws SQLException, IOException {
		String insertSQL = "INSERT INTO Usuario(id_usuario, nome, tipo_usuario, documento, email, telefone, senha) VALUES(default, ?, ?, ?, ?, ?, ?)";
				
		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(insertSQL);) {
						
			stmt.setString(1, u.getNome());
			stmt.setString(2, u.getTipoUsuario());
			stmt.setString(3, u.getDocumento());
			stmt.setString(4, u.getEmail());
			stmt.setString(5, u.getTel());
			stmt.setString(6, u.getSenha());

			stmt.execute();

			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stmt2 = conn.prepareStatement(sqlQuery); ResultSet rs = stmt2.executeQuery();) {
				if (rs.next()) {
					u.setIdUsuario(rs.getInt(1));
				}

				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u.getIdUsuario();
	}
	
	public Usuario autenticacao(String email, String senha) throws SQLException {
		Usuario usuario = new Usuario();
		String SelectSQL = "SELECT * FROM Usuario WHERE email = ? AND BINARY senha = ?";
		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SelectSQL);) {

			stmt.setString(1, email);
			stmt.setString(2, senha);

			try (ResultSet rs = stmt.executeQuery();) {
				if (rs.absolute(1)) {
					usuario.setIdUsuario(rs.getInt("id_usuario"));
					usuario.setNome(rs.getString("nome"));
					usuario.setTipoUsuario(rs.getString("tipo_usuario"));
					usuario.setDocumento(rs.getString("documento"));
					usuario.setEmail(rs.getString("email"));
					usuario.setTel(rs.getString("telefone"));
					usuario.setSenha(rs.getString("senha"));
				} else {
					usuario.setIdUsuario(-1);
					usuario.setNome(null);
					usuario.setTipoUsuario(null);
					usuario.setDocumento(null);
					usuario.setEmail(null);
					usuario.setTel(null);
					usuario.setSenha(null);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return usuario;
	}
	
	public boolean atualizar(Usuario u, boolean isPassword) throws SQLException {
		boolean atualizado = false;
		String UpdateSQL = "UPDATE Usuario SET telefone=? WHERE id_usuario = ?";
		if(isPassword) {
			UpdateSQL = "UPDATE Usuario SET telefone=?, senha=? WHERE id_usuario = ?";
		}
		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(UpdateSQL);) {
			if(isPassword) {
				stmt.setString(1, u.getTel());
				stmt.setString(2, u.getSenha());
				stmt.setInt(3, u.getIdUsuario());
			}else {
				stmt.setString(1, u.getTel());
				stmt.setInt(2, u.getIdUsuario());
			}

			stmt.execute();
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return atualizado;
	}
	
	public void excluir(int id) {
		String DeleteSQL = "DELETE FROM Usuario WHERE id = ?";

		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DeleteSQL);) {

			stmt.setInt(1, id);
			stmt.execute();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Usuario carregar(int id) throws IOException {
		Usuario u = new Usuario();
		String SelectSQL = "SELECT * FROM Usuario WHERE id_usuario = ?";
		
		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SelectSQL);) {

			stmt.setInt(1, id);

			try (ResultSet rs = stmt.executeQuery();) {

				if (rs.next()) {
					
					u.setNome(rs.getString("nome"));
					u.setTipoUsuario(rs.getString("tipo_usuario"));
					u.setDocumento(rs.getString("documento"));
					u.setEmail(rs.getString("email"));
					u.setTel(rs.getString("telefone"));
					u.setSenha(rs.getString("senha"));

				} else {
					
					u.setIdUsuario(-1);
					u.setNome(null);
					u.setTipoUsuario(null);
					u.setDocumento(null);
					u.setEmail(null);
					u.setTel(null);
					u.setSenha(null);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return u;
	}

}

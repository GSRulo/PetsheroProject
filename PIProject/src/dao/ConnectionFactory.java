package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	private static final String USERNAME = "root";
	private static final String PASSWORD = "Password";
	private static final String HOST = "localhost";
	private static final String PORT = "3306";
	private static final String QUERY = "?useTimezone=true&serverTimezone=America/Sao_Paulo";
	private static final String DATABASE = "ProjetoAdocao";
	private static final String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE + QUERY;
	
	
	public static Connection getConnection(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (SQLException | ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}

}

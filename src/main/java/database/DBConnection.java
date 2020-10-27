/**
 * @author marcony.souza
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * @author marcony.souza
 *
 */
public class DBConnection {

	private static Connection connection;

	static {
		try {
			// Driver do banco a ser utilizado
			Class.forName("org.postgresql.Driver");
			// Iniciando uma conexão com as informações do banco de dados
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/netfound/netfoundServer/netfoundDB", "postgres", "netfound123");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		return connection;
	}
}

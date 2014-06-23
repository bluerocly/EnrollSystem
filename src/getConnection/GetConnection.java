package getConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConnection {
	public static Connection getConnection() {
		String driver = "org.gjt.mm.mysql.Driver";
		String url = "jdbc:mysql://localhost:3306/cms?useUnicode=true&characterEncoding=utf-8";
		Connection con = null;
		try {
			Class.forName(driver);
			try {
				System.out.println(url);
				con = DriverManager.getConnection(url, "root", "admin");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return con;
	}
}
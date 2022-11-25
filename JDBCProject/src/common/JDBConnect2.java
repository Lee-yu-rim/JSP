package common;

import java.sql.*;

public class JDBConnect2 {
	public Connection con;
	public ResultSet rs;
	public PreparedStatement psmt;
	public Statement stmt;
	
	public JDBConnect2() {

		String url = "jdbc:oracle:thin:@localhost:1521:orcl";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, "scott", "tiger");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (con != null) con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}


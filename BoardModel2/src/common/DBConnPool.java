package common;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool {
	// 커넥션 풀 방식으로 DB 접속하기
	public Connection con;
	public ResultSet rs;
	public PreparedStatement psmt;
	public Statement stmt;

	public DBConnPool() {
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			DataSource source = (DataSource) ctx.lookup("dbcp_myoracle");

			con = source.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

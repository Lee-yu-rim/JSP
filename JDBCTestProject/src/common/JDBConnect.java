package common;

import java.sql.*;

import javax.servlet.ServletContext;

public class JDBConnect {
	
	public Connection con;
	public ResultSet rs;
	public PreparedStatement ps;
	public Statement sm;
	
	public JDBConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("OracleDriver") ;
			
			Class.forName(driver);
			
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("Oraclepwd");
			
			con = DriverManager.getConnection(url ,id, pwd);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(sm != null) sm.close();
			if(con != null) con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

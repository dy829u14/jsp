package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public JDBCConnect() {
		try {
			//JDBC드라이버 로드
			Class.forName("oracle.jdbc.OracleDriver");
			//DB연결
			String id="green";
			String pwd="1234";	
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			con = DriverManager.getConnection(url, id, pwd);			
		} catch (Exception e) {		
			e.printStackTrace();
		}
	}
	
	public JDBCConnect(String driver, String url, String id, String pwd) {		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB연결 성공");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void close() {		
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(psmt != null) psmt.close();
				if(con != null) con.close();
				System.out.println("JDBC 자원 해제");
			} catch (SQLException e) {				
				e.printStackTrace();
			}
	}
}

package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCConnect {
	public Connection con; //데이터베이스 연결
	public Statement stmt; //정적쿼리
	public PreparedStatement psmt; //동적쿼리
	public ResultSet rs; //select쿼리문 결과 저장타입
	
	//기본생성자
	public JDBCConnect () {
		//JDBC드라이버 로드		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "green";
			String pwd = "1234";
			con=DriverManager.getConnection(url, id, pwd);
			System.out.println("DB연결성공");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//연결해지
	public void close() {
		
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(psmt != null) psmt.close();
				if(con != null) con.close();
				System.out.println("연결 해제");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
}









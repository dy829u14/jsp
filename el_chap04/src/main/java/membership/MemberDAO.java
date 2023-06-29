package membership;

import java.sql.SQLException;

import common.JDBCConnect;

public class MemberDAO extends JDBCConnect{
	//데이터 베이스 연결이 완료된 객체 생성
	public MemberDAO(String drv, String url, String id, String pwd) {
		super(drv,url,id,pwd);
	}
	//사용자가 입력한 아이디/패스워드와 일치하는 회원정보를 반환
	public MemberDTO getMemberDTO (String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id = ? and pass = ?";
		//인파라미터를 가진 쿼리문		
		try {		
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			//결과 처리
			if(rs.next()){
				//getString(컬럼명 또는 인덱스) 레코드의 값들을 가지고 옴
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString(4));				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
}

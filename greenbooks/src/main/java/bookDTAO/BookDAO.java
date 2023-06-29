package bookDTAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCConnect;

public class BookDAO extends JDBCConnect{
	public BookDAO(String driver, String url, String id, String pwd) {
		super(driver, url, id, pwd);
	}
	//게시글 목록 가져오기
	public List<BookDTO> selectList () {
		List<BookDTO> booklist = new ArrayList<>();
		String query = "select * from book";
		//인파라미터를 가진 쿼리문		
		try {		
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			//결과 처리
			while(rs.next()){
				BookDTO dto = new BookDTO();
				//getString(컬럼명 또는 인덱스) 레코드의 값들을 가지고 옴
				dto.setNum(rs.getInt(1));
				dto.setBookname(rs.getString(2));
				dto.setWriter(rs.getString(3));
				dto.setCompany(rs.getString(4));
				dto.setPrice(rs.getString(5));
				dto.setDate(rs.getString(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return booklist;
	}
}

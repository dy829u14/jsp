package fileupload;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCConnect;

public class MyfileDAO extends JDBCConnect{
	//게시물 입력 insert메소드
	public int insertFile(MyfileDTO dto) {
		int result = 0;
		String query = "insert into myfile(idx, name, title, cate, ofile, sfile) "
				+ "values(seq_myfile_num.nextval,?,?,?,?,?)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	//게시글 목록 가져오기
	public List<MyfileDTO> myfilelist() {
		List<MyfileDTO> filelist = new ArrayList<>();
		String query = "select * from myfile";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				MyfileDTO dto = new MyfileDTO();
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setOfile(rs.getString(5));
				dto.setSfile(rs.getString(6));
				dto.setPostdate(rs.getString(7));
				filelist.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return filelist;
	}
	
	public MyfileDTO selectView(String idx) {
		MyfileDTO dto = new MyfileDTO();
		String query = "select * from myfile where idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setCate(rs.getString("cate"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	public int deletePost(String idx) {
		int result = 0;
		String query = "delete from myfile where idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public int myfileedit(MyfileDTO dto) {
		int result = 0;
		String query = "update myfile set title=?, name=?, cate=?, sfile=? where idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getSfile());
			psmt.setString(5, dto.getIdx());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}





package board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JDBCConnect;
import member.MemberDTO;

public class BoardDAO extends JDBCConnect{
	//검색 조건에 맞는 게시글의 개수 반환하기
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		//게시물 수를 얻어오는 쿼리작성
		String sql = "select count(*) from board";
		//검색 요청이 있을 경우 where절 추가
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField") + " like '%" + map.get("searchWord")+"%'";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public List<BoardDTO> getBoardList(Map<String, Object> map) {
		List<BoardDTO> boardlist = new ArrayList<>();
		String sql = "select * from ("
				+ "    select Tb.*, rownum rnum from "
				+ "    (select * from board";
		//map에 검색어가 있으면
		//"select * from board where title like '%검색어%'"
		//"select * from board where + map.get("searchField") + like + '%map.get("searchWord")%'"
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField") + " like '%" + map.get("searchWord")+"%'";
		}
		sql += " order by num desc) Tb"
				+ ")"
				+ " where rnum between ? and ?";
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				boardlist.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return boardlist;
	}
	//게시글 등록하기
	public int insertBoard(BoardDTO dto) {
		int result = 0;
		String sql = "insert into board values(seq_num.nextval,?,?,?,sysdate,0)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	//게시글 하나 조회하기
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		String query = "select * from board where num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	//지정한 게시글 조회수 업데이트
	public void updateVisitcount(String num) {
		String query = "update board set visitcount=visitcount+1 where num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//수정하기 메소드
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		String query = "update board set title=?, content=? where num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	//게시글 삭제하기
	public int deletePost(String num) {
		int result = 0;
		String query = "delete from board where num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	//페이징
	public List<BoardDTO> getPage(int pageNum, int amount) {
		List<BoardDTO> list = new ArrayList<>();
		String sql = "select * from ("
				+ "    select Tb.*, rownum aa from "
				+ "    (select * from board order by num desc) Tb"
				+ ")"
				+ " where aa between ? and ?";
		try {
			psmt = con.prepareStatement(sql);			
			psmt.setInt(1, (pageNum - 1) * amount);
			psmt.setInt(2, pageNum * amount);
			rs = psmt.executeQuery();
			while(rs.next()) {
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}

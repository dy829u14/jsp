package qna;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.CommentDAO;
import comment.CommentDTO;
import utils.BoardPaging;

@WebServlet("/qna/view.do")
public class QnaViewController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//게시물 불러오기
		QnaDAO dao = new QnaDAO();		
		//요청파라미터 값 반환
		String qID = req.getParameter("qID");
		//조회수 업데이트
		dao.updateQhit(qID);
		//게시물 조회하기
		QnaDTO dto = dao.selectView(qID);
		//선 연결 끊기
		dao.close();
		req.setAttribute("dto", dto);
		
		//DAO 생성
		CommentDAO commentDao = new CommentDAO();
		//뷰에 전달할 매개변수 저장용 Map 생성
		Map<String, Object> map = new HashMap<>();
		//게시물 수
		int totalCount = commentDao.selectCount(map);
		int pageSize = 10;
		int blockPage = 5;
		
		//현재 페이지 확인
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if(pageTemp != null && !pageTemp.equals("")) {
			//요청받은 페이지로 수정
			pageNum = Integer.parseInt(pageTemp);
		}
		
		//목록에 출력할 게시물 범위 계산
		//1페이지 1, 2페이지 11

		int start = (pageNum-1)*pageSize+1; //첫 게시물 번호
		int end = pageNum*pageSize; //마지막 게시물 번호
		map.put("start", start);
		map.put("end", end);
		map.put("qid", qID);
		//페이징 처리 완료
		
		//게시물 목록 받기
		List<CommentDTO> boardlists = commentDao.selectListPage(map);
		commentDao.close();
		
		//뷰에 전달할 매개변수 추가
		String pagingStr = BoardPaging.pagingstr(totalCount, pageSize, 
				blockPage, pageNum, "/comment/comment.do");
		map.put("pagingStr", pagingStr);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		req.setAttribute("boardlists", boardlists);
		req.setAttribute("map", map);
		//뷰포워드
		req.getRequestDispatcher("/QnaView.jsp").forward(req, resp);
	}
}

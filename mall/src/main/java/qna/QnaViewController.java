package qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		//뷰포워드
		req.getRequestDispatcher("/QnaView.jsp").forward(req, resp);
	}
}

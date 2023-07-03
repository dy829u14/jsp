<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//수정 내용 받기
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//DTO객체에 저장
	BoardDTO dto = new BoardDTO();
	dto.setContent(content);
	dto.setTitle(title);
	dto.setNum(num);
	
	//데이터베이스 반영
	BoardDAO dao = new BoardDAO();
	int result = dao.updateEdit(dto);
	dao.close();
	
	//성공했을때
	if(result == 1) {
		response.sendRedirect("boardview.jsp?num="+dto.getNum());
	}
	//실패했을때
	else {
	%>
		<script>
			alert("수정 실패");
			location.replaca("boardview.jsp?num=<%=dto.getNum()%>");
		</script>
	<%
		
	}
	
%>    

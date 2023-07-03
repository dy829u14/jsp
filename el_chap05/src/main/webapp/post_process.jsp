<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String id = request.getParameter("id");
		
	BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setId(session.getAttribute("UserId").toString());
	out.println(dto.getTitle());
	out.println(dto.getContent());
	out.println(dto.getId());
	
	BoardDAO dao = new BoardDAO();
	int result = dao.insertBoard(dto);
	dao.close();
	out.println(result);
	
	if(result == 1) {
	%>
	<script>
		alert("게시글이 등록되었습니다");
		location.replace("boardlist.jsp");
	</script>
	<%
	}else {
	%>
	<script>
		alert("게시글이 등록이 실패했습니다");
		location.replace("boardlist.jsp");
	</script>
	<%
	}

%>
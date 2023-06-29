<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//DAO를 통해 오라클 연결
	BoardDAO dao = new BoardDAO(application);
	List<BoardDTO> boardlist = dao.selectList();
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>목록보기</h2>
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>내용</td>
			<td>아이디</td>
			<td>등록일</td>
			<td>조회수</td>
		</tr>
		<%
			for(BoardDTO dto : boardlist) {
		%>
			<tr>
			<td><%= dto.getNum() %></td>
			<td><%= dto.getTitle() %></td>
			<td><%= dto.getContent() %></td>
			<td><%= dto.getId() %></td>
			<td><%= dto.getPostdate() %></td>
			<td><%= dto.getVisitcount() %></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>
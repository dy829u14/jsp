<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDAO dao = new BoardDAO();
	List<BoardDTO> blist = dao.getBoardList();
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="common/link.jsp"></jsp:include>
	<h2>게시판목록</h2>
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>내용</td>
			<td>이름</td>
			<td>등록일</td>
			<td>방문수</td>
		</tr>
		<%
			//리스트 항목이 비어있는지 체크
			if(blist.isEmpty()) {
		%>
			<tr>
				<td colspan="6">회원이 없습니다</td>
			</tr>
		<%
			}else {
				for(BoardDTO dto : blist) {
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
		
			}
		%>
	</table>
</body>
</html>
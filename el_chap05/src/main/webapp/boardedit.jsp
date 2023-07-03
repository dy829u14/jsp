<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.selectView(num);
	
	String sessionid = session.getAttribute("UserId") == null ? "" : session.getAttribute("UserId").toString();
	//게시글 작성자가 로그인한 아이디인지 확인
	if(!sessionid.equals(dto.getId())) {
	%>
		<script>
			alert("작성자 본인만 수정할 수 있습니다");
			location.replace("boardlist.jsp");
		</script>
	<%
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="common/link.jsp"></jsp:include>
	<h2>게시글 수정하기</h2>
	<form action="boardedit_process.jsp" method="post">
	<table>
		<input type="hidden" name="num" value="<%= dto.getNum()%>"/>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" value="<%=dto.getTitle() %>"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content"><%=dto.getContent() %></textarea></td>
		</tr>
	</table>
	<button type="submit">수정</button>
	<button type="reset">재입력</button>
	<button type = "button" onclick="location.href='boardlist.jsp'">목록보기</button>	
	</form>	
</body>
</html>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO();
	dao.updateVisitcount(num);
	BoardDTO dto = dao.selectView(num);
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	function deletePost() {
		let confirmd = confirm("정말로 삭제하시겠습니까?");
		if(confirmd) {
			//이름이 deleteForm인 요소 선택
			let delform = document.deleteForm;
			//전송방식 지정
			delform.method = "post";
			//전송경로 지정
			delform.action = "boarddelete_process.jsp";
			//전송
			delform.submit();
		}
	}

</script>
<jsp:include page="common/link.jsp"></jsp:include>
	<h2>게시글 상세보기</h2>
	<table>
		<tr>
			<td>번호</td>
			<td><%=dto.getNum() %></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=dto.getVisitcount() %></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<td>등록일</td>
			<td><%=dto.getPostdate() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%=dto.getContent() %></td>
		</tr>
	</table>
	<div>
		<button onclick="location.replace('boardedit.jsp?num=<%= dto.getNum()%>')">수정하기</button>
		<form name="deleteForm">
		<input type="hidden" name="num" value="<%= dto.getNum()%>">
			<button type="button" onclick="deletePost()">삭제하기</button>
		</form>
	</div>
</body>
</html>
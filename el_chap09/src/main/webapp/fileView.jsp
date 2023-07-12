<%@page import="fileupload.MyfileDTO"%>
<%@page import="fileupload.MyfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String idx = request.getParameter("idx");
	MyfileDAO dao = new MyfileDAO();
	MyfileDTO dto = dao.selectView(idx);
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
			delform.action = "filedelete_process.jsp";
			//전송
			delform.submit();
		}
	}
	</script>
	<h2>상세보기</h2>
	<table>
		<tr>
			<td>번호</td>
			<td><%=dto.getIdx() %></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=dto.getName() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td><%=dto.getCate() %></td>
		</tr>
		<tr>
			<td>원본파일명</td>
			<td><%=dto.getOfile() %></td>
		</tr>
		<tr>
			<td>저장된 파일명</td>
			<td><%=dto.getSfile() %></td>
		</tr>
		<tr>
			<td>사진</td>
			<td><img src="./uploads/<%= dto.getSfile()%>"></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=dto.getPostdate() %></td>
		</tr>
	</table>
	<div>
		<button onclick="location.replace('fileedit.jsp?idx=<%= dto.getIdx()%>')">수정하기</button>
		<form name="deleteForm">
		<input type="hidden" name="idx" value="<%= dto.getIdx()%>">
			<button type="button" onclick="deletePost()">삭제하기</button>
		</form>
	</div>
</body>
</html>
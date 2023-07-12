<%@page import="fileupload.MyfileDTO"%>
<%@page import="fileupload.MyfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx = request.getParameter("idx");
	MyfileDAO dao = new MyfileDAO();
	MyfileDTO dto = dao.selectView(idx);
	dao.close();
	pageContext.setAttribute("dto", dto);
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>수정하기</h2>
	<form action="fileedit_process.jsp" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>작성자</td>
			<td><input type ="text" name="name" value="${dto.name}">
			<input type ="hidden" name="idx" value="${dto.idx}"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type ="text" name="name" value="${dto.title}"></td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td>
				<input type="checkbox" name="cate" value="사진">사진
				<input type="checkbox" name="cate" value="과제">과제
				<input type="checkbox" name="cate" value="워드">워드
				<input type="checkbox" name="cate" value="음원">음원
			</td>
		</tr>
		<tr>
			<td>사진</td>
			<td><input type="file" name="attachedFile" required ="required"></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=dto.getPostdate() %></td>
		</tr>
		<tr>
			<td><button type="submit">수정하기</button></td>
			<td><button type="reset">취소</button></td>
		</tr>
	</table>
	</form>
	<script>
		let str = "<%= dto.getCate()%>";
		let strarr = str.split(",");
		let checks = document.querySelectorAll("input[type='checkbox']");
		checks.forEach(ch=>{
			if(strarr.includes(ch.value)) {
				ch.checked=true;	
			}
		})
		
	</script>
</body>
</html>
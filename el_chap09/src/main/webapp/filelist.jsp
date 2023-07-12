<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.util.List"%>
<%@page import="fileupload.MyfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {border-collapse: collapse;}
</style>
</head>
<body>
	<h2>DB에 등록된 파일 목록 보기</h2>
	<a href="fileUpload.jsp">파일 등록하기</a>
	<%
		MyfileDAO dao = new MyfileDAO();
		dao.myfilelist();
		List<MyfileDTO> filelist = dao.myfilelist();
		dao.close();		
	%>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>카테고리</td>
			<td>원본파일명</td>
			<td>저장된파일명</td>
			<td>사진</td>
			<td>작성일</td>
		</tr>
		<%
			for(MyfileDTO f : filelist) {
		%>
		<tr>
			<td><%= f.getIdx() %></td>
			<td><%= f.getName() %></td>
			<td><%= f.getTitle() %></td>
			<td><%= f.getCate() %></td>
			<td><%= f.getOfile() %></td>
			<td><%= f.getSfile() %></td>
			<td><a href="fileView.jsp?idx=<%= f.getIdx()%>"><img src="./uploads/<%= f.getSfile()%>" width="100"></a></td>
			<td><%= f.getPostdate() %></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>
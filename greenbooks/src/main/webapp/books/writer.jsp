<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
	<header><%@ include file="/include/header.jsp" %></header>
	<div id="main">
		<h2>도서등록하기</h2>
		<form action="writer_process.jsp">
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="bookname"></td>
				</tr>
				<tr>
					<td>글쓴이</td>
					<td><input type="text" name="writer"></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input type="text" name="company"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="price"></td>
				</tr>
				<tr>
					<td>출판일자</td>
					<td><input type="date" name="date"></td>
				</tr>
				<tr>				
					<td><input type="submit" value="도서등록"> <input type="reset" value="취소"></td>
				</tr>
			</table>
		</form>
	</div>
	<footer><%@ include file="/include/footer.jsp" %></footer>
</body>
</html>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBCConnect"%>
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
		<h2>도서목록</h2>
		<table id="booklist">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작가</td>
				<td>출판사</td>
				<td>가격</td>
				<td>출판날짜</td>
			</tr>
			<%
				request.setCharacterEncoding("UTF-8");

				JDBCConnect jdbc = new JDBCConnect();
				
				String sql = "select 번호, 제목, 작가, 출판사, 가격, 출판날짜 from book";
				Statement stmt = jdbc.con.createStatement();
				
				ResultSet rs = stmt.executeQuery(sql);

				while(rs.next()) {
					int num = rs.getInt(1);
					String bookname = rs.getString(2);
					String writer = rs.getString(3);
					String company = rs.getString(4);
					String price = rs.getString(5);
					Date date = rs.getDate(6);
					out.println(String.format("<tr><td>%d</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>",
							num, bookname, writer, company, price, date));
				}
				jdbc.close();
			%>
		</table>
	</div>
	<footer><%@ include file="/include/footer.jsp" %></footer>
</body>
</html>
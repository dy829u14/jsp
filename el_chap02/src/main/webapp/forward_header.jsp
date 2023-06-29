<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String h2 = request.getParameter("title");
%>
</head>
<body>
	<h2><%= h2 %></h2>
</body>
</html>
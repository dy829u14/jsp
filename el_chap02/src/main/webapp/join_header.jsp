<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String siteTitle = request.getParameter("title");
%>
<body>
	<h2><%= siteTitle %></h2>
</body>
</html>
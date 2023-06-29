<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("rename", "김그린");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	request의 rename속성 : ${requestScope.rename}<br/>
	code 파라미터 : ${param.code}<br/>
</body>
</html>
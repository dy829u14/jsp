<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>
		이름 : <%= request.getParameter("name") %><br>
		아이디 : <%= request.getParameter("userId") %>
		비밀번호 : <%= request.getParameter("userPass") %><br>
		이메일 : <%= request.getParameter("email") %>@
		<%= request.getParameter("mailSite") %><br>
		생년월일 : <%= request.getParameter("year") %> 
		<%= request.getParameter("month") %> <%= request.getParameter("day") %>
	</p>
</body>
</html>
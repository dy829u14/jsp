<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<%
	String id = request.getParameter("memberId");
	if(id != null && id.equals("green")) {
		response.sendRedirect("03while_exam.jsp");
	}else {
		%>
	<body>
		잘못된 아이디 입니다
	</body>
		<%
	}
%>
<body>

</body>
</html>
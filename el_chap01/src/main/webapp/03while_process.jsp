<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("utf-8");
%>
<body>
	<h2>While example</h2>
	<p>
		<%
			for(int i=0; i<Integer.parseInt(request.getParameter("count")); i++) { %>
				<%=request.getParameter("text")%><br>
			<%}
		%>
	</p>
</body>
</html>
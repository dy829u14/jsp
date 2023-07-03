<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p><%=name %></p>
	<h2>표현언어로 폼값 출력</h2>
	<ul>
		<li>이름 ${param.name}</li>
		<li>성별 ${param.gender}</li>
		<li>학력 ${param.grade}</li>
		<li>관심사항 ${paramValues.inter[0]}</li>
	</ul>

</body>
</html>
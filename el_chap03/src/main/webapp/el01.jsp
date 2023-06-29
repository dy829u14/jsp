<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>기본객체 우선순위 : 같은 이름으로 다른 영역에 속성이 있으면</h2>
	<h2>page > request > session > application 순으로 탐색</h2>
	<%
		pageContext.setAttribute("attr01", "pageVal01");
		request.setAttribute("attr01", "requestVal01");
		session.setAttribute("attr01", "sessionVal01");
		application.setAttribute("attr01", "applicationVal01");
		
		request.setAttribute("attr02", "requestVal01");
		session.setAttribute("attr02", "sessionVal01");
		application.setAttribute("attr02", "applicationVal01");
	%>
	<p>attr01 : ${sessionScope.attr01}</p>
	<p>attr02 : ${attr02}</p>
</body>
</html>
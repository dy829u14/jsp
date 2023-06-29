<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="common/link.jsp"></jsp:include>
	<%
		if(session.getAttribute("UserName") != null) {
	%>
		<p><%= session.getAttribute("UserName") %>님이 로그인 하셨습니다</p>
		<a href="logout_process.jsp">로그아웃</a>
	<%
		}else {
	%>
		<p>로그인 하세요</p>
		<a href="login.jsp">로그인</a>
	<%
		}
	%>
	<p>사이트에 오신것을 환영합니다</p>
</body>
</html>
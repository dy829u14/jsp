<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String headerLeft = request.getParameter("header");
	String headerRight = request.getParameter("login");
%>
<body>
	<div>
	<h1>green</h1>
	<ul>
	<%
		Cookie[] cookies = request.getCookies();
		boolean islogin = false;
		if(cookies.length >0) {
			for(Cookie cookiev : cookies) {
				if(cookiev.getName().equals("username")
				&& cookiev.getValue().equals("admin")) {
					islogin = true;
				}
			}
		}
		//쿠키의 이름이 username이고 쿠키의 값이 admin일때 로그인이 되었을때
		if(islogin) {
			%>
				<li><a href="logout_process.jsp">로그아웃</a></li>
				<li>정보관리</li>			
			<%
		//로그아웃 되었을때
		}else {
			%>			
				<li><a href="login.jsp">로그인</a></li>
				<li>회원가입</li>			
			<%
		}
	%>	
	</ul>		
	</div>
	
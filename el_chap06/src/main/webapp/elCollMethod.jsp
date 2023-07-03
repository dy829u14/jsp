<%@page import="el.MyElClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MyElClass myClass = new MyElClass();
	pageContext.setAttribute("myClass", myClass);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>영역에 저장 후 메소드 호출하기</h2>
	<p>
		900327-1772318 => ${myClass.getGender("900327-1772318")}
		011227-4476618 => ${myClass.getGender("011227-4476618")}
	</p>
</body>
</html>
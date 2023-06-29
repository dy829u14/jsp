<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("id");
	String userpw = request.getParameter("pw");
	//입력값이 admin과 1234면 쿠키를 생성
	if(userid.equals("admin") && userpw.equals("1234")) {
		Cookie cookie=new Cookie("username", "admin");
		response.addCookie(cookie);
	}
	response.sendRedirect("index.jsp");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//방법1 회원인증정보 속성 삭제
	//session.removeAttribute("UserId");
	//session.removeAttribute("UserName");
	
	//방법2 모든 속성을 한번에 삭제
	session.invalidate();
	
	response.sendRedirect("loginForm.jsp");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String radio = request.getParameter("radio");
		String viewURL = null;
		if(radio.equals("A")) {
			viewURL = "module/aBlood.jsp";
		}else if(radio.equals("B")) {
			viewURL = "module/bBlood.jsp";
		}else if(radio.equals("O")) {
			viewURL = "module/oBlood.jsp";
		}else {
			viewURL = "module/abBlood.jsp";
		}
	%>
	<jsp:forward page="<%= viewURL %>"/>
</body>
</html>
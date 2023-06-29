<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 발생</title>
</head>
<body>
	요청 처리과정에서 에러가 발생했습니다<br>
	빠른 시간 내에 문제를 해결하겠습니다
	<p>
		에러타입 : <%= exception.getClass().getName() %>
	</p>
	<p>
		에러메세지 : <%= exception.getMessage() %>
	</p>
</body>
</html>
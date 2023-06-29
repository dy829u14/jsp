<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body {
		line-height: 1.6;
	}
</style>
</head>
<body>
	<jsp:include page="forward_header.jsp" flush="false">
		<jsp:param name="title" value="Forward Tag Example2"/>
	</jsp:include>
	<form action="forward_view.jsp">
		<p>혈액형 테스트 <br> 당신의 혈액형은?</p>
		<div>
			<input name ="radio" type="radio" value="A">A형<br>
			<input name ="radio" type="radio" value="B">B형<br>
			<input name ="radio" type="radio" value="O">O형<br>
			<input name ="radio" type="radio" value="AB">AB형
		</div>
		<button>보내기</button>
	</form>
</body>
</html>
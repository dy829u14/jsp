<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//내장객체에 속성 추가하기
	pageContext.setAttribute("scopeValue", "페이지영역");
	String pageValue = (String) pageContext.getAttribute("scopeValue");
	request.setAttribute("requestValue", "리퀘스트영역");
	session.setAttribute("sessionValue", "세션영역");
	application.setAttribute("applicationValue", "어플리케이션영역");
	
	pageContext.setAttribute("scopeValue", "페이지스코프");
	request.setAttribute("scopeValue", "리퀘스트스코프");
	session.setAttribute("scopeValue", "세션스코프");
	application.setAttribute("scopeValue", "어플리케이션스코프");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>각 영역에 저장된 속성 읽기</h2>
	<p><%= pageValue %></p>
	<ul>
		<!--
		객체 표현방식 (",'모두 사용가능) 영역명 생략가능!!
		생략가능시 page -> request -> session -> application순으로 탐색
		${pageScope.scopeValue}
		${pageScope["scopeValue"]}
		${pageScope['scopeValue']}
		* 속성명에 특수 기호나 한글이 있을때는 대괄호만 쓸수있음
		-->
		<li>페이지 영역 : ${pageScope["scopeValue"]}</li>
		<li>리퀘스트 영역 : ${requestScope.requestValue}</li>
		<li>세션 영역 : ${sessionScope.sessionValue}</li>
		<li>어플리케이션 영역 : ${applicationScope.applicationValue}</li>
	</ul>
	<p>${scopeValue}</p>
</body>
</html>
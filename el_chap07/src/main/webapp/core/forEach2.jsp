<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>컬렉션 사용하기</h2>
	<%
		List<Person> lists = new ArrayList<Person>();
		lists.add(new Person("학생1", 33));
		lists.add(new Person("학생2", 24));
		lists.add(new Person("학생3", 29));
		
		Map<String, Person> maps = new HashMap<>();
		maps.put("1st", new Person("직원1", 28));
		maps.put("2nd", new Person("직원2", 34));
		maps.put("3rd", new Person("직원3", 37));
	%>
	<ul>
	<c:set var="lists" value="<%=lists%>"></c:set>
	<c:forEach items="${lists}" var="list">
		<li>이름 : ${list.name} 나이 : ${list.age}</li>
	</c:forEach>
	<c:set var="maps" value="<%=maps %>"></c:set>
	<c:forEach items="${maps}" var="map">
		<li>key : ${map.key} value : ${map.value.name} 나이 : ${map.value.age}</li>
	</c:forEach>
	</ul>
	<%
		String fruits = "사과,딸기,수박,오렌지";
	%>
	<h2>JSTL의 forTokens사용하기</h2>
	<c:forTokens items="<%=fruits%>" delims="," var="fru">
		<p>${fru}</p>
	</c:forTokens>
</body>
</html>
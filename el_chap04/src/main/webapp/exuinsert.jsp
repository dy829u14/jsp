<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBCConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 추가 테스트</h2>
	<%
		request.setCharacterEncoding("UTF-8");
		//DB연결 - jdbc객체 생성
		JDBCConnect jdbc = new JDBCConnect();
		//입력값 준비
		String id = request.getParameter("id");
		String pass = request.getParameter("pwd");
		String name = request.getParameter("name");
		//쿼리문 생성
		//sql문에 ?를 인파라미터라고 하며 정확한 값은 나중에 채우겠다는 것을 의미
		//connection객체를 통해서 prepareStatement객체를 생성
		String sql = "insert into member values(?,?,?,sysdate)";
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		psmt.setString(1,id);
		psmt.setString(2,pass);
		psmt.setString(3,name);
		//쿼리 수행 executeUpdate() ---> 변경된 행 개수를 리턴 (int)
		int inResult = psmt.executeUpdate();
		out.println(inResult+"행이 입력되었습니다");
		//연결 닫기
		jdbc.close();
		response.sendRedirect("selectMember.jsp");
	%>
</body>
</html>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	

	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getMemberDTO(request.getParameter("id"),
			request.getParameter("pass"));
	
	//dto.id속성값이 null이 아니면 로그인처리하기
	if(dto.getId() != null) {
		//로그인 처리
		session.setAttribute("UserId", dto.getId());
		session.setAttribute("UserName", dto.getName());
	%>
		<script>
			alert("로그인 되었습니다")
			location.replace("index.jsp");
		</script>
		
	<%
	}else {
	%>
		<script>alert("아이디 혹은 비밀번호가 잘못되었습니다")</script>
	<%	
	}
%>
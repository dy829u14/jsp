<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인을 하지 않았다면 이전 페이지로 돌아가기
	if(session.getAttribute("UserId") == null) {
		%>
			<script>
				alert("로그인 후 작성해주세요");
				location.replace('boardlist.jsp');
			</script>
		<%
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="common/link.jsp"></jsp:include>
	<h2>게시글 등록하기</h2>
	<form action="post_process.jsp" method="post">
		<p>제목 <input type="text" name="title"></p>
		<p>내용 <textarea name="content"></textarea></p>
		
		<p>
			<input type="submit" value="등록">
			<input type="reset" value="취소">
		</p>
	</form>
</body>
</html>
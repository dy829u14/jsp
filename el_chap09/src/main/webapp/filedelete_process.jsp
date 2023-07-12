<%@page import="fileupload.MyfileDTO"%>
<%@page import="fileupload.MyfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx = request.getParameter("idx");
	MyfileDAO dao = new MyfileDAO();
	MyfileDTO dto = dao.selectView(idx);
	int result = dao.deletePost(idx);
	dao.close();
	
	if(result == 1) {
	%>
		<script>
			alert("게시글이 삭제되었습니다");
			location.replace("filelist.jsp");
		</script>
	<%
		}			
%>
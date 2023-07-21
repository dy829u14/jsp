<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>
	<div>
		<h2>후기</h2>
	<form method="get">
		<div>
			<select name="searchField">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input name="searchWord" type="text" />
			<input type="submit" value="검색">
			<button type="button" 
			onclick="location.href='${pageContext.request.contextPath }/review/ReviewWrite.do'">글쓰기</button>
		</div>
	</form>
	<!-- 목록 테이블 -->
	<table class="inner" id="boardTable" border="1">
		<tr>
			<td>번호</td>
			<td>상품이미지</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>			
		</tr>
		<c:choose>
			<c:when test="${empty boardlists}">
			<tr>
				<td colspan="5">등록된 게시물이 없습니다</td>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${boardlists}" var="rev" varStatus="loop">
				<tr>
					<td>${rev.rid}</td>
					<td><a href="view.do?rID=${rev.rid}"><img src="../uploads/${rev.rphoto}" width="100"></a></td>														
					<td><a href="view.do?rID=${rev.rid}">${rev.rtitle}</a></td>
					<td>${rev.mid}</td>
					<td>${rev.rrdate}</td>					
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="inner">
		${map.pagingStr}		
	</div>
	</div>	
<%@ include file="/footer/footer.jsp" %>
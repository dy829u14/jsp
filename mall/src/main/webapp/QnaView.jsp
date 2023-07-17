<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>상세보기(View)</h2>
	<table>
		<tr>
			<td>번호</td>
			<td>${dto.qID}</td>
			<td>작성자</td>
			<td>${dto.mID}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${dto.qRDATE}</td>
			<td>조회수</td>
			<td>${dto.qHIT}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${dto.qTITLE}</td>			
		</tr>
		<tr>			
			<td colspan="4"><img src="../uploads/${dto.qFILE}" width="600"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3">${dto.qCONTENT}</td>
		</tr>
		<tr>
			<td colspan="4">
				<button onclick="location.href='./pass.do?mode=edit&qID=${dto.qID}'">수정하기</button>
				<button onclick="location.href='./pass.do?mode=delete&qID=${dto.qID}'">삭제하기</button>				
				<button type="button" 
				onclick="location.href='${pageContext.request.contextPath }/qna/qna.do'">목록보기</button>
			</td>			
		</tr>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		border: 1px solid #333;
		border-collapse: collapse; 
	}
	table td {
		padding: 10px;
		border: 1px solid #333;
	}
</style>
</head>
<%
	request.setCharacterEncoding("utf-8");
%>
<body>
	<jsp:include page="join_header.jsp" flush="false">
		<jsp:param name="title" value="그린컴퓨터 아카데미 회원가입"/>
	</jsp:include>
	<p>클릭엔퍼니는 고객님의 소중한 개인정보를 보호하기 위해 주민등록번호를 수집하지 않습니다</p>
	<form action="join_process.jsp">
		<table>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="userId"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="userPass"></td>
		</tr>
		<tr>
			<td>비밀번호확인</td>
			<td><input type="password" name="userPassCheck"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="text" name="email"> @
				<select name="mailSite">
					<option>선택</option>		
					<option>naver.com</option>		
				</select>
			</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
				<select name="year"><option>1990년</option></select> - 
				<select name="month"><option>월</option><option>2월</option></select> - 
				<select name="day"><option>일</option><option>27일</option></select>
			</td>
		</tr>
		<tr>
			<td>휴대폰번호</td>
			<td>
				<select><option>선택</option><option>010</option></select> - 
				<input type="number" name="phoneNum1"> - <input type="number" name="phoneNum2">
				<button type="submit">인증번호발송</button>
				<button type="submit">인증번호 재발송</button>				
			</td>
		</tr>
		<tr>
			<td>인증번호입력</td>
			<td>
				<input type="number">
				<button type="submit">확인</button>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
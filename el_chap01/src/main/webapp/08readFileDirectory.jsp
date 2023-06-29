<%@page import="java.io.IOException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//message.txt파일의 절대경로
	String filePath = "D:\\jsp\\el_chap01\\src\\main\\webapp\\file\\message.txt";
	char[] buff = new char[128]; //128자씩 끊어서 읽게끔 하기 위함
	int len = -1; //-1은 읽을 값이 없다는 뜻
	try{
		//message.txt로부터 내용을 읽어오는 스트림 생성
		InputStreamReader fr = new InputStreamReader(new FileInputStream(filePath), "UTF-8");
		//message.txt로부터 읽어온 데이터를 out기본개게를 사용해서 출력하기
		while((len = fr.read(buff)) != -1) {
			out.print(new String(buff,0,len));
		}
	}
	catch(IOException e){
		out.print("익셉션 발생 : "+e.getMessage());
	}
	
%>
</body>
</html>
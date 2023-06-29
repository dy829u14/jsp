<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBCConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	JDBCConnect jdbc = new JDBCConnect();
	
	String bookname = request.getParameter("bookname");
	String writer = request.getParameter("writer");
	String company = request.getParameter("company");
	int price = Integer.parseInt(request.getParameter("price"));
	String date = request.getParameter("date");
	
	String sql = "insert into book values(seq_num.nextval,?,?,?,?,?)";
	PreparedStatement psmt = jdbc.con.prepareStatement(sql);				
	psmt.setString(1,bookname);
	psmt.setString(2,writer);
	psmt.setString(3,company);
	psmt.setInt(4,price);
	psmt.setString(5,date);
	int num = psmt.executeUpdate();
	out.println(num);
	jdbc.close();	
	
	response.sendRedirect("/greenbooks/index.jsp");
%>
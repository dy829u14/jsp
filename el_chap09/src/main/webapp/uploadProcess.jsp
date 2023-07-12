<%@page import="fileupload.MyfileDAO"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//getRealPath() --> 물리적 경로를 리턴
	String saveDirectory = application.getRealPath("/uploads");
	int maxPostSize = 1024*1000; //파일 최대 크기
	String encoding = "UTF-8";   //인코딩 방식
	
	try{
		//MultipartRequest객체 생성
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
		
		//파일명 생성
		//myphoto.set.png
		String fileName = mr.getFilesystemName("attachedFile");  //현재파일이름을 받음
		String ext = fileName.substring(fileName.lastIndexOf(".")); //파일확장자
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String newFileName = now+ext; //업로드일시.확장자
		//파일명 변경
		//파일 객체 생성
		File oldFile = new File(saveDirectory+File.separator+fileName);
		File newFile = new File(saveDirectory+File.separator+newFileName);
		oldFile.renameTo(newFile); //파일이름변경
		
		//다른 폼값 처리
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String[] cateArray = mr.getParameterValues("cate");
		StringBuffer cateBuf = new StringBuffer();
		//StringBuffer : 문자열을 추가하거나 변경할때 주로 사용하는 자료형
		//append() : 문자열을 추가
		//toString() : String자료형으로 리턴
		if(cateArray == null) {
			cateBuf.append("선택 없음");
		}else {
			for(String s : cateArray) {
				cateBuf.append(s+", ");
			}
		}
		//DTO생성
		MyfileDTO dto = new MyfileDTO();
		dto.setName(name);
		dto.setTitle(title);
		dto.setCate(cateBuf.toString());
		dto.setOfile(fileName);
		dto.setSfile(newFileName);	
		
		//DAO를 통해 데이터베이스 반영
		MyfileDAO dao = new MyfileDAO();
		dao.insertFile(dto);
		dao.close();
		
		//파일 목록 jsp로 리다이렉션
		response.sendRedirect("filelist.jsp");
	}
	catch(Exception e) {
		e.printStackTrace();
		request.setAttribute("errorMessage", "파일 업로드 오류");
		request.getRequestDispatcher("fileUpload").forward(request, response);
	}
	
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
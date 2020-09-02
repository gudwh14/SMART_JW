<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	String userID = null;
	String userName = null;
	String userPW = null;
	String p_number = null;
	String gname = null;

	
	String saveDirectory = application.getRealPath("/Upload");
	
	File file = new File(saveDirectory);
	if(!file.exists()) {
		file.mkdirs();
	}

	// 2-2] 업로드 최대 파일 용량 설정(바이트 단위)
	// 파일 여러개 업로드시 각각의 용량을 합친 크기가 최대 용량임.
	int maxPostSize = 1024 * 500; // 500Kb

	// 2-3] 인코딩 타입 설정
	String encoding = "UTF-8";

	// 2-4] 파일명이 중복된 경우 파일명을 재정희하도록 FileRenamePolicy 객체 얻기 (인덱스 자동 부여)
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

	// 3] MultipartRequest 객체 생성
	MultipartRequest mr = null;
	
	String filename1="";

	
	try{
		mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		
		// 4] 기타 폼의 하위 요소(파라미터)받기
		// MultipartRequest 객체로 받는다.
		// 이 객체가 request 를 가로채기 때문에 일반적인 request 객체로 파라미터 못받음 (중요!)
		userID = mr.getParameter("id");
		userName = mr.getParameter("name");
		userPW = mr.getParameter("pw");
		p_number = mr.getParameter("p_num");
		gname = mr.getParameter("g_name");
		
		Enumeration files = mr.getFileNames();
		String file1 = (String)files.nextElement();
		filename1 = mr.getFilesystemName(file1);
		
	} catch(Exception e){
		e.printStackTrace();
	} 
		
	String directory = saveDirectory + "/" + gname + "/" + userName;
	File file2 = new File(directory);
	
	if(!file2.exists()) {
		file2.mkdirs();
	}
	
	File file_1 = new File(saveDirectory + "/" + filename1); // 기존 1번째 파일
	
	if(file_1.renameTo(new File(directory+"/"+filename1))) {
		file_1.delete();
	}
	
	
	UserDAO userDAO = new UserDAO();
	
	int result = userDAO.register(userName, userID, userPW, p_number, gname, filename1);

	
	
	if(result == 1){ 
		out.println("<script>"); 
		out.println(" alert('회원 가입이 되었습니다! \\n 로그인 페이지로 이동합니다.') "); 
		out.println("</script>");
		response.sendRedirect("../../index.jsp");
	}
	else{ out.println("<script>"); 
	out.println(" alert('회원 가입 실패  \\n 다시 한 번 시도해주십시오.' )"); 
	out.println(" window.history.back(); "); 
	out.println("</script>"); 
	}

	
%>

</body>
</html>
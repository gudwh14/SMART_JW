<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="user.EnterpriseDTO"%>
<%@ page import="user.EnterpriseDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 1] 한글처리 (POST 방식이기 때문에)
		request.setCharacterEncoding("UTF-8");
	
		 // 2] MultipartRequest 객체 생성자의 인자들을 각각 변수로 만들어주는 작업
		// 2-1] 업로드할 서버의 물리적 디렉토리를 얻어옴
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
		String regist_num = null; // 사업자 등록번호
		String enterprise_name = null; // 기관(업체)명
		String leader_name = null; // 대표자 이름
		String enterprise_upload = null;  // 사업자등록증 파일 경로
		String leader_upload = null; // 대표자확인서 파일 경로
		String roadAddress = null; // 도로명 주소
		String detailAddress = null; // 상세 주소
		
		String filename1="";
		String filename2="";
	
		
		try{
			mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
			
			// 4] 기타 폼의 하위 요소(파라미터)받기
			// MultipartRequest 객체로 받는다.
			// 이 객체가 request 를 가로채기 때문에 일반적인 request 객체로 파라미터 못받음 (중요!)
			regist_num = mr.getParameter("Regist_Num"); // 사업자 등록번호
			enterprise_name = mr.getParameter("Enterprise_Name"); // 기관(업체)명
			leader_name = mr.getParameter("Leader_Name"); // 대표자 이름
			roadAddress = mr.getParameter("roadAddress"); // 도로명 주소
			detailAddress = mr.getParameter("detailAddress"); // 상세 주소
			
			Enumeration files = mr.getFileNames(); // 역순
			String file1 = (String)files.nextElement();
			filename1 = mr.getFilesystemName(file1);
			String file2 = (String)files.nextElement();
			filename2 = mr.getFilesystemName(file2);
			
			enterprise_upload = filename2;  // 사업자등록증 파일 경로
			leader_upload = filename1; // 대표자확인서 파일 경로
			
		} catch(Exception e){
			e.printStackTrace();
		} 
		
		System.out.println(regist_num);
		System.out.println(enterprise_name);
		System.out.println(leader_name);
		System.out.println(enterprise_upload);
		System.out.println(leader_upload);
		System.out.println(roadAddress);
		System.out.println(detailAddress);
		
		String directory = saveDirectory + "/" + enterprise_name;
		File file2 = new File(directory);
		
		if(!file2.exists()) {
			file2.mkdirs();
		}
		
		File file_1 = new File(saveDirectory + "/" + filename1); // 기존 1번째 파일
		File file_2 = new File(saveDirectory + "/" + filename2); // 기존 2번째 파일
		
		if(file_1.renameTo(new File(directory+"/"+filename1))) {
			file_1.delete();
		}
		if(file_2.renameTo(new File(directory+"/"+filename2))) {
			file_2.delete();
		}
		
		
		EnterpriseDAO enterpriseDAO = new EnterpriseDAO();
		int result = enterpriseDAO.register(regist_num, enterprise_name, leader_name, 
				                            enterprise_upload, leader_upload, roadAddress,
				                            detailAddress);
	
		if(result == 1 ) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('기업 등록 성공!')");
			script.println("</script>");
			response.sendRedirect("../Register_003.jsp");
			return;
		}
	%>
</body>
</html>
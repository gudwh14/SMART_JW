<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="apply.PersonDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
		// 1] 한글처리 (POST 방식이기 때문에)
		request.setCharacterEncoding("UTF-8");
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		
		String s_time = format.format(time);
	
		 // 2] MultipartRequest 객체 생성자의 인자들을 각각 변수로 만들어주는 작업
		// 2-1] 업로드할 서버의 물리적 디렉토리를 얻어옴
		String g_name = session.getAttribute("g_name").toString();
		String saveDirectory = application.getRealPath("/Upload/") + g_name;
		
		File file = new File(saveDirectory);
		if(!file.exists()) {
			file.mkdirs();
		}
	
		// 2-2] 업로드 최대 파일 용량 설정(바이트 단위)
		// 파일 여러개 업로드시 각각의 용량을 합친 크기가 최대 용량임.
		int maxPostSize = 1024 * 500 * 10; // 5000Kb
	
		// 2-3] 인코딩 타입 설정
		String encoding = "UTF-8";
	
		// 2-4] 파일명이 중복된 경우 파일명을 재정희하도록 FileRenamePolicy 객체 얻기 (인덱스 자동 부여)
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	
		// 3] MultipartRequest 객체 생성
		MultipartRequest mr = null;
		String area = null;
		String applyName = null;
		String birth = null;
		String gender = null;
		String pledge = null;
		String certification = null;
		String phone = null;
		String u_name = null;
		u_name = session.getAttribute("u_name").toString();
		int status = 0;
		String photo = null;
		
		String filename1=""; // photo file
		String filename2=""; // plede file
		String filename3=""; // certification file
	
		
		try{
			mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
			
			// 4] 기타 폼의 하위 요소(파라미터)받기
			// MultipartRequest 객체로 받는다.
			// 이 객체가 request 를 가로채기 때문에 일반적인 request 객체로 파라미터 못받음 (중요!)
			area = mr.getParameter("area");
			applyName = mr.getParameter("name");
			birth = mr.getParameter("birth");
			gender = mr.getParameter("gender_radio");
			phone = mr.getParameter("p_number");

			
			Enumeration files = mr.getFileNames();
			String file1 = (String)files.nextElement();
			filename1 = mr.getFilesystemName(file1);
			String file2 = (String)files.nextElement();
			filename2 = mr.getFilesystemName(file2);
			String file3 = (String)files.nextElement();
			filename3 = mr.getFilesystemName(file3);
			
			
			photo = filename3;  // 얼굴사진 파일 경로
			pledge = filename2; // 본인서약서 파일 경로
			certification = filename1; // 재직증명서 파일 경로
			
		} catch(Exception e){
			e.printStackTrace();
		} 
		
		
		System.out.println("g_name : " + g_name);
		System.out.println("u_name : " + u_name);
		String directory = saveDirectory + "/" + u_name + "/PersonApply/" + applyName;
		File file2 = new File(directory);
		
		if(!file2.exists()) {
			file2.mkdirs();
		}
		
		File file_1 = new File(saveDirectory + "/" + filename1); // 기존 1번째 파일
		File file_2 = new File(saveDirectory + "/" + filename2); // 기존 2번째 파일
		File file_3 = new File(saveDirectory + "/" + filename3); // 기존 3번째 파일
		
		if(file_1.renameTo(new File(directory+"/"+filename1))) {
			file_1.delete();
		}
		if(file_2.renameTo(new File(directory+"/"+filename2))) {
			file_2.delete();
		}
		if(file_3.renameTo(new File(directory+"/"+filename3))) {
			file_3.delete();
		}
		
		
		PersonDAO personDAO = new PersonDAO();
		int result = personDAO.apply(area,applyName, birth, gender, pledge, certification, phone, u_name, status, photo,s_time);
		String apply = request.getParameter("apply");
		String location = "";
	
		if(result == 1 ) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('사람 출입신청 성공')");
			script.println("</script>");
			if(apply.equals("1")) {
				location = "../VehicleApply.jsp";
			}
			else if(apply.equals("2")) {
				location = "../index.jsp";
			}
			response.sendRedirect(location);
			session.removeAttribute("u_name");
			session.removeAttribute("g_name");
			return;
		}
	%>

</body>
</html>
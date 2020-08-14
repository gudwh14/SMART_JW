<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="user.EnterpriseDTO"%>
<%@ page import="user.EnterpriseDAO"%>
<%@ page import="java.io.PrintWriter"%>
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
	
		/* // 2] MultipartRequest 객체 생성자의 인자들을 각각 변수로 만들어주는 작업
		// 2-1] 업로드할 서버의 물리적 디렉토리를 얻어옴
		String saveDirectory = application.getRealPath("/Upload");
	
		// 2-2] 업로드 최대 파일 용량 설정(바이트 단위)
		// 파일 여러개 업로드시 각각의 용량을 합친 크기가 최대 용량임.
		int maxPostSize = 1024 * 500; // 500Kb
	
		// 2-3] 인코딩 타입 설정
		String encoding = "UTF-8";
	
		// 2-4] 파일명이 중복된 경우 파일명을 재정희하도록 FileRenamePolicy 객체 얻기 (인덱스 자동 부여)
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	
		// 3] MultipartRequest 객체 생성
		MultipartRequest mr = null;
	
		String name = null;
		String title = null;
		StringBuffer buffer = new StringBuffer();
		try{
			mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
			
			// 4] 기타 폼의 하위 요소(파라미터)받기
			// MultipartRequest 객체로 받는다.
			// 이 객체가 request 를 가로채기 때문에 일반적인 request 객체로 파라미터 못받음 (중요!)
			name = mr.getParameter("name");
			title = mr.getParameter("title");
			String[] inters = mr.getParameterValues("inter");
			for(String inter : inters){
				buffer.append(inter);
			}
		}
		catch(IOException e){
			// 에러내용을 리퀘스트 영역에 저장
			request.setAttribute("error", "최대파일 용량을(500KB)초과하였습니다.");
			request.getRequestDispatcher("UploadForm.jsp").forward(request, response);
		} */
		
		String regist_num = (String)request.getParameter("Regist_Num"); // 사업자 등록번호
		String enterprise_name = (String)request.getParameter("Enterprise_Name"); // 기관(업체)명
		String leader_name = (String)request.getParameter("Leader_Name"); // 대표자 이름
		String enterprise_upload = (String)request.getParameter("ex_filename1");  // 사업자등록증 파일 경로
		String leader_upload = (String)request.getParameter("ex_filename_2"); // 대표자확인서 파일 경로
		String roadAddress = (String)request.getParameter("roadAddress"); // 도로명 주소
		String detailAddress = (String)request.getParameter("detailAddress"); // 상세 주소
		
		EnterpriseDAO enterpriseDAO = new EnterpriseDAO();
		int result = enterpriseDAO.register(regist_num, enterprise_name, leader_name, 
				                            enterprise_upload, leader_upload, roadAddress,
				                            detailAddress);
	
		if(result == 1 ) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('기업 등록 성공!')");
			script.println("</script>");
			return;
		}
	%>
</body>
</html>
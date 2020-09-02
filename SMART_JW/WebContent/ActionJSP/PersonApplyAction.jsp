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
		// 1] �ѱ�ó�� (POST ����̱� ������)
		request.setCharacterEncoding("UTF-8");
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		
		String s_time = format.format(time);
	
		 // 2] MultipartRequest ��ü �������� ���ڵ��� ���� ������ ������ִ� �۾�
		// 2-1] ���ε��� ������ ������ ���丮�� ����
		String g_name = session.getAttribute("g_name").toString();
		String saveDirectory = application.getRealPath("/Upload/") + g_name;
		
		File file = new File(saveDirectory);
		if(!file.exists()) {
			file.mkdirs();
		}
	
		// 2-2] ���ε� �ִ� ���� �뷮 ����(����Ʈ ����)
		// ���� ������ ���ε�� ������ �뷮�� ��ģ ũ�Ⱑ �ִ� �뷮��.
		int maxPostSize = 1024 * 500 * 10; // 5000Kb
	
		// 2-3] ���ڵ� Ÿ�� ����
		String encoding = "UTF-8";
	
		// 2-4] ���ϸ��� �ߺ��� ��� ���ϸ��� �������ϵ��� FileRenamePolicy ��ü ��� (�ε��� �ڵ� �ο�)
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	
		// 3] MultipartRequest ��ü ����
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
			
			// 4] ��Ÿ ���� ���� ���(�Ķ����)�ޱ�
			// MultipartRequest ��ü�� �޴´�.
			// �� ��ü�� request �� ����ä�� ������ �Ϲ����� request ��ü�� �Ķ���� ������ (�߿�!)
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
			
			
			photo = filename3;  // �󱼻��� ���� ���
			pledge = filename2; // ���μ��༭ ���� ���
			certification = filename1; // �������� ���� ���
			
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
		
		File file_1 = new File(saveDirectory + "/" + filename1); // ���� 1��° ����
		File file_2 = new File(saveDirectory + "/" + filename2); // ���� 2��° ����
		File file_3 = new File(saveDirectory + "/" + filename3); // ���� 3��° ����
		
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
			script.println("alert('��� ���Խ�û ����')");
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
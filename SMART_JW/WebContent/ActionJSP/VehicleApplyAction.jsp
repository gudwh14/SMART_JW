<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="apply.VehicleDTO"%>
<%@ page import="apply.VehicleDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
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
		request.setCharacterEncoding("UTF-8");
		VehicleDAO vehicleDAO = new VehicleDAO();
		HashMap<String, String> data = vehicleDAO.select_gname(session.getAttribute("userID").toString());
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		
		String s_time = format.format(time);
		
	
		String saveDirectory = application.getRealPath("/Upload/") + data.get("gname") + "/" + data.get("userName") + "/VehicleApply";
		
		String area = null;
		String carNo = null;
		String carType = null;
		String own = null;
		String ownName = null;
		String driverName = null;
		String Registration = null;
		
		File file = new File(saveDirectory);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		int maxPostSize = 1024 * 500 * 10; // 5000Kb
		
		String encoding = "UTF-8";
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest mr = null;
		
		String filename = "";
		
		try {
			mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
			
			area = mr.getParameter("area");
			carNo = mr.getParameter("carNo");
			carType = mr.getParameter("carType");
			own = mr.getParameter("own");
			ownName = mr.getParameter("ownerName");
			driverName = mr.getParameter("driverName");
			
			Enumeration files = mr.getFileNames();
			String file1 = (String)files.nextElement();
			filename = mr.getFilesystemName(file1);
			Registration =  filename;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String directory = saveDirectory + "/"  + driverName;
		File file2 = new File(directory);
		if(!file2.exists()) {
			file2.mkdirs();
		}
		
		File file_1 = new File(saveDirectory + "/"+ filename);
		
		if(file_1.renameTo(new File(directory + "/" + filename))) {
			file_1.delete();
		}
		
		
		int result = vehicleDAO.apply(session.getAttribute("userName").toString(),area,carNo, carType, own, ownName, driverName, Registration,s_time);
		
		if(result == -1) {
			
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('차량 출입신청 성공')");
			script.println("</script>");
			response.sendRedirect("../index.jsp");
			return;
		}
	%>
</body>
</html>
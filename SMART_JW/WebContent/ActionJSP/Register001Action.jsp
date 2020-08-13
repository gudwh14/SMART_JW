<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String reg_radio = request.getParameter("reg_radio");
		String URL = null;
		
		if(reg_radio.equals("company+admin")) {
			URL = "../Register_002.jsp";
		}
		else if(reg_radio.equals("admin")) {
			URL = "../Register_003.jsp";
		}
		
		response.sendRedirect(URL);
	%>
</body>
</html>
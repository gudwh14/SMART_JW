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
		
		String apply = request.getParameter("apply");
		String location = "";
		if(apply.equals("1")) {
			location = "../../PersonApply.jsp?apply=1";
		}
		else if(apply.equals("2")) {
			location = "../../PersonApply.jsp?apply=2";
		}
		else if(apply.equals("3")) {
			location = "../../VehicleApply.jsp?apply=3";
		}
		
		response.sendRedirect(location);
	%>
</body>
</html>
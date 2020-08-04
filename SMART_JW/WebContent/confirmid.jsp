<%@page import="ajax.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		MemberDAO md = MemberDAO.getInstance();
		int result = md.confirm(id);
		if(result ==0){
			out.println("사용할 수 있는 아이디 입니다.");
		}else{
			out.println("이미 있는 아이디 입니다. 다른 것을 사용해주십시오.");
		}
	%>
</body>
</html>
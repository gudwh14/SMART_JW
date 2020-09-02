<%@ page import="user.confirm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>confirmid2.jsp</title>
</head>
<script>
	function apply(id){
		window.opener.document.regForm.userID.value=id;
		window.close();
	}
	
</script>

<body>
	<div style="text-align: center">
		<h3>아이디 중복 확인 결과</h3>
	</div>
	<%
		String id = request.getParameter("id"); 
		confirm md = confirm.getinstance();	
		boolean result = md.compare(id);
		out.println(id);
	
		if(result == true){
			out.println("사용할 수 있는 아이디 입니다.");
			out.println("<a href='javascript:apply(\"" + id + "\")'>[적용]</a>");
		}

		else{
			out.println("이미 있는 아이디 입니다. 다른 ID를 사용해주세요.");
		}
	%>


	<hr> <a href="javascript:history.back()">[초기화]</a> 
	&nbsp; &nbsp; 
	<a href="javascript:window.close()">[창닫기]</a>

</body>
</html>
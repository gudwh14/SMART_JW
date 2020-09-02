<%@ page import="user.confirm"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>confirm</title>
</head>
<script>	
function apply(id){
	window.opener.document.regForm.gname.value=id;
	window.close();
}
</script>

<body>
	<div style="text-align: center">
		<h3>기업 정보 </h3>
	</div>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("gname");
		confirm md = confirm.getinstance();	
		ArrayList<String> list = new ArrayList<String>();
		list = md.compare_en(id);
		
		if(list.size()==0)
		{
			out.println("해당 기업이 존재하지 않습니다.");
		}
		else{
			for(int i=0;i<list.size();i++)
			{
				out.println("<a href='javascript:apply(\"" +list.get(i) + "\")'> " + list.get(i) + "</a><br>");
				out.println("\n");
				
			}
		}			
		
	%>


	<hr> <a href="javascript:history.back()">[초기화]</a> 
	&nbsp; &nbsp; 
	<a href="javascript:window.close()">[창닫기]</a>




</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="apply.AreaDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function apply(area2){
		window.opener.document.Form.area.value=area2;
		window.close();
	}
	
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		AreaDAO areaDAO = new AreaDAO();
		ArrayList<String> data = areaDAO.load();
		
		if(data.size()==0)
		{
			out.println("출입가능 지역이 없습니다.");
		}
		else{
			for(int i=0;i<data.size();i++)
			{
				out.println("<a href='javascript:apply(\"" +data.get(i) + "\")'> " + data.get(i) + "</a><br>");
				out.println("\n");
				
			}
		}		
	%>
</body>
</html>
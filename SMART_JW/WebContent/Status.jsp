<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="status.StatusDAO"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width initial-scale=1 shrink-to-fit=no">
	<link rel="stylesheet" href="Resource/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="Resource/vendor/bootstrap/css/custom.css">
	<title>스마트 항만공사</title>
	
	<script type="text/javascript">
  		function isLogin() {
	  		<%
			if(session.getAttribute("userID")==null) { %>
				
				document.getElementById("login_true").style.display="none";
			
			<%} else { %>
				
				document.getElementById("login_false").style.display="none";
			
			<% } %>
  		}
  		
  		function selected() {
  			var select = document.getElementById("status_sl");
  			select = select.options[select.selectedIndex].value;
  			
  			document.select.submit();
  		}
  	</script>
</head>
<body> 
  <script src="Resource/vendor/jquery/jquery.min.js"></script>
  <script src="Resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<%
		if(session.getAttribute("userID") == null) {
			response.sendRedirect("Login.jsp");
			return;
		}
		
		StatusDAO statusDAO = new StatusDAO();
		int data[] = statusDAO.load_person(session.getAttribute("userName").toString());
		int c_data[] = statusDAO.load_vehicle(session.getAttribute("userName").toString());
	%>

<!-- Navigation -->
  <nav class="navbar navbar-light bg-light static-top">
    <div class="container">
      <a class ="navbar-brand" href="index.jsp">
    		<img class="img-resize" src="Resource/img/logo_icon2.png" style="width:200px; height:80px;"alt="">
      </a>
      <a class="nav-item nav-link" href="#">신청 출입 절차</a>
      <a class="nav-item nav-link" href="AccessApply.jsp">출입허가 신청</a>
      <a class="nav-item nav-link" href="Status.jsp">출입증 현황</a>
      <div id = "login_false">
     	 <a class="btn btn-primary" href="Login.jsp">Sign In</a>
      </div>
      <div id="login_true" >
      	 <h5 style="font-size:20px"><%=session.getAttribute("userID")%>님 환영합니다.</h5>
      </div>
    </div>
  </nav>

 	<div class="status" >
 		<div class="title centor-sort" style="height:45px; margin-top:50px">
 			<h5 class="txtBox01bg" style="width:100px; margin-right:50px;">상태</h5>
 			<h5 class="txtBox01bg" style="width:80px; margin-right:50px;">인원</h5>
 			<h5 class="txtBox01bg" style="width:80px; margin-left:50px;">차량</h5>
 		</div>
 		
 		<div class="title centor-sort" style="height:45px; margin-top:15px">
 			<h5 class="txtBox01bg" style="width:100px; margin-right:50px;">접수대기</h5>
 			<h5 class="txtBox00rd" style="width:80px; margin-right:50px;"><%=data[0]%></h5>
 			<h5 class="txtBox00rd" style="width:80px; margin-left:50px;"><%=c_data[0]%></h5>
 		</div>
 		
 		<div class="title centor-sort" style="height:45px;">
 			<h5 class="txtBox01bg" style="width:100px; margin-right:50px;">심의대기</h5>
 			<h5 class="txtBox00rd" style="width:80px; margin-right:50px;"><%=data[1]%></h5>
 			<h5 class="txtBox00rd" style="width:80px; margin-left:50px;"><%=c_data[1]%></h5>
 		</div>
 		
 		<div class="title centor-sort" style="height:45px;">
 			<h5 class="txtBox01bg" style="width:100px; margin-right:50px;">반려</h5>
 			<h5 class="txtBox00rd" style="width:80px; margin-right:50px;"><%=data[2]%></h5>
 			<h5 class="txtBox00rd" style="width:80px; margin-left:50px;"><%=c_data[2]%></h5>
 		</div>
 		
 		<div class="title centor-sort" style="height:45px;">
 			<h5 class="txtBox01bg" style="width:100px; margin-right:50px;">발급대기</h5>
 			<h5 class="txtBox00rd" style="width:80px; margin-right:50px;"><%=data[3]%></h5>
 			<h5 class="txtBox00rd" style="width:80px; margin-left:50px;"><%=c_data[3]%></h5>
 		</div>
 		
 		<div class="title centor-sort" style="height:45px;">
 			<h5 class="txtBox01bg" style="width:100px; margin-right:50px;">발급완료</h5>
 			<h5 class="txtBox00rd" style="width:80px; margin-right:50px;"><%=data[4]%></h5>
 			<h5 class="txtBox00rd" style="width:80px; margin-left:50px;"><%=c_data[4]%></h5>
 		</div>
 	</div>
 	
 	<form name = "select" action="Status.jsp">
 	<div class="centor-sort" style="width:350px; margin:0 auto; margin-top:40px">
		<select name='status_sl' id ="status_sl" onchange="selected()">
			<option value='' selected>--상태--</option>
		  	<option value='0'>접수대기</option>
		  	<option value='1'>심의대기</option>
		  	<option value='2'>반려</option>
		  	<option value='3'>발급대기</option>
		  	<option value='4'>발급완료</option>
		</select>
	</div>
	</form>
 	
 	<%
 	String select;
	ArrayList<HashMap<String, Object>> person_detail;
	ArrayList<HashMap<String, Object>> vehicle_detail;
	if(request.getParameter("status_sl") !=null) {
		select = request.getParameter("status_sl");
		String a = "";
		switch(request.getParameter("status_sl").toString()) {
			case "0" :
				a="접수대기";
				break;
			case "1" :
				a="심의대기";
				break;
			case "2" :
				a="반려";
				break;
			case "3" :
				a="발급대기";
				break;
			case "4":
				a="발급완료";
				break;
		}

		person_detail = statusDAO.detail_person(session.getAttribute("userName").toString(), Integer.parseInt(select));
		vehicle_detail = statusDAO.detail_vehicle(session.getAttribute("userName").toString(), Integer.parseInt(select));
		out.println("<div class='title centor-sort'style='height:45px; margin-top:10px;'>");
		out.println("<h5 class='txtBox01rd' style='width:100px;'>"+a+"</h5>");
		out.println("</div>");
		out.println("<div class='container' style='margin-top:10px'>");
 		out.println("<div class='row justify-content-md-center'>");
 		out.println("<div class='col-md-auto'>");
 		out.println("<h5 class='txtBox05bg' style='width:60px;'>순번</h5>");
 		out.println("</div>");
   		out.println("<div class='col-md-auto'>");
   		out.println("<h5 class='txtBox05bg' style='width:80px;'>이름</h5>");
   		out.println("</div>");
   		out.println("<div class='col-md-auto'>");
   		out.println("<h5 class='txtBox05bg' style='width:100px;'>성별</h5>");
  		out.println("</div>");
  		out.println("<div class='col-md-auto'>");
  		out.println("<h5 class='txtBox05bg' style='width:80px;'>항만 명</h5>");
   		out.println("</div>");
   		out.println("<div class='col-md-auto'>");
   		out.println("<h5 class='txtBox05bg' style='width:85px;'>일자</h5>");
   		out.println("</div>");
   		out.println("<div class='col-md-auto'>");
   		out.println("<h5 class='txtBox05bg' style='width:80px;'>상태</h5>");
   		out.println("</div>");
   		out.println("</div>");
   		if(person_detail.size()==0) {
				out.println("<h4 style='text-align:center; margin:10px'>신청내역이 존재 하지 않습니다</h4>");
		}
   		for(int i = 0; i<person_detail.size(); i++) {
   			HashMap<String, Object> data2 = person_detail.get(i);
	  		out.println("<div class='row justify-content-md-center'>");
	    	out.println("<div class='col-md-auto'>");
	    	out.println("<h5 class='txtBox06bg' style='width:60px;'>"+data2.get("id")+"</h5>");
	    	out.println("</div>");
	    	out.println("<div class='col-md-auto'>");
	    	out.println("<h5 class='txtBox06bg' style='width:80px;'>"+data2.get("name")+"</h5>");
	    	out.println("</div>");
	    	out.println("<div class='col-md-auto'>");
	    	out.println("<h5 class='txtBox06bg' style='width:100px;'>"+data2.get("gender")+"</h5>");
	    	out.println("</div>");
	    	out.println("<div class='col-md-auto'>");
	    	out.println("<h5 class='txtBox06bg' style='width:80px;'>"+data2.get("area")+"</h5>");
	    	out.println("</div>");
	    	out.println("<div class='col-md-auto'>");
	    	out.println("<h5 class='txtBox06bg' style='width:85px;'>"+data2.get("date")+"</h5>");
	    	out.println("</div>");
	    	out.println("<div class='col-md-auto'>");
	    	out.println("<h5 class='txtBox06bg' style='width:80px;'>"+data2.get("status")+"</h5>");
	    	out.println("</div>");
	    	out.println("</div>");
  		}
    	out.println("</div>");
    	
    	out.println("<div class='container' style='margin-top:10px'>");
 		out.println("<div class='row justify-content-md-center'>");
 		out.println("<div class='col-md-auto'>");
 		out.println("<h5 class='txtBox05bg' style='width:60px;'>순번</h5>");
 		out.println("</div>");
   		out.println("<div class='col-md-auto'>");
   		out.println("<h5 class='txtBox05bg' style='width:80px;'>기업명</h5>");
   		out.println("</div>");
   		out.println("<div class='col-md-auto'>");
   		out.println("<h5 class='txtBox05bg' style='width:80px;'>운전자 성명</h5>");
   		out.println("</div>");
   		out.println("<div class='col-md-auto'>");
   		out.println("<h5 class='txtBox05bg' style='width:100px;'>차량번호</h5>");
  		out.println("</div>");
  		out.println("<div class='col-md-auto'>");
  		out.println("<h5 class='txtBox05bg' style='width:80px;'>항만 명</h5>");
   		out.println("</div>");
   		out.println("<div class='col-md-auto'>");
   		out.println("<h5 class='txtBox05bg' style='width:85px;'>일자</h5>");
   		out.println("</div>");
   		out.println("<div class='col-md-auto'>");
   		out.println("<h5 class='txtBox05bg' style='width:80px;'>상태</h5>");
   		out.println("</div>");
   		out.println("</div>");
   		if(vehicle_detail.size()==0) {
			out.println("<h4 style='text-align:center; margin:10px'>신청내역이 존재 하지 않습니다</h4>");
	}
   		for(int i = 0; i<vehicle_detail.size(); i++) {
   			HashMap<String, Object> data2 = vehicle_detail.get(i);
	  		out.println("<div class='row justify-content-md-center'>");
	    	out.println("<div class='col-md-auto'>");
	    	out.println("<h5 class='txtBox06bg' style='width:60px;'>"+vehicle_detail.size()+"</h5>");
	    	out.println("</div>");
	    	out.println("<div class='col-md-auto'>");
	    	out.println("<h5 class='txtBox06bg' style='width:80px;'>"+data2.get("gname")+"</h5>");
	    	out.println("</div>");
	    	out.println("<div class='col-md-auto'>");
	    	out.println("<h5 class='txtBox06bg' style='width:80px;'>"+data2.get("driverName")+"</h5>");
	    	out.println("</div>");
	    	out.println("<div class='col-md-auto'>");
	    	out.println("<h5 class='txtBox06bg' style='width:100px;'>"+data2.get("c_number")+"</h5>");
	    	out.println("</div>");
	    	out.println("<div class='col-md-auto'>");
	    	out.println("<h5 class='txtBox06bg' style='width:80px;'>"+data2.get("area")+"</h5>");
	    	out.println("</div>");
	    	out.println("<div class='col-md-auto'>");
	    	out.println("<h5 class='txtBox06bg' style='width:85px;'>"+data2.get("date")+"</h5>");
	    	out.println("</div>");
	    	out.println("<div class='col-md-auto'>");
	    	out.println("<h5 class='txtBox06bg' style='width:80px;'>"+data2.get("status")+"</h5>");
	    	out.println("</div>");
	    	out.println("</div>");
  		}
    	out.println("</div>");
	}
 	%>
	
	<!-- 하단 footer -->
	<div >
		<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
	
	      Copyright ⓒ 스마트 항만공사 All Rights Reserved.
	
	    </footer>
    </div>

	<!-- Bootstrap core JavaScript -->
	  <script>isLogin();</script>

</body>
</html>
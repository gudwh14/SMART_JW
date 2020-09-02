<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  </script>
</head>
<body>
	<%
		if(session.getAttribute("userID") == null) {
			response.sendRedirect("Login.jsp");
		}
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
  
  <div class ="image centor-block " style ="margin-top:120px; max-wdith:0px display: inline-block;text-align: center;">
		<div class = "row centor-sort">
			<div class = "col-md-auto" style="">
				<div class ="1">
				<a href="CommonApply.jsp?apply=1">
					<img class="img centor-block"src="Resource/img/v_a_icon.png" width="200" height="200"alt="">
				</a>
				</div>
				<div class ="a">
					<h5 style ="margin-top:5px">사람 + 차량</h5>
				</div>
			</div>
			
			<div class = "col-md-auto"  style="margin-left:50px">
				<div class ="1">
				<a href="CommonApply.jsp?apply=2">
					<img class="img centor-block"src="Resource/img/admin_icon.png" width="200" height="200"alt="">
				</a>
				</div>
				<div class ="a">
					<h5 style ="margin-top:5px">사람</h5>
				</div>
			</div>
			
			<div class = "col-md-auto"  style="margin-left:50px">
				<div class ="1">
				<a href="CommonApply.jsp?apply=3">
					<img class="img centor-block"src="Resource/img/vehicle_icon.png" width="200" height="200"alt="">
				</a>
				</div>
				<div class ="a">
					<h5 style ="margin-top:5px">차량</h5>
				</div>
			</div>
		</div>
	</div>


	<script>isLogin();</script>
	<!-- Bootstrap core JavaScript -->
  <script src="Resource/vendor/jquery/jquery.min.js"></script>
  <script src="Resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
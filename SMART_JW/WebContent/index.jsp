<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Landing Page - Start Bootstrap Theme</title>

  <!-- Bootstrap core CSS -->
  <link href="Resource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="Resource/vendor/bootstrap/css/custom.css">


  
  <script type="text/javascript">
  	function isLogin() {
  		<%
		if(session.getAttribute("userID")==null) { %>
			
			document.getElementById("login_true").style.display="none";
		
		<%} else { %>
			
			document.getElementById("login_false").style.display="none";
		
		<% } %>
  	}
  	function showSlides() {
  		
  	    var i;
  	    var slides = document.getElementsByClassName("mySlides");
  	    var dots = document.getElementsByClassName("dot");
  	    for (i = 0; i < slides.length; i++) {
  	       slides[i].style.display = "none";  
  	    }
  	    slideIndex++;
  	    if (slideIndex > slides.length) {slideIndex = 1}    
  	    for (i = 0; i < dots.length; i++) {
  	        dots[i].className = dots[i].className.replace(" active", "");
  	    }
  	    slides[slideIndex-1].style.display = "block";  
  	    dots[slideIndex-1].className += " active";
  	  	setTimeout(showSlides, 2000); // Change image every 2 seconds
  	}
  </script>
  
</head>
<style>
	* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #000000;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
</style>
<body>
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
      	 <h5><%=session.getAttribute("userID")%>님 환영합니다.</h5>
      </div>
    </div>
  </nav>

  
  <script>isLogin();</script>

  <!-- Bootstrap core JavaScript -->
  <script src="Resource/vendor/jquery/jquery.min.js"></script>
  <script src="Resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  
  <div class="slideshow-container centor-sort" style="height:600px;">

	<div class="col mySlides fade">
	  <img src="Resource/img/sub_system_01.gif" style="width:100%; height:50%">
	</div>
	
	<div class="mySlides fade">
	  <img src="Resource/img/sub_system_02.gif" style="width:100%; height:40%;">
	</div>
	
	<div class="mySlides fade">
	  <img src="Resource/img/sub_system_03.gif" style="width:100%; height:50%">
	</div>
	
	</div>
	<br>
	
	<div style="text-align:center">
	  <span class="dot"></span> 
	  <span class="dot"></span> 
	  <span class="dot"></span> 
	</div>
	
	<!-- 하단 footer -->
	<div >
		<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
	
	      Copyright ⓒ 스마트 항만공사 All Rights Reserved.
	
	    </footer>
    </div>
	
	<script>var slideIndex = 0;
  	showSlides();
</script>

</body>

</html>

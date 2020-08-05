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
</head>
<body> 

	
<!-- Navigation -->
  <nav class="navbar navbar-light bg-light static-top navbar-expand-lg ">
    <div class="container">
    	<a class ="navbar-brand" href="index.html">
    		<img class="img-resize" src="Resource/img/logo_icon2.png" style="width:200px; height:80px;"alt="">
    	</a>
    	
		<a class="nav-item nav-link active" href="#">신청 출입 절차</a>
        <a class="nav-item nav-link" href="AccessApply.jsp">출입허가 신청</a>
     	<a class="nav-item nav-link" href="Status.jsp">출입증 현황</a>
      	<a class="btn btn-primary" href="Login.jsp">Sign In</a>
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
 			<h5 class="txtBox00rd" style="width:80px; margin-right:50px;">0</h5>
 			<h5 class="txtBox00rd" style="width:80px; margin-left:50px;">2</h5>
 		</div>
 		
 		<div class="title centor-sort" style="height:45px;">
 			<h5 class="txtBox01bg" style="width:100px; margin-right:50px;">심의대기</h5>
 			<h5 class="txtBox00rd" style="width:80px; margin-right:50px;">1</h5>
 			<h5 class="txtBox00rd" style="width:80px; margin-left:50px;">1</h5>
 		</div>
 		
 		<div class="title centor-sort" style="height:45px;">
 			<h5 class="txtBox01bg" style="width:100px; margin-right:50px;">반려</h5>
 			<h5 class="txtBox00rd" style="width:80px; margin-right:50px;">2</h5>
 			<h5 class="txtBox00rd" style="width:80px; margin-left:50px;">2</h5>
 		</div>
 		
 		<div class="title centor-sort" style="height:45px;">
 			<h5 class="txtBox01bg" style="width:100px; margin-right:50px;">발급대기</h5>
 			<h5 class="txtBox00rd" style="width:80px; margin-right:50px;">0</h5>
 			<h5 class="txtBox00rd" style="width:80px; margin-left:50px;">0</h5>
 		</div>
 		
 		<div class="title centor-sort" style="height:45px;">
 			<h5 class="txtBox01bg" style="width:100px; margin-right:50px;">발급완료</h5>
 			<h5 class="txtBox00rd" style="width:80px; margin-right:50px;">3</h5>
 			<h5 class="txtBox00rd" style="width:80px; margin-left:50px;">3</h5>
 		</div>
 	</div>
 	
	<div class="title centor-sort" style="height:45px; margin-top:50px;">
 		<h5 class="txtBox01rd" style="width:100px;">접수대기</h5>
 	</div>
 	
 	<div class="container" style="margin-top:10px">
 		 <div class="row justify-content-md-center">
    		<div class="col-md-auto">
   			   <h5 class="txtBox05bg" style="width:60px;">순번</h5>
   			 </div>
   			<div class="col-md-auto">
   			   <h5 class="txtBox05bg" style="width:80px;">업체명</h5>
   			 </div>
   			 <div class="col-md-auto">
   			   <h5 class="txtBox05bg" style="width:100px;">차량번호</h5>
   			 </div>
   			 <div class="col-md-auto">
   			   <h5 class="txtBox05bg" style="width:80px;">항만 명</h5>
   			 </div>
   			 <div class="col-md-auto">
   			   <h5 class="txtBox05bg" style="width:85px;">일자</h5>
   			 </div>
   			 <div class="col-md-auto">
   			   <h5 class="txtBox05bg" style="width:80px;">상태</h5>
   			 </div>
  		</div>
  		<div class="row justify-content-md-center">
    		<div class="col-md-auto">
   			   <h5 class="txtBox06bg" style="width:60px;">1</h5>
   			 </div>
   			<div class="col-md-auto">
   			   <h5 class="txtBox06bg" style="width:80px;">한이음</h5>
   			 </div>
   			 <div class="col-md-auto">
   			   <h5 class="txtBox06bg" style="width:100px;">경기01나1234</h5>
   			 </div>
   			 <div class="col-md-auto">
   			   <h5 class="txtBox06bg" style="width:80px;">여수항</h5>
   			 </div>
   			 <div class="col-md-auto">
   			   <h5 class="txtBox06bg" style="width:85px;">2020-08-03</h5>
   			 </div>
   			 <div class="col-md-auto">
   			   <h5 class="txtBox06bg" style="width:80px;">접수대기</h5>
   			 </div>
   		</div>
	</div>
	
	<!-- 하단 footer -->
	<div >
		<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
	
	      Copyright ⓒ 스마트 항만공사 All Rights Reserved.
	
	    </footer>
    </div>

	<!-- Bootstrap core JavaScript -->
  <script src="Resource/vendor/jquery/jquery.min.js"></script>
  <script src="Resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
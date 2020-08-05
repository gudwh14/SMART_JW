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

<!-- 타이틀 -->
	<h4 style="margin-top:50px; text-align:center">차량 출입 신청</h4>
	
<!-- 차량번호 -->
	<div style="width:350px; margin:0 auto; margin-top:50px">
		<h5 style="font-size:15px">차량번호</h5>
		<div class="form-group">
			<input type="text" name="userID" placeholder="" class="form-control" style="width:200px; font-size:12px; margin-top:10px">
		</div>
	</div>
	
<!-- 차종 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">차종</h5>
		<div class="form-group">
			<input type="text" name="userID" placeholder="" class="form-control" style="width:200px; font-size:12px; margin-top:10px">
		</div>
	</div>
	
<!-- 소유구분 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">소유구분</h5>
		<select name='own'>
		  <option value='' selected>-- 선택 --</option>
		  <option value='my'>자차</option>
		  <option value='company'>회사 차량</option>
		</select>
	</div>

<!-- 소유주명 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">소유주명</h5>
		<div class="form-group">
			<input type="text" name="userID" placeholder="" class="form-control" style="width:200px; font-size:12px; margin-top:10px">
		</div>
	</div>
	
<!-- 운전자 성명 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">운전자 성명</h5>
		<div class="form-group">
			<input type="text" name="userID" placeholder="" class="form-control" style="width:200px; font-size:12px; margin-top:10px">
		</div>
	</div>
	
<!-- 차량등록증 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">차량등록증</h5>
		<div class="form-group">
			<div class="form-inline">
				<input type="text" name="userID" placeholder="" class="form-control" style="width:200px; font-size:12px">
				<button type="submit" class="btn btn-primary" style="margin-left:10px; font-size:12px">업로드</button>
			</div>
		</div>
	</div>

<!-- 취소,다음 -->
	<div class="container mt-5 centor-block" style="max-width:300px display: inline-block;text-align: center;">
		<button type="submit" class="btn btn-secondary btn-sm" style="width:100px">취소</button>
		<button type="submit" class="btn btn-success btn-sm" style="margin-left:10px; width:100px">다음</button>
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
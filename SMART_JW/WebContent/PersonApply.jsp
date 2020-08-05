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
    	<a class ="navbar-brand" href="#">
    		<img class="img-resize" src="Resource/img/logo_icon2.png" style="width:200px; height:80px;"alt="">
    	</a>
    	
		<a class="nav-item nav-link active" href="#">신청 출입 절차</a>
        <a class="nav-item nav-link" href="#">출입허가 신청</a>
     	<a class="nav-item nav-link" href="#">출입증 현황</a>
      	<a class="btn btn-primary" href="#">Sign In</a>
  	</div>
  </nav>
	
<!-- 타이틀 -->
	<h4 style="margin-top:50px; text-align:center">인원 출입 신청</h4>
	
<!-- 업체정보 칸 -->
<div class="row">
	<div class="1" style="width:auto; height:200px;margin-top:20px;margin-left:50px; border:2px solid black;">
		<div style="margin:20px;">
			<div class="row form-inline">
				<h5>업체명 　　　　</h5>
				<h5 class="form-control" style="margin-left:10px;font-size:12px">123456789101</h5>
			</div>
			<div class="row form-inline">
				<h5>사업자 등록번호</h5>
				<h5 class="form-control" style="margin-left:10px;font-size:12px">123456789101</h5>
			</div>
			<div class="row form-inline">
				<h5>담당자명 　　　</h5>
				<h5 class="form-control" style="margin-left:10px;font-size:12px">123456789101</h5>
			</div>
			<div class="row form-inline">
				<h5>담당자 연락처　</h5>
				<h5 class="form-control" style="margin-left:10px;font-size:12px">123456789101</h5>
			</div>
		</div>
		
	</div>
	
	<div class ="col">
			<div class="row" style="text-align:center">
				<img style="text-align:center; width:150px; height:150px;" class="img-resize" src="Resource/img/logo_icon.png" alt="">
			</div>		
			<div class="row">
				 <button type="submit" class="btn btn-primary" style="font-size:12px">사진등록</button>
			</div>
	</div>
</div>

<!-- 성명 -->
	<div style="width:350px; margin:0 auto; margin-top:50px">
		<h5 style="font-size:15px">성명</h5>
		<div class="form-group">
			<input type="text" name="userID" placeholder="" class="form-control" style="width:200px; font-size:12px; margin-top:10px">
		</div>
	</div>
	
<!-- 생년월일 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">생년월일</h5>
		<div class="form-group">
			<input type="text" name="userID" placeholder="" class="form-control" style="width:200px; font-size:12px; margin-top:10px">
		</div>
	</div>
	
<!-- 성별 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">성별</h5>
		
		<input type="checkbox" name="chk_info" value="M"> 남성
		<input type="checkbox" name="chk_info" value="F"> 여성
	</div>
	
<!-- 본인서약서 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">본인서약서</h5>
		<div class="form-group">
			<div class="form-inline">
				<input type="text" name="userID" placeholder="" class="form-control" style="width:200px; font-size:12px">
				<button type="submit" class="btn btn-primary" style="margin-left:10px; font-size:12px">업로드</button>
			</div>
		</div>
	</div>
	
<!-- 재직증명서 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">4대 보험증서(재직증명서)</h5>
		<div class="form-group">
			<div class="form-inline">
				<input type="text" name="userID" placeholder="" class="form-control" style="width:200px; font-size:12px">
				<button type="submit" class="btn btn-primary" style="margin-left:10px; font-size:12px">업로드</button>
			</div>
		</div>
	</div>

<!-- 전화번호-->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">전화번호</h5>
		<div class="form-group">
			<input type="text" name="userID" placeholder="" class="form-control" style="width:200px; font-size:12px; margin-top:10px">
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
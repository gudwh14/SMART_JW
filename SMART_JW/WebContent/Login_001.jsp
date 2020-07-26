<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width initial-scale=1 shrink-to-fit=no">
	<link rel="stylesheet" href="Resource/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="Resource/vendor/bootstrap/css/custom.css">
	<title>스마트 항만공사</title>
</head>
<body> 
	<div class ="imagecentor-block " style ="max-wdith:150px display: inline-block;text-align: center;">
		 <img class="img centor-block" src="Resource/img/logo_icon.png" width="150" height="150 "alt="">
	</div>
	<div class="container mt-3" style="max-width: 300px;">
		<form method="post" action="./LoginAction.jsp">
			<div class="form-group">
				<label>사업자 등록 번호</label>
				<input type="text" style="width:200px; height:200px;" name="Regist_Num" class="form-control">
			</div>
			<div class="form-group">
				<label>업체(기관)명</label>
				<input type="text" style="width:200px; height:200px;" name="Enterprise_Name" class="form-control">
			</div>
			<div class="form-group">
				<label>대표자 성명</label>
				<input type="text" style="width:200px; height:200px;" name="Leader_Name" class="form-control">
			</div>
			<div class="form-group">
				<label>사업자 등록증</label>
				<input type="text" style="width:200px; height:200px;" name="Regist_Certificate" class="form-control">
				<input type="button" style="width:30px; height:30px;" name="Upload_Button" class="form-control" value="업로드">
			</div>
			<div class="form-group">
				<label>대표자 확인서</label>
				<input type="text" style="width:200px; height:200px;" name="Leader_Certificate" class="form-control">
				<input type="button" style="width:30px; height:30px;" name="Upload_Button" class="form-control" value="업로드">
			</div>
		</form>		
	</div>
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
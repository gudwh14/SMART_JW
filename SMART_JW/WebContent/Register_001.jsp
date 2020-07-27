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
	<!-- 로고 이미지 -->
	<div class ="image centor-block " style ="margin-top:90px; max-wdith:150px display: inline-block;text-align: center;">
		 <img class="img-resize" src="Resource/img/logo_icon2.png" alt="">
	</div>
	
	<!-- 회원가입 TYPE 고르기 -->
	<div class ="image centor-block " style ="margin-top:30px; max-wdith:0px display: inline-block;text-align: center;">
		<div class = "row centor-sort">
			<div class = "col-md-auto" style="margin-right:50px">
				<div class ="1">
						<img class="img" src="Resource/img/company+admin_icon.png" width="200" height="200"alt="">
				</div>
				<div class ="a">
					<input type = "radio" name ="reg_radio"  value="company+admin">업체 + 관리자
				</div>
			</div>
			
			<div class = "col-md-auto"  style="margin-left:50px">
				<div class ="1">
						<img class="img centor-block"src="Resource/img/admin_icon.png" width="200" height="200"alt="">
				</div>
				<div class ="a">
					<input type = "radio" name ="reg_radio"  value="admin">관리자
				</div>
			</div>
		</div>
	</div>

	<!--  -->
	<div class ="container mt-3" style="max-width:300px;">
		<h5>개인정보 수집 및 이용에 대한 약관</h5>
	</div>

	<!-- Bootstrap core JavaScript -->
  <script src="Resource/vendor/jquery/jquery.min.js"></script>
  <script src="Resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
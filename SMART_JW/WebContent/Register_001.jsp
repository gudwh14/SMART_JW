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
	<div class ="image centor-block " style ="margin-top:80px; max-wdith:150px display: inline-block;text-align: center;">
		 <img class="img-resize" src="Resource/img/logo_icon2.png" alt="">
	</div>
	
	<!-- 회원가입 TYPE 고르기 -->
	<div class ="image centor-block " style ="margin-top:20px; max-wdith:0px display: inline-block;text-align: center;">
		<div class = "row centor-sort">
			<div class = "col-md-auto" style="margin-right:50px">
				<div class ="1">
						<img class="img" src="Resource/img/company+admin_icon.png" width="	" height="200"alt="">
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

	<!-- 개인정보 수집동의 -->
	<div class ="1" style="width:350px; margin:0 auto;">
		<input type="checkbox" name="check" value="agree">개인정보 수집 및 이용에 대한 약관
		<div class="text" style="height:auto; border:1px solid gold; margin-top:10px;">
			<div style="wdith:auto;">
				<h4 style="font-size:11px; margin:10px">
				가. 개인정보의 수집 및 이용 목적:<br>
				상시 출입증 발급 신청을 위한 업체(기관)관리자 등록<br>
				나. 개인정보의 수집 및 이용 항목<br>
				○ 필수 항목<br>
				- ID, 이름, 생년월일, 전화번호, 휴대전화번호<br>
				○ 선택 항목<br>
				- 팩스번호, 이메일주소, 직장주소<br>
				다. 개인정보의 보유 및 이용기간 : 업체(기관)관리자 해지 후 3년간<br>
				(다만, 관계 법령 위반에 따른 수사 등이 진행 중인 경우는 해당 수사 종료 시까지)<br>
				※ 신청인은 개인정보 수집 및 이용에 대해 동의를 거부할 수 있으며,<br>
				필수항목의 수집에 동의하지 않을 경우<br>
				항만출입관리시스템을 통한 항만출입신청이 불가합니다.</h4>
			</div>
		</div>
	</div>
	
	<!-- 본인인증 -->
	<div class="2" style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">본인인증</h5>
		<div class="form-group">
			<div class="form-inline">
				<input type="text" name="userID" placeholder="전화번호를 입력해주세요" class="form-control" style="width:200px; font-size:12px">
				<button type="submit" class="btn btn-primary" style="margin-left:10px; font-size:12px">전송</button>
			</div>
			<input type="text" name="userID" placeholder="인증번호" class="form-control" style="width:200px; font-size:12px; margin-top:10px">
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
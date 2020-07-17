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

	<!-- 로고 이미지 -->
	<div >
		<img src="" class="img-reponsive center-block"/>
	</div>
	
	<!-- 로그인 입력창 폼 -->
	<div class="container mt-3" style="max-width: 300px;">
		<form method="post" action="./LoginAction.jsp">
			<div class="form-group">
				<label>아이디</label>
				<input type="text" name="userID" class="form-control">
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" name="userPW" class="form-control">
			</div>
		</form>		
	</div>
	<div class="container mt-3" style="max-width:300px display: inline-block;text-align: center;">
				<button type="submit" class="btn btn-primary">로그인</button>
	</div>
	
	<div class="container mt-3 centor-block" style="max-width:300px display: inline-block;text-align: center;">
		<a class="navbar-text" href="#">ID/PW찾기</a>
		<a class="navbar-text" href="#">회원가입</a>
	</div>
	
	<!-- 하단 footer -->
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">

      Copyright ⓒ 스마트 항만공사 All Rights Reserved.

    </footer>
	<!-- Bootstrap core JavaScript -->
  <script src="Resource/vendor/jquery/jquery.min.js"></script>
  <script src="Resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
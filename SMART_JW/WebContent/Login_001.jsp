<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width initial-scale=1 shrink-to-fit=no">
	<link rel="stylesheet" href="Resource/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="Resource/vendor/bootstrap/css/custom.css">
	<title>½º¸¶Æ® Ç×¸¸°ø»ç</title>
</head>
<body> 
	<!-- ·Î°í ÀÌ¹ÌÁö -->
	<div class ="imagecentor-block " style ="max-wdith:150px display: inline-block;text-align: center;">
		 <img class="img centor-block" src="Resource/img/logo_icon.png" width="150" height="150 "alt="">
	</div>
	
<<<<<<< HEAD
	<!-- ë¡œê·¸ì¸ ìž…ë ¥ì°½ í¼ -->
	<div class="container mt-2">
=======
	<!-- ·Î±×ÀÎ ÀÔ·ÂÃ¢ Æû -->
	<div class="container mt-3" style="max-width: 300px;">
>>>>>>> 1db3709d9e4e67e8165143999ec2986899c9057e
		<form method="post" action="./LoginAction.jsp">
			<div class="form-group">
				<label>»ç¾÷ÀÚ µî·Ï ¹øÈ£</label>
				<input type="text" name="Regist_Num" class="form-control">
			</div>
			<div class="form-group">
				<label>¾÷Ã¼(±â°ü)¸í</label>
				<input type="text" name="Enterprise_Name" class="form-control">
			</div>
			<div class="form-group">
				<label>´ëÇ¥ÀÚ ¼º¸í</label>
				<input type="text" name="Leader_Name" class="form-control">
			</div>
			<div class="form-group">
				<label>»ç¾÷ÀÚ µî·ÏÁõ</label>
				<input type="text" name="Regist_Certificate" class="form-control">
				<input type="button" style="width:30px; height:30px;" name="Upload_Button" class="form-control" value="¾÷·Îµå">
			</div>
			<div class="form-group">
				<label>´ëÇ¥ÀÚ È®ÀÎ¼­</label>
				<input type="text" name="Leader_Certificate" class="form-control">
				<input type="button" style="width:30px; height:30px;" name="Upload_Button" class="form-control" value="¾÷·Îµå">
			</div>
		</form>		
	</div>
	<div >
		<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
	
	      Copyright ¨Ï ½º¸¶Æ® Ç×¸¸°ø»ç All Rights Reserved.
	
	    </footer>
    </div>
	<!-- Bootstrap core JavaScript -->
  <script src="Resource/vendor/jquery/jquery.min.js"></script>
  <script src="Resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
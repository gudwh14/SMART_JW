<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="height=auto width=device-width initial-scale=1 shrink-to-fit=no">
	<link rel="stylesheet" href="Resource/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="Resource/vendor/bootstrap/css/custom.css">
	<title>����Ʈ �׸�����</title>
</head>
<body> 

	<!-- �ΰ� �̹��� -->
	<div class ="image centor-block " style ="margin-top:90px; max-wdith:150px display: inline-block;text-align: center;">
		 <img class="img centor-block" src="Resource/img/logo_icon.png" width="150" height="150 "alt="">
	</div>
	
	<!-- �α��� �Է�â �� -->
	<div class="container mt-3" style="max-width: 300px;">
		<form method="post" action="./LoginAction.jsp">
			<div class="form-group">
				<label>���̵�</label>
				<input type="text" name="userID" class="form-control">
			</div>
			<div class="form-group">
				<label>��й�ȣ</label>
				<input type="password" name="userPW" class="form-control">
			</div>
		</form>		
	</div>
	<div class="container mt-3" style="max-width:300px display: inline-block;text-align: center;">
				<button type="submit" class="btn btn-primary">�α���</button>
	</div>
	
	<div class="container mt-3 centor-block" style="max-width:300px display: inline-block;text-align: center;">
		<a class="navbar-text" href="#">ID/PWã��</a>
		<a class="navbar-text" href="#">ȸ������</a>
	</div>
	
	<!-- �ϴ� footer -->
	<div >
		<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
	
	      Copyright �� ����Ʈ �׸����� All Rights Reserved.
	
	    </footer>
    </div>
	<!-- Bootstrap core JavaScript -->
  <script src="Resource/vendor/jquery/jquery.min.js"></script>
  <script src="Resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
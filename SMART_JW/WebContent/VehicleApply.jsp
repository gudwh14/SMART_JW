<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width initial-scale=1 shrink-to-fit=no">
	<link rel="stylesheet" href="Resource/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="Resource/vendor/bootstrap/css/custom.css">
	<script src="Resource/vendor/jquery/jquery.min.js"></script>
 	<script src="Resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<title>스마트 항만공사</title>
	<script type="text/javascript">
  		function isLogin() {
	  		<%
			if(session.getAttribute("userID")==null) { %>
				
				document.getElementById("login_true").style.display="none";
			
			<%} else { %>
				
				document.getElementById("login_false").style.display="none";
			
			<% } %>
  		}
  		
  		function inputCheck() {
  			var area  = document.getElementById("area").value;
  			var carNo = document.getElementById("carNo").value;
  			var carType = document.getElementById("carType").value;
  			var own = document.getElementById("own");
  			own = own.options[own.selectedIndex].value;
  			var ownerName = document.getElementById("ownerName").value;
  			var driverName = document.getElementById("driverName").value;
  			var carfile = document.getElementById("filename").value;
  			
  			if(carNo.trim()=="") {
  				alert("차량번호를 입력해주세요.");
  			}
  			else if(area.trim()=="") {
  				alert("출입 지역을 선택해 주세요.");
  			}
  			else if(carType.trim()=="") {
  				alert("차종을 입력해주세요.");
  			}
  			else if(own=="") {
  				alert("차량소유를 선택해주세요.");
  			}
  			else if(ownerName.trim()=="") {
  				alert("차량소유자명 을 입력해주세요.");
  			}
  			else if(driverName.trim()=="") {
  				alert("운저자 성명을 입력해주세요.");
  			}
  			else if(carfiie.trim()=="") {
  				alert("차량등록증 파일을 업로드 해주세요.");
  			}
  			else {
  				return true;
  			}
  			return false;
  		}
  		
  		function loadArea() {
  			window.open("ActionJSP/CommonApplyAction/SelectArea.jsp", "win", "width=400, height=350");
  		}
  	</script>
  	
  	<!-- 파일 업로드 SCRIPT -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript">
	   $(document).ready(function(){ 
	      var fileTarget = $('.filebox .upload-hidden'); 
	      fileTarget.on('change', function(){  
	         if(window.FileReader){ 
	            var filename = $(this)[0].files[0].name; } 
	         else {  
	            var filename = $(this).val().split('/').pop().split('\\').pop();} 
	         $(this).siblings('.upload-name').val(filename); 
	      }); 
	   });
	</script>
</head>
<body> 
	<%
		if(session.getAttribute("userID") == null) {
			response.sendRedirect("Login.jsp");
		}
	%>

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
      	 <h5 style="font-size:20px"><%=session.getAttribute("userID")%>님 환영합니다.</h5>
      </div>
    </div>
  </nav>

<!-- 타이틀 -->
	<h4 style="margin-top:50px; text-align:center">차량 출입 신청</h4>

<form name="Form" action="ActionJSP/VehicleApplyAction.jsp" method="post" enctype="multipart/form-data">
<!-- 출입지역 -->
	<div style="width:350px; margin:0 auto; margin-top:50px">
		<h5 style="font-size:15px">출입 지역</h5>
		<div class="form-group">
			<div class="form-inline">
				<input type="text" name="area" id="area" placeholder="" class="form-control" style="width:200px; font-size:12px">
				<input type = "button" value="선택" style="margin-left:10px;color:grey" onclick= "loadArea();">
			</div>
		</div>
	</div>
	
<!-- 차량번호 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">차량번호</h5>
		<div class="form-group">
			<input type="text" name="carNo" id="carNo" placeholder="" class="form-control" style="width:200px; font-size:12px; margin-top:10px">
		</div>
	</div>
	
<!-- 차종 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">차종</h5>
		<div class="form-group">
			<input type="text" name="carType" id="carType" placeholder="" class="form-control" style="width:200px; font-size:12px; margin-top:10px">
		</div>
	</div>
	
<!-- 소유구분 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">소유구분</h5>
		<select name='own' id ="own">
		  <option value='' selected>-- 선택 --</option>
		  <option value='my'>자차</option>
		  <option value='company'>회사 차량</option>
		</select>
	</div>

<!-- 소유주명 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">소유주명</h5>
		<div class="form-group">
			<input type="text" name="ownerName" id="ownerName" placeholder="" class="form-control" style="width:200px; font-size:12px; margin-top:10px">
		</div>
	</div>
	
<!-- 운전자 성명 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">운전자 성명</h5>
		<div class="form-group">
			<input type="text" name="driverName" id="driverName" placeholder="" class="form-control" style="width:200px; font-size:12px; margin-top:10px">
		</div>
	</div>
	
<!-- 차량등록증 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">차량등록증</h5>
		<div class="form-inline">
               <div class="filebox"> 
               <input class="upload-name" value="파일선택" readonly>
                <label for="filename">업로드</label> 
                <input type="file" name="filename" id="filename" class="upload-hidden"> 
                 </div>
            </div>
	</div>

<!-- 취소,다음 -->
	<div class="container mt-5 centor-block" style="max-width:300px display: inline-block;text-align: center;">
		<button type="button" onclick="history.back()" class="btn btn-secondary btn-sm" style="width:100px">취소</button>
		<button type="submit" onclick="return inputCheck()" class="btn btn-success btn-sm" style="margin-left:10px; width:100px">신청</button>
	</div>
</form>

<!-- 하단 footer -->
	<div >
		<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
	
	      Copyright ⓒ 스마트 항만공사 All Rights Reserved.
	
	    </footer>
    </div>


<!-- Bootstrap core JavaScript -->
  <script>isLogin();</script>


</body>
</html>
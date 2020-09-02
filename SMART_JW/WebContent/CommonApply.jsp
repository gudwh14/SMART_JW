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
  			var purpose = document.getElementById("purpose");
  			purpose = purpose.options[purpose.selectedIndex].value;
  			var where = document.getElementById("where");
  			where = where.options[where.selectedIndex].value;
  			var check1 = document.getElementById("check1");
  			var check2 = document.getElementById("check2");
  			

  			
  			if(purpose.trim()=="") {
  				alert("출입목적을 선택해주세요.");
  			}
  			else if(where.trim()=="") {
  				alert("출입증 발급 기관을 선택해주세요.");
  			}
  			else if(!check1.checked) {
  				alert("대표자 확인을 동의해주세요.");
  			}
  			else if(!check2.checked) {
  				alert("개인정보 수집을 동의해주세요.")
  			}
  			else {
  				return true;
  			}
  			
  			return false;
  		}
  		
  	</script>
</head>
<body> 
<%
		if(session.getAttribute("userID") == null) {
			response.sendRedirect("Login.jsp");
		}
		String apply = request.getParameter("apply");
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
	<h4 style="margin-top:50px; text-align:center">공통항목 작성</h4>
	
<form method="post" action="ActionJSP/CommonApplyAction/CommonApplyAction.jsp?apply=<%=apply%>">	
<!-- 출입목적 -->
	<div style="width:350px; margin:0 auto; margin-top:50px">
		<h5 style="font-size:15px">출입목적</h5>
		<select name='purpose' id="purpose">
		  <option value='' selected>-- 선택 --</option>
		  <option value='1'>1</option>
		  <option value='2'>2</option>
		</select>
	</div>
	

	
<!-- 출입증 발급 기관 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">출입증 발급기관</h5>
		<select name='where' id ="where">
		  <option value='' selected>-- 선택 --</option>
		  <option value='1'>스마트항만공사</option>
		</select>
	</div>

<!-- 대표자 확인 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<input type="checkbox" id="check1" name="check1" value="agree"> 대표자 확인
		<h5>소속 직원이 위 출입지역을 출입함으로써 발생되는 보안상의 문제 또는 출입증을 관리함에 있어 출입자와 연대하여 책임질 것을 확인합니다.</h5>

	</div>

<!-- 개인정보 수집동의 -->
	<div class ="1" style="width:350px; margin:0 auto;">
		<input style="margin-top:20px;" type="checkbox" id="check2" name="check2" value="agree"> 개인정보 수집 및 이용에 대한 약관
		<div class="text" style="height:auto; border:1px solid gold; margin-top:10px;">
			<div style="wdith:auto;">
				<h4 style="font-size:11px; margin:10px">
				가. 개인정보의 수집 및 이용 목적:<br>
				상시 출입증 발급 신청을 위한 업체(기관)관리자 등록<br>
				<br>나. 개인정보의 수집 및 이용 항목<br>
				○ 필수 항목<br>
				- 출입 인원 : 소속,성명,생년월일,전화번호,출입목적, 출입지역<br>
				- 출입 차량 : 차량번호, 차종,운전자 성명, 출입목적 , 출입지역<br>
				<br>다. 개인정보의 보유 및 이용기간 : 업체(기관)관리자 해지 후 3년간<br>
				(다만, 관계 법령 위반에 따른 수사 등이 진행 중인 경우는 해당 수사 종료 시까지)<br>
				※ 신청인은 개인정보 수집 및 이용에 대해 동의를 거부할 수 있으며,<br>
				필수항목의 수집에 동의하지 않을 경우<br>
				항만출입관리시스템을 통한 항만출입신청이 불가합니다.</h4>
			</div>
		</div>
	</div>
	
<!-- 취소,다음 -->
	<div class="container mt-5 centor-block" style="max-width:300px display: inline-block;text-align: center;">
		<button type="button" onclick="history.back()"class="btn btn-secondary btn-sm" style="width:100px">취소</button>
		<button onclick="return inputCheck()" type="submit" class="btn btn-success btn-sm" style="margin-left:10px; width:100px">신청하기</button>
	</div>
</form>

<!-- 하단 footer -->
	<div >
		<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
	
	      Copyright ⓒ 스마트 항만공사 All Rights Reserved.
	
	    </footer>
    </div>


  <script>isLogin();</script>
<!-- Bootstrap core JavaScript -->
  <script src="Resource/vendor/jquery/jquery.min.js"></script>
  <script src="Resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
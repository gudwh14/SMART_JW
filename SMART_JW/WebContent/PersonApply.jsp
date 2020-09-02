<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="apply.PersonDAO" %>
<%@ page import ="java.util.HashMap" %>
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
  			var img = document.getElementById("input_img").value;
  			var name = document.getElementById("name").value;
  			var birth = document.getElementById("birth").value;
  			var area  = document.getElementById("area").value;
  			var gender = document.getElementsByName("gender_radio");
  			var gender_flag = "";
  			var filename1 = document.getElementById("filename1").value;
  			var filename2 = document.getElementById("filename2").value;
  			var p_number = document.getElementById("p_number").value;
  			
  			for(var i = 0 ; i<gender.length; i++) {
  				if(gender[i].checked) {
  					gender_flag = gender[i].value;
  				}
  			}
  			
  			if(img.trim()=="") {
  				alert("출입자의 사진을 선택해주세요.");
  			}
  			else if(area.trim()=="") {
  				alert("출입 지역을 선택해 주세요.");
  			}
  			else if(name.trim()=="") {
  				alert("출입자의 이름을 작성해주세요.")
  			}
  			else if(birth.trim()=="") {
  				alert("출입자의 생년월일을 작성해주세요.");
  			}
  			else if(gender_flag.trim()=="") {
  				alert("출입자의 성별을 선택해주세요.");
  			}
  			else if(filename1.trim()=="") {
  				alert("본인서약서를 올려주세요.");
  			}
  			else if(filename2.trim()=="") {
  				alert("재직증명서를 올려주세요.");
  			}
  			else if(p_number.trim()=="") {
  				alert("출입자의 전화번호를 작성해주세요.");
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
	
	 <script type="text/javascript">
        
        var sel_file;
 
        $(document).ready(function() {
            $("#input_img").on("change", handleImgFileSelect);
        }); 
 
        function handleImgFileSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
 
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
 
                sel_file = f;
 
                var reader = new FileReader();
                reader.onload = function(e) {
                    $("#img").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });
        }
 
    </script>
</head>
<body>
	<%!
		HashMap<String, Object> data = new HashMap<>();
	%>

	<%
		String userID = null;
		String apply = request.getParameter("apply");
		
		if(session.getAttribute("userID") == null) {
			response.sendRedirect("Login.jsp");
		}
		else {
			userID = session.getAttribute("userID").toString();
			PersonDAO personDAO = new PersonDAO();
			
			data = personDAO.getEnterprise(userID);
			
			session.setAttribute("g_name", data.get("g_name"));
			session.setAttribute("u_name", data.get("u_name"));
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
	<h4 style="margin-top:50px; text-align:center">인원 출입 신청</h4>
	
<!--  -->
	<h5 style="text-align:center; margin-top:20px">업체(기관)정보</h5>
<!-- 업체정보 칸 -->
	<div class="centor-sort">
		<div class="1" style="width:auto; height:200px; border:2px solid black;">
			<div style="margin:20px;">
				<div class="row form-inline">
					<h5>업체명 　　　　</h5>
					<h5 class="form-control" style="margin-left:10px;font-size:12px"><%=data.get("g_name")%></h5>
				</div>
				<div class="row form-inline">
					<h5>사업자 등록번호</h5>
					<h5 class="form-control" style="margin-left:10px;font-size:12px"><%=data.get("g_number")%></h5>
				</div>
				<div class="row form-inline">
					<h5>담당자명 　　　</h5>
					<h5 class="form-control" style="margin-left:10px;font-size:12px"><%=data.get("u_name")%></h5>
				</div>
				<div class="row form-inline">
					<h5>담당자 연락처　</h5>
					<h5 class="form-control" style="margin-left:10px;font-size:12px"><%=data.get("p_number")%></h5>
				</div>
			</div>
		</div>
	</div>

<form name="Form" action="ActionJSP/PersonApplyAction.jsp?apply=<%=apply%>" method="post" enctype="multipart/form-data">
	<div class="centor-sort" style="margin-top:20px">
		<div id="image_container" style="text-align:center">
			<img id="img" style="text-align:center; width:150px; height:150px;" class="img-resize" src="Resource/img/logo_icon.png" alt="">
		</div>		
	</div>
	
	<div class="centor-sort filebox" >
		<div class="form-inline">
			<input style="width:100px" class="upload-name" value="사진등록" disabled="disabled">
			<label for="input_img">업로드</label>
			<input class="upload-hidden" type="file" name="input_img" id="input_img" accept="image/*"/>
		</div>
	</div>

<!-- 출입지역 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">출입 지역</h5>
		<div class="form-group">
			<div class="form-inline">
				<input type="text" name="area" id="area" placeholder="" class="form-control" style="width:200px; font-size:12px">
				<input type = "button" value="선택" style="margin-left:10px;color:grey" onclick= "loadArea();">
			</div>
		</div>
	</div>
	
<!-- 성명 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">성명</h5>
		<div class="form-group">
			<input type="text" id="name" name="name" placeholder="" class="form-control" style="width:200px; font-size:12px; margin-top:10px">
		</div>
	</div>
	
<!-- 생년월일 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">생년월일</h5>
		<div class="form-group">
			<input type="text" id="birth" name="birth" placeholder="" class="form-control" style="width:200px; font-size:12px; margin-top:10px">
		</div>
	</div>
	
<!-- 성별 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">성별</h5>
		
		<input type="radio" name="gender_radio" value="M"> 남성
		<input type="radio" name="gender_radio" value="F"> 여성
	</div>
	
<!-- 본인서약서 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
    	<h5 style="font-size:15px">본인 서약서</h5>
            <div class="form-inline">
               <div class="filebox"> 
               <input class="upload-name" value="파일선택" disabled="disabled">
                <label for="filename1">업로드</label> 
                <input type="file" name="filename1" id="filename1" class="upload-hidden"> 
                 </div>
            </div>
    </div>
	
<!-- 재직증명서 -->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">4대 보험증서(재직증명서)</h5>
			<div class="form-inline">
               <div class="filebox"> 
               <input class="upload-name" value="파일선택" disabled="disabled">
                <label for="filename2">업로드</label> 
                <input type="file" name="filename2" id="filename2" class="upload-hidden"> 
                 </div>
            </div>
	</div>

<!-- 전화번호-->
	<div style="width:350px; margin:0 auto; margin-top:20px">
		<h5 style="font-size:15px">전화번호</h5>
		<div class="form-group">
			<input type="text" id="p_number" name="p_number" placeholder="" class="form-control" style="width:200px; font-size:12px; margin-top:10px">
		</div>
	</div>

<!-- 취소,다음 -->
	<div class="container mt-5 centor-block" style="max-width:300px display: inline-block;text-align: center;">
		<button type="button" onclick="history.back()" class="btn btn-secondary btn-sm" style="width:100px">취소</button>
		<button type="submit" onclick="return inputCheck()" class="btn btn-success btn-sm" style="margin-left:10px; width:100px">다음</button>
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
  <script src="Resource/vendor/jquery/jquery.min.js"></script>
  <script src="Resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
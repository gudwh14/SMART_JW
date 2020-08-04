  
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
   
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
function idCheck(){ 
	var userName = $("#registerName").val(); 
	$.ajax({ 
		type : 'POST', 
		url : './BoardIdCheckServlet', 
		data : {userName : userName}, 
		success : function(result){ 
			if(result == 1){
				$("#checkMessage").html("사용할 수 있는 아이디입니다.");
				} else { 
					$("#checkMessage").html("사용중인 아이디입니다. 다른 아이디를 입력해 주세요");
					} 
			} 
		}) 
}
function pwdcheck(){
	var password1 = $("#userpassword").val();
	var password2 = $("#userpw_check").val();
	if(password1 != password2)
		{
				$("#checkMessage").html("비밀번호가 일치하지 않습니다.");		
		}
	else
		{
				$("#checkMessage").html("");
		}
	
}
$(document).ready(function(){
	var fileTarget = $('.filebox .upload-hidden'); 
	
	
	fileTarget.on('change', function(){ // 값이 변경되면 
			if(window.FileReader){ // modern browser 
				var filename = $(this)[0].files[0].name; } 
			else { // old IE 
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
				} 
	// 추출한 파일명 삽입 
	$(this).siblings('.upload-name').val(filename); 
	}); 
});
</script>
<style>
	
	 .filebox input[type="file"] {
	  position: absolute; 
	  width: 1px;
	   height: 1px; 
	   padding: 0; 
	   margin: -1px; 
	   overflow: hidden; 
	   clip:rect(0,0,0,0); 
	   border: 0; } 
	   
	   .filebox label { 
	   display: inline-block; 
	   padding: .5em .75em; 
	   color: #999;
	    font-size: inherit; 
	    line-height: normal; 
	    vertical-align: middle; 
	    background-color: #fdfdfd; 
	    cursor: pointer; 
	    border: 1px solid #ebebeb; 
	    border-bottom-color: #e2e2e2; 
	    border-radius: .25em; } 
	   
	   
	    /* named upload */
	    .filebox .upload-name { 
	    display: inline-block;
	     padding: .5em .75em; /* label의 패딩값과 일치 */ 
	     font-size: inherit; 
	     font-family: inherit; 
	     line-height: normal; 
	     vertical-align: middle;
	      background-color: #f5f5f5; 
	      border: 1px solid #ebebeb; 
	      border-bottom-color: #e2e2e2; 
	      border-radius: .25em; 
	      -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	      -moz-appearance: none; 
	      appearance: none; 
	      }
</style>
</head>



<body>
 <div class ="imagecentor-block " style ="max-wdith:150px display: inline-block;text-align: center;">
       <img class="img centor-block" src="Resource/img/logo_icon.png" width="150" height="150 "alt="">
   </div>
   <div class = "container">
   		<div class ="row">
   			<div class ="col text-center">
   				<button class="btn btn-default">관리자관리</button>
  			 </div>
   		</div>
   </div>     
    
   <div class="container mt-3" style="max-width: 350px;">
         <form method="post" action="./LoginAction.jsp">
         <div class="form-group">
            <label>이름</label>
            <input type="search" name="userName" class="form-control" placeholder ="이름을 입력해 주세요">
         </div>
         <div class="form-group">
            <label>아이디</label>
            <input type="text" name="userID" class="form-control" placeholder ="ID을 입력해 주세요">
         </div>
         <div class="form-group">
            <label>비밀번호</label>
            <input type="password" id="userpassword" class="form-control" placeholder ="password을 입력해 주세요">
         </div>
         <div class="form-group">
            <label>비밀번호 확인</label>
            <input type="password" id="userpw_check" class="form-control" placeholder ="password을 재입력해 주세요" onkeyup="pwdcheck();">
         </div>
         <div class="form-group">           	
            <div><label>4대보험 증서</label></div>
          		  <div class="filebox">
          		  	<input class="upload-name" value="파일 선택" disabled = disabled> 
          		  	
          		  	<label for="ex_filename">업로드</label>
          		  	<input type="file" id="ex_filename" class="upload-hidden">
					<div >
      					<span id="checkMessage" style="color:red;font-weight:bold"></span> 	
     	 			</div>
					
          		  	<!--  <input type="text" style = "margin-right:10px" name="insurance_certificate" class=" form-control" >
         			<button type="submit" class = " btn btn=default" >업로드</button>
      				-->
      				
      				</div>
      			</div>
      		</div>
      		
      		<div class ="col text-center">>
      		<button class="btn btn-primary pull-right" type="button">등록</button>
      		</div>
      		
      </form>
   </div>
   
   
</body>
</html>
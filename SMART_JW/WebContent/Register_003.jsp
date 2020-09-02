<%@ page import="user.confirm"%>
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
	
	window.open("ActionJSP/Register003Action/confirmid.jsp", "idwin", "width=500, height=350");
}
function enterpriseCheck(){ 
	
	window.open("ActionJSP/Register003Action/confirmen.jsp", "enterprise", "width=400, height=350");
}
function check()
{
	var password1 = $("#userpassword").val();
    var password2 = $("#userpw_check").val();
    var username = $("#userName").val();
    var userid= $("#userID").val();
    var phone = $("#phone_num").val();
	var enterprise = $("#gname").val();
	
	if(username.trim() =="") {
		alert("이름을 입력해 주세요.");
	}
	else if(userid.trim() =="") {
		alert("사용자 ID를 입력해주세요.");
	}
	else if(password1.trim() == "") {
		alert("비밀번호를 입력해 주세요.");
	}
	else if(password2.trim() =="") {
		alert("비밀번호를 재입력해 주세요.");
	} 
	
	else if(phone.trim()=="") {
		alert("핸드폰 번호를 입력해주세요.");
	}
	else if(enterprise.trim()=="") {
		alert("기업명을 입력해주세요 .");
	}
	else if(password1 != password2)
		{
			alert("패스워드가 일치하지 않습니다 !");
		}
	
	else {
		return true;
	}
	
	return false;
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
<form name ="regForm" method="post" action="ActionJSP/Register003Action/userapply.jsp" enctype="multipart/form-data">
 <!-- 로고 이미지 -->
   <div class ="image centor-block " style ="margin-top:80px; max-wdith:150px display: 
-block;text-align: center;">
      <a href="index.jsp"><img class="img-resize" src="Resource/img/logo_icon2.png" alt=""></a> 
   </div>
   <BR>
   <div class="centor-sort">
      <h4 class="txtBox06bg" style="width:300px;">관리자 등록</h4>
   </div>    
    
   <div class="container " style="max-width: 350px; margin-top:30px;">
            <div class="form-group">
               <h5 style="font-size:15px">이름</h5>
               <input type="search" id="userName" name="name"class="form-control" placeholder ="" style="width:200px;">
            </div>
            <div class="form-group">
               <h5 style="font-size:15px">아이디</h5>
               <div class= "form-inline">
	               <input type="text" id="userID" name="id"class="form-control" style="width:200px;" placeholder ="" readonly>
	               <input type = "button" value="중복확인" style="margin-left:10px;color:grey" onclick= "idCheck();">
               </div>
            </div>
             <div class="form-group">
               <h5 style="font-size:15px">소속 업체(기관)명</h5>
               <input type="text" id="gname"  name="g_name" style="margin-left:5px;margin-right:1px" placeholder ="" readonly >
               <input type="button" value="검색" onclick="enterpriseCheck();">  
            </div>
            <div class="form-group">
               <h5 style="font-size:15px">비밀번호</h5>
               <input type="password" id="userpassword" name="pw" class="form-control" placeholder =""style="width:200px;">
            </div>
            <div class="form-group">
               <h5 style="font-size:15px">비밀번호 확인</h5>
               <input type="password" id="userpw_check" class="form-control" placeholder ="" onkeyup="pwdcheck();"style="width:200px;">
            </div>
        	<div class="form-group">
               <h5 style="font-size:15px">전화번호</h5>
               <input type="text" id="phone_num" name="p_num" class="form-control" placeholder ="" style="width:200px;">
            </div>
           
            <div class="form-group">              
               <h5 style="font-size:15px">4대보험증서(재직증명서)</h5>
                  <div class="filebox">
                     <input class="upload-name" value="파일 선택" disabled = disabled> 
                     
                     <label for="ex_filename">업로드</label>
                     <input type="file" id="ex_filename" name="ex_filename" class="upload-hidden">
               	  <div>
                     <span id="checkMessage" style="color:red;font-weight:bold"></span>    
                  </div>          
               </div>
            </div>
         <div class ="col text-center">
           <button type="submit" onclick="return check()" class="btn btn-success btn-sm" >등록</button>
         </div>
   </div>
   
   <!-- 하단 footer -->
	<div >
		<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
	
	      Copyright ⓒ 스마트 항만공사 All Rights Reserved.
	
	    </footer>
    </div>
</form>
</body>
</html>

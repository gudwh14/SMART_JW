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
function checkNumber(){
	if(isNaN(document.getElementById("no").value)){
		alert("숫자만 입력하세요");
		document.getElementById("no").value="";
	}	
}
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
<!-- DAUM 주소 찾기 SCRIPT -->
	function FindPostCode() {
		 new daum.Postcode({
	         oncomplete: function(data) {
	             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	             // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	             var roadAddr = data.roadAddress; // 도로명 주소 변수
	             // 우편번호와 주소 정보를 해당 필드에 넣는다.
	             document.getElementById("roadAddress").value = roadAddr;
	             // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                      }
	     }).open();
	}
	
	function inputCheck() {
		var regist_num = document.getElementById("no");
		var enterprise_name = document.getElementById("Enterprise_Name");
		var leader_name = document.getElementById("Leader_Name");
		var enterprise_upload = document.getElementById("ex_filename1");
		var leader_upload = document.getElementById("ex_filename2");
		var roadAddress = document.getElementById("roadAddress");
		var detailAddress = document.getElementById("detailAddress");
		
		if(regist_num.value.trim() == "") {
			alert("사업자 등록번호를 입력해 주세요.");
		}
		else if(enterprise_name.value.trim() =="") {
			alert("업체(기관)명을 입력해 주세요.");
		}
		else if(leader_name.value.trim() =="") {
			alert("대표자 성명을 입력해 주세요.");
		}
		else if(enterprise_upload.value.trim() =="") {
			alert("사업자 등록증을 업로드 해주세요.");
		}
		else if(leader_upload.value.trim()=="") {
			alert("대표자 확인서를 업로드 해주세요.");
		}
		else if(roadAddress.value.trim()=="") {
			alert("주소를 입력해 주세요.");
		}
		else if(detailAddress.value.trim()=="") {
			alert("상세주소를 입력해 주세요.");
		}
		else {
			return true;
		}
		return false;
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
<style type="text/css">
.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}

.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #ffffff;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
  display: inline-block;
  padding: .5em .75em;  /* label의 패딩값과 일치 */
  font-size: 14px;
  width: 250px;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  text-overflow : ellipsis;
  background-color: #ffffff;
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
   <!-- 로고 이미지 -->
	<div class ="image centor-block " style ="margin-top:80px; max-wdith:150px display: inline-block;text-align: center;">
		<a href="index.html"><img class="img-resize" src="Resource/img/logo_icon2.png" alt=""></a> 
	</div>
	
	<BR>
   <div class="container mt-3" style="width: 400px; align: center;">
      <form method="post" action="./LoginAction.jsp" enctype="multipart/form-data">
         <div class="form-group">
            <h5 style="font-size:15px">사업자 등록번호</h5>
            <input type="text" id="no" onkeyup="checkNumber()" style="width:250px; height: 30px; 'IME-MODE: disabled'" name="Regist_Num" class="form-control">
         </div>
         <div class="form-group">
        	 <h5 style="font-size:15px">업체(기관)명</h5>
            <input type="text" style="width:250px; height: 30px;" id="Enterprise_Name" name="Enterprise_Name" class="form-control">
         </div>
         <div class="form-group">
            <h5 style="font-size:15px">대표자 성명</h5>
            <input type="text" style="width:250px; height: 30px;" id="Leader_Name" name="Leader_Name" class="form-control" onkeypress="if(!(event.keyCode < 47 && event.keyCode > 58)) event.returnValue=false;">
         </div>
         <div class="form-group">
         	<h5 style="font-size:15px">사업자 등록증</h5>
         	<div class="form-inline">
            	<div class="filebox"> 
            	<input class="upload-name" value="파일선택" disabled="disabled">
            	 <label for="ex_filename1">업로드</label> 
            	 <input type="file" name="ex_filename1" id="ex_filename1" class="upload-hidden"> 
         	  	</div>
         	</div>
         </div>
         <div class="form-group">
         	<h5 style="font-size:15px">대표자 확인서</h5>
         	<div class="form-inline">
            	<div class="filebox"> 
            	<input class="upload-name" value="파일선택" disabled="disabled">
            	 <label for="ex_filename2">업로드</label> 
            	 <input type="file" name="ex_filename2" id="ex_filename2" class="upload-hidden"> 
         	  	</div>
         	</div>
         </div>
         <h5 style="font-size:15px">주소</h5>
         <div class="form-group">
         	<div class="form-inline">
			<input type="text" name="roadAddress" id="roadAddress" style="width:250px; height: 30px; margin-right:5px; text-overflow:ellipsis" placeholder="도로명주소" disabled=disabled class="form-control">
			<input type="button" style="diplay:inline-block; width:90px; height: 35px" onclick="FindPostCode()" value="주소 찾기" class="btn btn-primary"><br><br>
			</div>	
			<input type="text" name="detailAddress" id="detailAddress" style="width:350px; height:30px" placeholder="상세주소" class="form-control">
		</div>
		<BR>
  <!-- 취소,다음 -->
	<div class="container mt-5 centor-block" style="max-width:300px display: inline-block;text-align: center;">
		<button type="submit" class="btn btn-secondary btn-sm" style="width:100px">취소</button>
		<button type="submit" onclick="return inputCheck()" class="btn btn-success btn-sm" style="margin-left:10px; width:100px">다음</button>
	</div>
      </form>      
   </div>
  
  
  <!-- footer --> 
   <div>
   <footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
         Copyright ⓒ 스마트 항만공사 All Rights Reserved.
   </footer>
   </div>
   <!-- Bootstrap core JavaScript -->
  <script src="Resource/vendor/jquery/jquery.min.js"></script>
  <script src="Resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
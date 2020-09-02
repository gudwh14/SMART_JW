<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

 <script type="text/javascript">
  	function hide() {
 		document.getElementById("divs").style.display = "none"; // Hide
  	}
  </script>
  
  <script src="Resource/vendor/jquery/jquery.min.js"></script>
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
<div>
        <h2><b>이미지 미리보기</b></h2>
        <p class="title">이미지 업로드</p>
        <input type="file" id="input_img" />
    </div>
 
    <div>
        <div class="img_wrap">
            <img id="img" style="text-align:center; width:150px; height:150px;" class="img-resize" />
        </div>
    </div>
    
    
</body>
</html>
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
      function inputCheck() {
         var userID = document.getElementById("userID");
         var userPW = document.getElementById("userPW");
         
         if(userID.value.trim()== "") {
        	 alert("아이디를 입력해주세요.");
         }
         else if(userPW.value.trim()=="") {
        	 alert("비밀번호를 입력해주세요.");
         }
         else {
        	 return true;
         }
         return false;
      }
   
   
   </script>
</head>
<body> 

   <!-- 로고 이미지 -->
   <div class ="image centor-block " style ="margin-top:90px; max-wdith:150px display: inline-block;text-align: center;">
       <a href="index.jsp"><img class="img centor-block" src="Resource/img/logo_icon.png" width="150" height="150 "alt=""></a>
   </div>
   
   <!-- 로그인 입력창 폼 -->
   <div class="container mt-3" style="max-width: 300px;">
      <form method="post" action="ActionJSP/LoginAction.jsp">
         <div class="form-group">
            <label>아이디</label>
            <input type="text" name="userID" id="userID" class="form-control">
         </div>
         <div class="form-group">
            <label>비밀번호</label>
            <input type="password" name="userPW" id="userPW" class="form-control">
         </div>
         
         <div class="container mt-3" style="max-width:300px display: inline-block;text-align: center;">
            <button type="submit"  onclick="return inputCheck()" class="btn btn-primary">로그인</button>
   </div>
      </form>      
   </div>
   
   <div class="container mt-3 centor-block" style="max-width:300px display: inline-block;text-align: center;">
      <a class="navbar-text" href="#">ID/PW찾기</a>
      <a class="navbar-text" href="Register_001.jsp">회원가입</a>
   </div>
   
   <!-- 하단 footer -->
   <div >
      <footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
   
         Copyright ⓒ 스마트 항만공사 All Rights Reserved.
   
       </footer>
    </div>
   <!-- Bootstrap core JavaScript -->
  <script src="Resource/vendor/jquery/jquery.min.js"></script>
  <script src="Resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  <%
     String msg = request.getParameter("msg");
  
     if(msg!=null && msg.equals("-1")) {
        out.println("<br>");
        out.println("<font color='red' size='5'>아이디, 비밀번호를 확인해 주세요.</font>");
     }
     else if(msg!=null && msg.equals("-2")) {
        out.println("<br>");
        out.println("<font color='red' size='5'>데이터베이스 오류</font>");
     }
  %>

</body>
</html>
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
</head>
<body>
 <div class ="imagecentor-block " style ="max-wdith:150px display: inline-block;text-align: center;">
       <img class="img centor-block" src="Resource/img/logo_icon.png" width="150" height="150 "alt="">
   </div>
   <div> 
   <input class ="favorite styled"
            type = "button"
            value = "관리자 신청"
            >
   </div>
         
   <div class="container mt-3" style="max-width: 300px;">
         <form method="post" action="./LoginAction.jsp">
         <div class="form-group">
            <label>아이디</label>
            <input type="text" name="userID" class="form-control">
         </div>
         <div class="form-group">
            <label>비밀번호</label>
            <input type="password" name="userPW" class="form-control">
         </div>
      </form>
   </div>
   
   
</body>
</html>
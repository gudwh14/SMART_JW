<%@ page import="user.confirm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복확인</title>
</head>
<script>
function blankCheck(f)
{ 
	var id=f.id.value;
	var userIdCheck = /^[a-zA-Z0-9_-]{5,10}$/;// 가능한 아이디 조합을 영어 + 숫자로 한정

	id=id.trim(); 
	if(id.length<1){ 
		alert("아이디를 입력해주세요 !!!"); 
		return false; }//if end 
	if(!userIdCheck.test(id))
	{
			alert("아이디는 영소문자로 시작하는 5~10자 영문자 또는 숫자여야 합니다.");
			return false;
	}
		
		return true; 
		
		}//blankCheck() end


</script>
<body>

<div style="text-align: center"> 
	<h3>* 아이디 중복확인 *</h3> 
 <form method="post" action="confirmid2.jsp" onsubmit="return blankCheck(this)">
  아이디 : <input type="text" name="id" maxlength="10" > 
 <input type="submit" value="중복확인"> 
 </form> 
 </div>


	
</body>
	
</html>
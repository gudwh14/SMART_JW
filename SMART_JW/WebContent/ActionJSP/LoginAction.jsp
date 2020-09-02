<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="user.UserDTO"%>
<%@ page import="user.confirm"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
      request.setCharacterEncoding("UTF-8");
      UserDAO userDao = new UserDAO();
      
      String userID = request.getParameter("userID");
      String userPW = request.getParameter("userPW");
      
      System.out.println(userID);
      System.out.println(userPW);
      
      String result = userDao.login(userID, userPW);
      String msg = "";
      
      
      if(result.equals("-1")) {
         msg = "../Login.jsp?msg=-1";
      }
      else {
    	  session.setAttribute("userID", userID);
    	  session.setAttribute("userName", result);
          msg = "../index.jsp";
      }
      
      response.sendRedirect(msg);
   %>
</body>
</html>
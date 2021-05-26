<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO" %>
<%request.setCharacterEncoding("UTF-8"); %>
 <jsp:useBean id="user" class="user.UserDTO" scope="page"/>
 <jsp:setProperty name="user" property="userID"/>
 <jsp:setProperty name="user" property="userPW"/>
 <jsp:setProperty name="user" property="name"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WorkBook</title>
</head>
<body>
	<%
		PrintWriter cript = response.getWriter();
		if(user.getName()==null||user.getUserPW()==null||user.getUserID()==null){
			cript.println("<script>");
			cript.println("alert('모든 문항을 채워주세요')");
			cript.println("history.back()");
			cript.println("</script>");
		}
		
		UserDAO dao = new UserDAO();
	
		int result = dao.join(user.getUserID(),user.getUserPW(),user.getName());
		System.out.println(result);
		if(result == 1){
			cript.println("<script>");
			cript.println("alert('회원가입 성공')");
			cript.println("location.href='index.jsp'");
			cript.println("</script>");
		}else if(result==-1){	
			cript.println("<script>");
			cript.println("alert('가입되어있는 아이디 입니다.')");
			cript.println("history.back()");
			cript.println("</script>");
		}
	%>
</body>
</html>
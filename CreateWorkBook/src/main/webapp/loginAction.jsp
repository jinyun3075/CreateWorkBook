<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO" %>
<%request.setCharacterEncoding("UTF-8"); %>
 <jsp:useBean id="user" class="user.UserDTO" scope="page"/>
 <jsp:setProperty name="user" property="userID"/>
 <jsp:setProperty name="user" property="userPW"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WorkBook</title>
</head>
<body>
	<%
		PrintWriter cript = response.getWriter();
		UserDAO dao = new UserDAO();
		int result = dao.login(user.getUserID(),user.getUserPW());
		if(result==1){
			session.setAttribute("userID",user.getUserID());
			cript.println("<script>");
			cript.println("alert('로그인 성공')");
			cript.println("location.href='index.jsp'");
			cript.println("</script>");
		}else if(result==2){
			cript.println("<script>");
			cript.println("alert('비밀번호가 틀립니다.')");
			cript.println("history.back()");
			cript.println("</script>");
		}else if(result==-1){
			cript.println("<script>");
			cript.println("alert('존재하지 않는 아이디입니다.')");
			cript.println("history.back()");
			cript.println("</script>");
		}else{	
			cript.println("<script>");
			cript.println("alert('앙')");
			cript.println("history.back()");
			cript.println("</script>");
		}
	%>
</body>
</html>
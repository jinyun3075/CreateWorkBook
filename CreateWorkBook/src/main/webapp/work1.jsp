<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
request.setCharacterEncoding("UTF-8");
%>
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<%
	String userID = null;
	String name=null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
		name = (String) session.getAttribute("userName");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인하시오.')");
		script.println("location.href ='login.jsp'");
		script.println("</script>");
	}
	%>
	<jsp:include page="privateNav.jsp"/>

	<form action="work1Action.jsp" method="post">
		<input type="text" name="work1Title"> 문제집 <input type="submit"
			value="문제집만들기">
	</form>

</body>
</html>
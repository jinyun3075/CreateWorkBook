<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="work2.Work2DAO"%>
	<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String title = null;
	String name=null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
		name = (String) session.getAttribute("userName");
	}else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인하시오.')");
		script.println("location.href ='login.jsp'");
		script.println("</script>");
	}
	%>
	<jsp:include page="privateNav.jsp"/>
	<%
	String work1Id = (String) request.getParameter("work1id");
	Work2DAO d = new Work2DAO();
	d.wrongdel(userID);
	%>
	<form action="startworkView.jsp" method="post">
		<input type="hidden" name="work1id" value="<%=work1Id%>">
		<input type="hidden" name="cs" value="0"> 
		<input
			type="submit" value="공부 모드">
	</form>
	<form action="startworkView.jsp" method="post">
		<input type="hidden" name="work1id" value="<%=work1Id%>"> 
		<input type="hidden" name="cs" value="1">
		<input
			type="submit" value="시험 모드">
	</form>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html> 
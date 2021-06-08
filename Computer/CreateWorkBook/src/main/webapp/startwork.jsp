<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="work2.Work2DAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="work2.Work2DTO"%>
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
	if(session.getAttribute("userID")!=null){
		userID = (String) session.getAttribute("userID");
	}else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인하시오.')");
		script.println("location.href ='login.jsp'");
		script.println("</script>");
	}
	int work2id=0;
	if(request.getParameter("work2id")!=null){
		work2id= Integer.parseInt((String)request.getParameter("work2id"));
	}
	String val = (String) request.getParameter("val");
	String qs = (String) request.getParameter("qs");
	int num = Integer.parseInt((String) request.getParameter("num"));
	String workid = (String) request.getParameter("work1id");
	int cs = Integer.parseInt((String) request.getParameter("cs"));
	Work2DAO dao = new Work2DAO();
	if (cs == 0) {
		if (val.equals(qs)) {
	%>
	<jsp:include page="privateNav.jsp"/>
	<h1>정답입니다!!</h1>
	<form action="startworkView.jsp" method="post">
		<input type="hidden" name="cs" value="0"> <input type="hidden"
			name="num" value="<%=num%>"> <input type="hidden"
			name="work1id" value="<%=workid%>"> <input type="submit"
			value="문제 다시풀기">
	</form>
	<form action="startworkView.jsp" method="post">
		<input type="hidden" name="cs" value="0"> <input type="hidden"
			name="num" value="<%=num + 1%>"> <input type="hidden"
			name="work1id" value="<%=workid%>"> <input type="submit"
			value="다음문제 풀기">
	</form>
	<%
	} else {
	%>
	<h1>틀렸습니다!!</h1>
	<form action="startworkView.jsp" method="post">
		<input type="hidden" name="cs" value="0"> <input type="hidden"
			name="num" value="<%=num%>"> <input type="hidden"
			name="work1id" value="<%=workid%>"> <input type="submit"
			value="문제 다시풀기">
	</form>
	<%
	}
	} else {
	int score = Integer.parseInt((String) request.getParameter("score"));
	if (val.equals(qs)) {
	%>

	<jsp:forward page="startworkView.jsp">
		<jsp:param name="cs" value="1"/>
		<jsp:param name="num" value="<%=num+1 %>"/>
		<jsp:param name="score" value="<%=score+1 %>"/>
		<jsp:param name="work1id" value="<%=workid%>"/>
	</jsp:forward>
	<%
	} else {
		dao.wrong(userID, work2id);
	%>
		<jsp:forward page="startworkView.jsp">
		<jsp:param name="cs" value="1"/>
		<jsp:param name="num" value="<%=num+1 %>"/>
		<jsp:param name="score" value="<%=score %>"/>
		<jsp:param name="work1id" value="<%=workid%>"/>
	</jsp:forward>

	<%
	}
	}
	%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html> 
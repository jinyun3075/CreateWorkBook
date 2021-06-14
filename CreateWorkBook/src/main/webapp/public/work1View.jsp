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
<link rel="stylesheet" href="../css/custom.css">
<link rel="stylesheet" href="../css/bootstrap.css">
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인하시오.')");
		script.println("location.href ='../login.jsp'");
		script.println("</script>");
	}
	%>
	<jsp:include page="publicNav.jsp"/>

	<%
	String work1Id = (String) request.getParameter("work1id");
	String makeUser = (String) request.getParameter("makeuser");
	String title = (String) request.getParameter("title");
	%>
	<br />
	<%
	Work2DAO dao = new Work2DAO();
	ArrayList<Work2DTO> list = new ArrayList<>();
	list = dao.getList(work1Id, makeUser);
	for (int i = 0; i < list.size(); i++) {
	%>
	<%=list.get(i).getWork2Id()%>번 문제 :
	<%=list.get(i).getWork2_Qw()%>&nbsp;
	<br />
	<%
	}
	%>
	<form action="workChoice.jsp" method="post">
		<input type="hidden" name="work1id" value="<%=work1Id%>"> <input
			type="hidden" name="makeuser" value="<%=makeUser%>"> <input
			type="submit" value="문제 풀기">
	</form>
	<form action="getWork.jsp" method="post">
		<input type="hidden" name="work1Id" value="<%=work1Id%>"> <input
			type="hidden" name="userId" value="<%=makeUser%>"> <input
			type="hidden" name="work1Title" value="<%=title%>"> <input
			type="submit" value="My WorkBook에 저장">
	</form>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html> 
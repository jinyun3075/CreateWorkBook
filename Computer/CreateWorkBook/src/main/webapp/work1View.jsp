<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="work2.Work2DAO"%>
<%@ page import="work1.Work1DAO"%>
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
	String title = null;
	String name=null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
		name = (String) session.getAttribute("userName");
	}
	else {
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
	Work2DAO dao = new Work2DAO();
	ArrayList<Work2DTO> list = new ArrayList<>();
	list = dao.getList(work1Id, userID);
	for (int i = 0; i < list.size(); i++) {
	%>
	<%=list.get(i).getWork2Id()%>번 문제 :
	<%=list.get(i).getWork2_Qw()%>&nbsp;
	<a
		href="work2Update.jsp?id1=<%=work1Id%>&&id2=<%=list.get(i).getWork2Id()%>"
		class="btn btn-primary">수정</a>&nbsp;
	<a
		href="work2Delete.jsp?id1=<%=work1Id%>&&id2=<%=list.get(i).getWork2Id()%>"
		class="btn btn-primary">삭제</a>
	<br />
	<%
	}
	%>

	<form action="work2.jsp" method="post">
		<input type="hidden" name="work1id" value="<%=work1Id%>"> <input
			type="submit" value="문제 추가">
	</form>
	<form action="work1Delete.jsp" method="post">
		<input type="hidden" name="work1id" value="<%=work1Id%>"> <input
			type="submit" value="문제집 삭제">
	</form>
	<form action="workChoice.jsp" method="post">
		<input type="hidden" name="work1id" value="<%=work1Id%>"> <input
			type="submit" value="문제 풀기">
	</form>
	<br>
	<br>
	<br>
	<%
	Work1DAO work1dao = new Work1DAO();
	String comp = work1dao.shere(work1Id, userID);
	if (comp.equals("1")) {
	%>
	<form action="work1Shere.jsp" method="post">
		<input type="hidden" name="work1Id" value="<%=work1Id%>"> <input
			type="hidden" name="shere" value="0"> <input type="submit"
			value="문제 공유하기">
	</form>
	<%
	} else {
	%>
	<form action="work1Shere.jsp" method="post">
		<input type="hidden" name="work1Id" value="<%=work1Id%>"> <input
			type="hidden" name="shere" value="1"> <input type="submit"
			value="문제 공유해체">
	</form>
	<%
	}
	%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html> 
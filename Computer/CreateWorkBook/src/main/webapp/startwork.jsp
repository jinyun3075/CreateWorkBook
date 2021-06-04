<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="work2.Work2DAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="work2.Work2DTO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String val = (String) request.getParameter("val");
	String qs = (String) request.getParameter("qs");
	int num = Integer.parseInt((String) request.getParameter("num"));
	String workid = (String) request.getParameter("work1id");
	int cs = Integer.parseInt((String) request.getParameter("cs"));
	if (cs == 0) {
		if (val.equals(qs)) {
	%>
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

</body>
</html> 
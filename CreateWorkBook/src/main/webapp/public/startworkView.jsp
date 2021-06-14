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
	int cs = Integer.parseInt((String) request.getParameter("cs"));
	int score = 0;
	if (request.getParameter("score") != null) {
		score = Integer.parseInt((String) request.getParameter("score"));
	}
	String makeUser = request.getParameter("makeuser");
	int p;
	if (request.getParameter("num") == null) {
		p = 0;
	} else {
		p = Integer.parseInt((String) request.getParameter("num"));
	}
	String value = (String) request.getParameter("work1id");
	Work2DAO dao = new Work2DAO();
	ArrayList<Work2DTO> list = new ArrayList<>();
	list = dao.getWork2(makeUser, value);
	if (list.size() <= p) {
		Work1DAO wo = new Work1DAO();
		wo.cliUp(value, makeUser);
		%>
	<h1>모든 문제를 다 풀었습니다~</h1>		
		<%
		if (cs == 1) {
	%>
	정답률
	<%=score%>/<%=list.size()%>
	<br>
	<br> 틀린문제
	<br>
	<br>
	<%
	list = dao.publgetwrong2(userID, value,makeUser);
	for (int i = 0; i < list.size(); i++) {
	%>
	<p><%=list.get(i).getWork2Id()%>번 문제: &nbsp;<%=list.get(i).getWork2_Qw()%></p>
	<p>
		1.
		<%=list.get(i).getWork2_view1()%><br>
	</p>
	<p>
		2.
		<%=list.get(i).getWork2_view2()%><br>
	</p>
	<p>
		3.
		<%=list.get(i).getWork2_view3()%><br>
	</p>
	<p>
		4.
		<%=list.get(i).getWork2_view4()%><br>
	</p>
	정답 (<%=list.get(i).getWork2_value()%>)
	<br>
	<br> --------------------------

	<%
	}
	}
	%>


	<a href="work1View.jsp?work1id=<%=value%>&&makeuser=<%=makeUser%>"
		class="btn btn-primary">처음으로</a>&nbsp;
	<%
	} else {
	if (cs == 0) {
	%>
	<p><%=list.get(p).getWork2Id()%>번: <%=list.get(p).getWork2_Qw()%><br />
	</p>
	<form action="startwork.jsp" method="post">
		<input type="hidden" name="val"
			value="<%=list.get(p).getWork2_value()%>">
			<input type="hidden" name="cs" value="0"> <input
			type="hidden" name="num" value="<%=p%>"> <input type="hidden"
			name="work1id" value="<%=value%>"> <input type="hidden"
			name="makeuser" value="<%=makeUser%>"> <input type="radio"
			name="qs" value="1">
		<%=list.get(p).getWork2_view1()%><br> <input type="radio"
			name="qs" value="2">
		<%=list.get(p).getWork2_view2()%><br> <input type="radio"
			name="qs" value="3">
		<%=list.get(p).getWork2_view3()%><br> <input type="radio"
			name="qs" value="4">
		<%=list.get(p).getWork2_view4()%><br> <input type="submit"
			value="답 확인">
	</form>
	<%
	} else {
	%>
	<p><%=list.get(p).getWork2Id()%>번: <%=list.get(p).getWork2_Qw()%><br />
	</p>
	<form action="startwork.jsp" method="post">
	<input type="hidden" name="work2id" value="<%=list.get(p).getWork2Id()%>">
		<input type="hidden" name="cs" value="1"> <input type="hidden"
			name="score" value="<%=score%>"> <input type="hidden"
			name="makeuser" value="<%=makeUser%>"> <input type="hidden"
			name="val" value="<%=list.get(p).getWork2_value()%>"> <input
			type="hidden" name="num" value="<%=p%>"> <input type="hidden"
			name="work1id" value="<%=value%>"> <input type="hidden"
			name="makeuser" value="<%=makeUser%>"> <input type="radio"
			name="qs" value="1">
		<%=list.get(p).getWork2_view1()%><br> <input type="radio"
			name="qs" value="2">
		<%=list.get(p).getWork2_view2()%><br> <input type="radio"
			name="qs" value="3">
		<%=list.get(p).getWork2_view3()%><br> <input type="radio"
			name="qs" value="4">
		<%=list.get(p).getWork2_view4()%><br> <input type="submit"
			value="답 제출">
	</form>
	<%
	}
	}
	%>


	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>

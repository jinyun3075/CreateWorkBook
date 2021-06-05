<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="work2.Work2DAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="work2.Work2DTO"%>
	
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
	String name = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
		name = (String) session.getAttribute("userName");
	}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">Work Book Maker</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs=example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="work.jsp">My WorkBook</a></li>
				<li><a href="public/public.jsp">Public WorkBook</a></li>
			</ul>
			<%
			if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="login.jsp">Login</a></li>
			</ul>
			<%
			} else {
			%>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><%=name%> <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
			}
			%>
		</div>
	</nav>

	<%
	int score = 0;
	if(request.getParameter("score")!=null){
		score =  Integer.parseInt((String) request.getParameter("score"));
	}
	int cs = Integer.parseInt((String) request.getParameter("cs"));
	int p;
	if (request.getParameter("num") == null) {
		p = 0;
	} else {
		p = Integer.parseInt((String) request.getParameter("num"));
	}
	String value = (String) request.getParameter("work1id");
	Work2DAO dao = new Work2DAO();
	ArrayList<Work2DTO> list = new ArrayList<>();
	
	list = dao.getWork2(userID, value);
	if (list.size() <= p) {
		%>
		<h1>모든 문제를 다 풀었습니다~</h1>		
			<%
		if(cs==1){
			%>
			정답률 <%=score %>/<%=list.size() %>
			<br><br>
			틀린문제
			<br><br>
			<%
			list = dao.getwrong2(userID, value);
			for(int i=0;i<list.size();i++){
				%>
				<p><%=list.get(i).getWork2Id()%>번 문제: &nbsp;<%=list.get(i).getWork2_Qw()%></p>
				<p>1. <%=list.get(i).getWork2_view1()%><br></p>
				<p>2. <%=list.get(i).getWork2_view2()%><br></p>
				<p>3. <%=list.get(i).getWork2_view3()%><br></p>
				<p>4. <%=list.get(i).getWork2_view4()%><br></p>
				정답 (<%=list.get(i).getWork2_value()%>)
				<br><br>
				--------------------------
				<%
			}
		}
	%>
	<br>
	<a href="work1View.jsp?work1id=<%=value%>" class="btn btn-primary">처음으로</a>&nbsp;
	<%
	} else {
	if (cs == 0) {
	%>
	<p><%=list.get(p).getWork2_Qw()%><br />
	</p>
	<form action="startwork.jsp" method="post">
		<input type="hidden" name="cs" value="0">
		 <input type="hidden"
			name="val" value="<%=list.get(p).getWork2_value()%>"> <input
			type="hidden" name="num" value="<%=p%>"> <input type="hidden"
			name="work1id" value="<%=value%>"> <input type="radio"
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
	<p><%=list.get(p).getWork2_Qw()%><br />
	</p>
	<form action="startwork.jsp" method="post">
		<input type="hidden" name="cs" value="1">
		<input type="hidden" name="work2id" value="<%=list.get(p).getWork2Id()%>">
		<input type="hidden" name="score" value="<%=score%>">
		 <input type="hidden"
			name="val" value="<%=list.get(p).getWork2_value()%>"> <input
			type="hidden" name="num" value="<%=p%>"> <input type="hidden"
			name="work1id" value="<%=value%>"> <input type="radio"
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
	<script src="js/bootstrap.js"></script>
</body>
</html> 
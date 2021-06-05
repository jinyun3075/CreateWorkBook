<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="work2.Work2DAO"%>
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
				<li class="active"><a href="work.jsp">My WorkBook</a></li>
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
	<br />
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
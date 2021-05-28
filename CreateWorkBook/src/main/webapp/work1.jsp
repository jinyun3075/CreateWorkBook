<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%request.setCharacterEncoding("UTF-8"); %>
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
		<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
		}
			%>
			<nav class="navbar navbar-default">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="main.jsp">Work Book Maker</a>
				</div>
				<div class="collapse navbar-collapse" id="bs=example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="work.jsp">문제집 모음</a></li>
					</ul>
					<%if(userID ==null){ %>
					<ul class="nav navbar-nav navbar-right">
								<li><a href="login.jsp" >Login</a></li>
					</ul>
					<%}else{ %>

					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"><%= userID   %> <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="logoutAction.jsp">로그아웃</a></li>
							</ul>
						</li>
					</ul>
					<%} %>
				</div>
			</nav>
		
		<form action="work1Action.jsp" method="post">
			<input type="text" name="work1Title"> 문제집
			<input type="submit" value="문제집추가"> 			
		</form>
		
</body>
</html>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap.css">
<title>WorkBook</title>
</head>
<body>
	<c:set var="userID" value="${sessionScope.userID}"/>
	<c:set var="name" value="${sessionScope.userName }"/>
	<c:set var="a" value="${val}"/>
	<c:if test="${a==1}">
		<script>
			alert("로그인 성공");
		</script>
	</c:if>
	<c:if test="${a==2}">
		<script>
			alert("회원가입 성공");
		</script>
	</c:if>
	<%
	response.setContentType("text/html; charset=utf-8");
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
				<li><a href="workList.wo">My WorkBook</a></li>
				<li><a href="workList.publ">Public WorkBook</a></li>
			</ul>
			<c:if test="${empty userID}">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="login.jsp">Login</a></li>
			</ul>
			</c:if>
			<c:if test="${!empty userID}">

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">${name }<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logout.do">로그아웃</a></li>
					</ul></li>
			</ul>
			</c:if>
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>내가만든문제집 풀어보고 공유하자!!</h1>
				<c:if test="${!empty userID}">
				<p>${name }님 환영합니다.
				</p>
				</c:if>
				<p>
					<a class="btn btn-primary btn-pull" href="work1.jsp" role="button">문제집
						만들기</a>
				</p>
			</div>
		</div>
	</div>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/1.jpg">
				</div>
				<div class="item">
					<img src="images/2.jpg">
				</div>
				<div class="item">
					<img src="images/3.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${val==1}">
		<script >
		alert("모든 항목을 채워주세요")
		</script>
	</c:if>
	<c:if test="${val==3}">
		<script >
		alert("가입되어있는 아이디입니다.")
		</script>
	</c:if>
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
				<ul class="nav navbar-nav navbar-right">
				<li><a href="login.jsp">Login</a></li>
			</ul>
		</div>
	</nav>


	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="join.do">
					<h3 style="text-align: center;">회원가입 화면</h3>
					<div class="form-group">
						<label for="exampleInputEmail1" class="text-uppercase">아이디</label>
						<input type="text" class="form-control"
							name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1" class="text-uppercase">암호</label>
						<input type="password" class="form-control"
							name="userPW" maxlength="20">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1" class="text-uppercase">별명</label>
						<input type="text" class="form-control" name="name"
							maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="회원가입">
				</form>
			</div>
		</div>

	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
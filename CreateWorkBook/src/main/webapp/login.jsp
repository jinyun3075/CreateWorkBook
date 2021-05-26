<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap.css">
<title>WorkBook</title>
</head>
<body>
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
				<li><a href="main.jsp">게시판</a></li>
			</ul>
		</div>
	</nav>
	
<section class="login-block">
	<div class="row">
		<div class="col-md-4 login-sec">
		    <h2 class="text-center">Login Now</h2>
<form class="login-form" action="loginAction.jsp" method="post">
  
  <div class="form-group">
    <label for="exampleInputEmail1" class="text-uppercase">Username</label>
    <input type="text" class="form-control" name="userID" placeholder="">
  </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1" class="text-uppercase">Password</label>
    <input type="password" class="form-control" name="userPW" placeholder="">
  </div>
  
  <button type="submit" class="btn btn-login float-right">로그인</button>
  
</form>
<div class="copy-text">아이디가 없나요? <a href="join.jsp">회원가입</a></div>
		</div>
	<div class="contaner">
	<div class="col-md-8 banner-sec">
    	
        	<div class="carousel-inner" role="listbox">
      				<img class="d-block img-fluid" src="images/1.jpg" alt="First slide">
      					<div class="carousel-caption d-none d-md-block">
        					<div class="banner-text">
            					<h2>한문제만 더풀자,,</h2>
            					<p>언능 드루와~</p>	
        					</div>	
				  		</div>	
            </div>	   
		
	</div>
	</div>
</div>
</section>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<%request.setCharacterEncoding("UTF-8"); %>
<c:set var ="name" value="${sessionScope.userName }"/>
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
				<li class="active"><a href="workList.wo">My WorkBook</a></li>
				<li><a href="workList.publ">Public WorkBook</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">${name } <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logout.do">로그아웃</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
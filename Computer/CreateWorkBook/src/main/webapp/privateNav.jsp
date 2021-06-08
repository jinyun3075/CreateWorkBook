<%@ page import="java.io.PrintWriter"%>
<%
String name = (String) session.getAttribute("userName");
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

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><%=name%> <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
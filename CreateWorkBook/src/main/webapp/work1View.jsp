<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="work2.Work2DAO" %>
	<%@ page import="work1.Work1DAO" %>
	<%@ page import="java.util.ArrayList" %>
	<%@ page import="work2.Work2DTO" %>
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
		String title=null;
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
					<a class="navbar-brand" href="index.jsp">Work Book Maker</a>
				</div>
				<div class="collapse navbar-collapse" id="bs=example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a href="work.jsp">나만의 문제집</a></li>
						<li><a href="public/public.jsp">공유 문제집</a></li>
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
		<br/>
		<% 
			String work1Id = (String) request.getParameter("work1id");
			Work2DAO dao = new Work2DAO();
			ArrayList<Work2DTO> list = new ArrayList<>();
			list = dao.getList(work1Id, userID);
			for(int i=0;i<list.size();i++){
		%>
			<%=list.get(i).getWork2Id() %>번 문제 : <%=list.get(i).getWork2_Qw() %>&nbsp;
			<a href="work2Update.jsp?id1=<%=work1Id%>&&id2=<%=list.get(i).getWork2Id()%>" class="btn btn-primary">수정</a>&nbsp;
			<a href="work2Delete.jsp?id1=<%=work1Id%>&&id2=<%=list.get(i).getWork2Id()%>" class="btn btn-primary">삭제</a>
			<br/>
		<%
			}	
		%>
		
		<form action="work2.jsp" method="post">
			<input type="hidden" name="work1id" value="<%=work1Id %>">
			<input type="submit" value="문제 추가">
		</form>
		<form action="work1Delete.jsp" method="post">
			<input type="hidden" name="work1id" value="<%=work1Id %>">
			<input type="submit" value="문제집 삭제">
		</form>
		<form action="startworkView.jsp" method="post">
			<input type="hidden" name="work1id" value="<%=work1Id %>">
			<input type="submit" value="문제 풀기">
		</form>
		<br><br><br>
		<%
			Work1DAO work1dao = new Work1DAO();
			String comp = work1dao.shere(work1Id,userID);
			if(comp.equals("1")){
		%>
		<form action="work1Shere.jsp" method="post">
			<input type="hidden" name="work1Id" value="<%=work1Id %>">
			<input type="hidden" name="shere" value="0">
			<input type="submit" value="문제 공유하기">
		</form>
		<%		
			}else{
		%>
		<form action="work1Shere.jsp" method="post">
			<input type="hidden" name="work1Id" value="<%=work1Id %>">
			<input type="hidden" name="shere" value="1">
			<input type="submit" value="문제 공유해체">
		</form>
		<%} %>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
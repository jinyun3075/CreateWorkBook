<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="work1.Work1DAO"%>
<%@ page import="work1.Work1DTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/custom.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<meta charset="UTF-8">
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인하시오.')");
		script.println("location.href ='../login.jsp'");
		script.println("</script>");
	}
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
			<a class="navbar-brand" href="../index.jsp">Work Book Maker</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs=example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="../work.jsp">My WorkBook</a></li>
				<li class="active"><a href="public.jsp">Public WorkBook</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><%=userID%> <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="../logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>

		</div>
	</nav>
	<form action="#" method="post">
		<input type="text" name="serch"> <input type="submit"
			value="검색">
	</form>
	<table class="table table-striped"
		style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th style="background-color: #eeeeee; text-align: center;">작성자</th>
				<th style="background-color: #eeeeee; text-align: center;">제목</th>
				<th style="background-color: #eeeeee; text-align: center;">작성일</th>
				<th style="background-color: #eeeeee; text-align: center;">문제 푼
					사람</th>
			</tr>
		</thead>
		<tbody>
			<%
			String serch = "%";
			if (request.getParameter("serch") != null) {
				serch = (String) request.getParameter("serch") + "%";
			}
			Work1DAO DAO = new Work1DAO();
			ArrayList<Work1DTO> list = DAO.publicgetlist(serch, pageNumber);
			for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<td><%=list.get(i).getUserId()%></td>
				<td><a
					href="work1View.jsp?title=<%=list.get(i).getWork1Title()%>&&work1id=<%=list.get(i).getWork1Id()%>&&makeuser=<%=list.get(i).getUserId()%>"><%=list.get(i).getWork1Title().replaceAll(" ", "&nbsp").replaceAll(">", "&gt;").replaceAll("<", "&lt;")
		.replaceAll("\n", "<br>")%></a></td>
				<td><%=list.get(i).getWorkDate().substring(0, 11) + list.get(i).getWorkDate().substring(11, 13) + "시"
		+ list.get(i).getWorkDate().substring(14, 16) + "분"%></td>
				<td><%=list.get(i).getCli()%></td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>
	<%
	if (pageNumber != 1) {
	%>
	<a href="public.jsp?pageNumber=<%=pageNumber - 1%>&&serch=<%=serch %>"
		class="btn btn-success btn-arraw-left">이전</a>
	<%
	}
	if (DAO.publnextPage(pageNumber + 1, serch)) {
	%>
	<a href="public.jsp?pageNumber=<%=pageNumber + 1%>&&serch=<%=serch %>"
		class="btn btn-success btn-arraw-left">다음</a>
	<%
	}
	%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>

</body>
</html>
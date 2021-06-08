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
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap.css">
<meta charset="UTF-8">
<style>
.paging {
	text-align: center;
}

.paging a {
	display: inline-block;
	font-weight: bold;
	text-decoration: none;
	padding: 5px 8px;
	border: 1px solid #ccc;
	color: #000;
	background-color: #F5F5DC;
}

.paging a.select {
	color: #fff;
	background-color: #FFA7A7;
}
</style>
</head>
<body>
	<%
	String userID = null;
	String name=null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
		name = (String) session.getAttribute("userName");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인하시오.')");
		script.println("location.href ='login.jsp'");
		script.println("</script>");
	}
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>
	<jsp:include page="privateNav.jsp"/>
	<form action="#" method="post">
		<input type="text" name="serch"> <input type="submit"
			value="검색">
	</form>
	<table class="table table-striped"
		style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th style="background-color: #eeeeee; text-align: center;">번호</th>
				<th style="background-color: #eeeeee; text-align: center;">제목</th>
				<th style="background-color: #eeeeee; text-align: center;">작성일</th>
			</tr>
		</thead>
		<tbody>
			<%
			String serch = "%";
			if (request.getParameter("serch") != null) {
				serch = (String) request.getParameter("serch") + "%";
			}
			Work1DAO DAO = new Work1DAO();
			ArrayList<Work1DTO> list = DAO.getlist(userID, pageNumber, serch);
			for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<td><%=list.get(i).getWork1Id()%></td>
				<td><a
					href="work1View.jsp?work1id=<%=list.get(i).getWork1Id()%>"><%=list.get(i).getWork1Title().replaceAll(" ", "&nbsp").replaceAll(">", "&gt;").replaceAll("<", "&lt;")
		.replaceAll("\n", "<br>")%></a></td>
				<td><%=list.get(i).getWorkDate().substring(0, 11) + list.get(i).getWorkDate().substring(11, 13) + "시"
		+ list.get(i).getWorkDate().substring(14, 16) + "분"%></td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>
		<div class="paging">
	<%
	if (pageNumber != 1) {
	%>
	<a href="work.jsp?pageNumber=<%=pageNumber - 1%>&&serch=<%=serch%>"
		class="btn btn-success">이전</a>
	<%
	}
	%>
	<%
		int pag=0;
		pag=pageNumber/5;
		pag*=5;
		int cnt=0;
		while(cnt<5){
		if(!DAO.nextPage(pag + 1, serch,userID)){
			break;
		}
		if(pag+1==pageNumber){
	%>
			<a class="select" href="work.jsp?pageNumber=<%=pag+1%>&&serch=<%=serch%>"><%=pag+1%></a>
	<% 			
		}else{
	%>
		<a href="work.jsp?pageNumber=<%=pag+1%>&&serch=<%=serch%>"><%=pag+1%></a>	
	<%		
		}
			pag++;
			cnt++;
		}
	%>
	<%
	if (DAO.nextPage(pageNumber + 1, serch,userID)) {
	%>
	<a href="work.jsp?pageNumber=<%=pageNumber + 1%>&&serch=<%=serch%>"
		class="btn btn-success">다음</a>
	<%
	}
	%>
		</div>
	<a href="work1.jsp" class="btn btn-primary pull-right">문제집만들기</a>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>
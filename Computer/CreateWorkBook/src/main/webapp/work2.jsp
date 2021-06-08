<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap.css">
<meta charset="UTF-8">
</head>
<body>
<%
	String userid = null;
	String work1Id = (String) request.getParameter("work1id");
	if (session.getAttribute("userID") != null) {
		userid = (String) session.getAttribute("userID");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인하시오.')");
		script.println("location.href ='login.jsp'");
		script.println("</script>");
	}
	%>
	<jsp:include page="privateNav.jsp"/>
	<form action="work2Action.jsp" method="post">
		<input type="hidden" name="userId" value="<%=userid%>"> <input
			type="hidden" name="work1Id" value="<%=work1Id%>"> 문제 <input
			type="text" name="work2_Qw"><br /> 보기1<input type="text"
			name="work2_view1"><br /> 보기2<input type="text"
			name="work2_view2"><br /> 보기3<input type="text"
			name="work2_view3"><br /> 보기4<input type="text"
			name="work2_view4"><br /> 정답(번호입력)<input type="text"
			name="work2_value"><br /> <input type="submit" value="추가">
	</form>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
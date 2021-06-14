<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="work2.Work2DTO"%>
<%@ page import="work2.Work2DAO"%>
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
	if (session.getAttribute("userID") != null) {
		userid = (String) session.getAttribute("userID");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인하시오.')");
		script.println("location.href ='login.jsp'");
		script.println("</script>");
	}
	String work1Id = (String) request.getParameter("id1");
	String work2Id = (String) request.getParameter("id2");
	Work2DTO dto = new Work2DTO();
	Work2DAO dao = new Work2DAO();
	dto = dao.updateList(userid, work1Id, work2Id);
	%>
	<jsp:include page="privateNav.jsp"/>
	<form action="work2UpdateAction.jsp" method="post">
		<input type="hidden" name="userId" value="<%=userid%>"> <input
			type="hidden" name="work1Id" value="<%=work1Id%>"> <input
			type="hidden" name="work2Id" value="<%=work2Id%>"> 문제 <input
			type="text" name="work2_Qw" value="<%=dto.getWork2_Qw()%>"><br />
		보기1<input type="text" name="work2_view1"
			value="<%=dto.getWork2_view1()%>"><br /> 보기2<input
			type="text" name="work2_view2" value="<%=dto.getWork2_view2()%>"><br />
		보기3<input type="text" name="work2_view3"
			value="<%=dto.getWork2_view3()%>"><br /> 보기4<input
			type="text" name="work2_view4" value="<%=dto.getWork2_view4()%>"><br />
		정답(정답번호입력)<input type="text" name="work2_value"
			value="<%=dto.getWork2_value()%>"><br /> <input type="submit"
			value="수정">
	</form>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
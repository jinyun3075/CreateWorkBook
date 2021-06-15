<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="work2.Work2DAO"%>
	<%@ page import="java.io.PrintWriter"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<c:if test="${empty sessionScope.userID}">
		<script>
			alert("로그인하시오")
			location.href="login.jsp"
		</script>
	</c:if>
	<jsp:include page="privateNav.jsp"/>
	<form action="resolvWork.wo" method="post">
		<input type="hidden" name="work1Id" value="${param.work1Id }">
		<input type="hidden" name="cs" value="0"> 
		<input
			type="submit" value="공부 모드">
	</form>
	<form action="resolvWork.wo" method="post">
		<input type="hidden" name="work1Id" value="${param.work1Id }"> 
		<input type="hidden" name="cs" value="1">
		<input
			type="submit" value="시험 모드">
	</form>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html> 
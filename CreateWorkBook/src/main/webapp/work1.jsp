<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
	<c:if test="${val==3 }">
		<script>
			alert("문제집 이름을 정해주세요")
		</script>
	</c:if>
	<jsp:include page="privateNav.jsp"/>

	<form action="makeWork1.wo" method="post">
		<input type="text" name="work1Title"> 문제집 <input type="submit"
			value="문제집만들기">
	</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<c:if test="${!empty param.work1Title}">
		<c:set var = "title" value="${param.work1Title}" scope="session"/>		
	</c:if>
	<c:if test="${empty sessionScope.userID}">
		<script>
			alert("로그인하시오")
			location.href="login.jsp"
		</script>
	</c:if>
	<c:if test="${va==1}">
		<script>
			alert("저장되었습니다.")
		</script>
	</c:if>
	<jsp:include page="publicNav.jsp"/>

	<br />
	
	<h2>문제집 : ${title}</h2>

	<c:forEach var="l" items="${list}">
		${l.getWork2Id()}번 문제 :
		${l.getWork2_Qw()}&nbsp;
		<br/>
	</c:forEach>
	
	<form action="choice.publ" method="post">
		<input type="hidden" name="work1Id" value="${param.work1Id }"> <input
			type="hidden" name="makeUser" value="${param.makeUser}"> <input
			type="submit" value="문제 풀기">
	</form>
	<form action="getWork.publ" method="post">
		<input type="hidden" name="work1Id" value="${param.work1Id }"> <input
			type="hidden" name="makeUser" value="${param.makeUser}"> <input
			type="hidden" name="work1Title" value="${title}"> <input
			type="submit" value="My WorkBook에 저장">
	</form>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html> 
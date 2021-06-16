<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%request.setCharacterEncoding("UTF-8"); %>
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
	
	<jsp:include page="privateNav.jsp"/>

	<h2>문제집 : ${title}</h2>

	<c:forEach var="l" items="${list}">
		${l.getWork2Id()}번 문제 :
		${l.getWork2_Qw()}&nbsp;
		<a
			href="work2Update.wo?work1Id=${param.work1Id}&&work2Id=${l.getWork2Id()}"
			class="btn btn-primary">수정</a>&nbsp;
		<a
			href="work2Delete.wo?work1Id=${param.work1Id}&&work2Id=${l.getWork2Id()}"
			class="btn btn-primary">삭제</a>
		<br/>
	</c:forEach>
	
	<form action="work2.jsp" method="post">
		<input type="hidden" name="work1Id" value="${param.work1Id}"> <input
			type="submit" value="문제 추가">
	</form>
	<br/>
	<form action="work1Update.jsp" method="post">
		<input type="hidden" name="work1Id" value="${param.work1Id}"> <input
			type="submit" value="문제집 수정">
	</form>
	<form action="work1Delete.wo" method="post">
		<input type="hidden" name="work1Id" value="${param.work1Id}"> <input
			type="submit" value="문제집 삭제">
	</form>
	<form action="choice.wo" method="post">
		<input type="hidden" name="work1Id" value="${param.work1Id}"> <input
			type="submit" value="문제 풀기">
	</form>
	<br>
	<br>
	<br>
	
	<c:choose>
		<c:when test="${comp==1}">
			<form action="workShere.wo" method="post">
				<input type="hidden" name="work1Id" value="${param.work1Id}"/> 
				<input type="hidden" name="shere" value="0"/> 
				<input type="submit" value="문제 공유하기"/>
			</form>
		</c:when>
		<c:otherwise>
			<form action="workShere.wo" method="post">
				<input type="hidden" name="work1Id" value="${param.work1Id}"> 
				<input type="hidden" name="shere" value="1"> 
				<input type="submit" value="문제 공유해체">
	</form>
		</c:otherwise>
	</c:choose>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html> 
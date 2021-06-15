<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="work2.Work2DAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="work2.Work2DTO"%>
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
	<%
	request.setCharacterEncoding("UTF-8");
	%>
	<c:if test="${empty sessionScope.userID}">
		<script>
			alert("로그인하시오")
			location.href="login.jsp"
		</script>
	</c:if>
	<jsp:include page="privateNav.jsp"/>
	<c:choose>
		<c:when test="${!empty param.num }">
			<c:set var="p" value="${param.num }"/>
		</c:when>
		<c:otherwise>
			<c:set var="p" value="${0}"/>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${!empty param.score}">
			<c:set var="score" value="${param.score}"/>
		</c:when>
		<c:otherwise>
			<c:set var="score" value="${0}"/>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${list.size() <= p }">
			<h1>모든 문제를 다 풀었습니다~</h1>	
			<c:if test="${param.cs==1 }">
				정답률 ${param.score}/${list.size()}
				<br><br>
					틀린문제
				<br><br>
				<c:forEach var="wrong" items="${wrong}">
					<p>${wrong.getWork2Id()}번 문제: &nbsp;${wrong.getWork2_Qw()}</p>
					<p>1. ${wrong.getWork2_view1()}<br></p>
					<p>2. ${wrong.getWork2_view2()}<br></p>
					<p>3. ${wrong.getWork2_view3()}<br></p>
					<p>4. ${wrong.getWork2_view4()}<br></p>
					정답 (${wrong.getWork2_value()})
					<br><br>
					--------------------------
				</c:forEach>
			</c:if>
				<br>
				<a href="work2View.wo?work1Id=${param.work1Id}" class="btn btn-primary">처음으로</a>&nbsp;
		</c:when>
		<c:otherwise>
			<c:if test="${param.cs==0 }">
				<p>${list[p].getWork2Id()}번:${list[p].getWork2_Qw() }<br /></p>
				<form action="startwork.jsp" method="post">
					<input type="hidden" name="cs" value="0">
					 <input type="hidden"
						name="val" value="${list[p].getWork2_value()}"> <input
						type="hidden" name="num" value="${p}"> <input type="hidden"
						name="work1Id" value="${param.work1Id}"> <input type="radio"
						name="qs" value="1">
					${list[p].getWork2_view1()}<br> <input type="radio"
						name="qs" value="2">
					${list[p].getWork2_view2()}<br> <input type="radio"
						name="qs" value="3">
					${list[p].getWork2_view3()}<br> <input type="radio"
						name="qs" value="4">
					${list[p].getWork2_view4()}<br> <input type="submit"
						value="답 확인">
				</form>
			</c:if>
			<c:if test="${param.cs==1 }">
				<p>${list[p].getWork2Id()}번:${list[p].getWork2_Qw() }<br /></p>
				<form action="startwork.jsp" method="post">
					<input type="hidden" name="cs" value="1">
					<input type="hidden" name="work2id" value="${list[p].getWork2Id()}">
					<input type="hidden" name="score" value="${score}">
					 <input type="hidden"
						name="val" value="${list[p].getWork2_value()}"> <input
						type="hidden" name="num" value="${p}"> <input type="hidden"
						name="work1Id" value="${param.work1Id}"> <input type="radio"
						name="qs" value="1">
					${list[p].getWork2_view1()}<br> <input type="radio"
						name="qs" value="2">
					${list[p].getWork2_view2()}<br> <input type="radio"
						name="qs" value="3">
					${list[p].getWork2_view3()}<br> <input type="radio"
						name="qs" value="4">
					${list[p].getWork2_view4()}<br> <input type="submit"
						value="답 제출">
				</form>
				
			</c:if>
		</c:otherwise>
	</c:choose>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html> 
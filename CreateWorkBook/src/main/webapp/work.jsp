<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<c:if test="${empty sessionScope.userID}">
		<script>
			alert("로그인하시오")
			location.href="login.jsp"
		</script>
	</c:if>
	<c:choose>
		<c:when test="${val==1}">
			<script>
				alert("만들기 실패")
			</script>
		</c:when>
		<c:when test="${val==2}">
			<script>
				alert("만들기 성공")
			</script>
			<c:redirect url="work2View.wo">
				<c:param name="work1Id" value="${work1}"/>
				<c:param name="work1Title" value="${param.work1Title}"/>
			</c:redirect>
		</c:when>
		<c:when test="${val==4}">
			<script>
				alert("문제집이 정상적으로 삭제 되었습니다.")
			</script>
		</c:when>
	</c:choose>
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
			<c:forEach var="viewlist" items="${list}">
				<tr>
				<td>${viewlist.getWork1Id()}</td>
				<td><a href="work2View.wo?work1Id=${viewlist.getWork1Id()}&&work1Title=${viewlist.getWork1Title()}">${viewlist.getWork1Title()}</a></td>
				<td>${viewlist.getWorkDate()}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<div class="paging">
		<c:if test="${pageNumber!=1}">
			<a href="workList.wo?pageNumber=${pageNumber-1}&&serch=${serch}"class="btn btn-success">이전</a>
		</c:if>
		<c:set var="pagg" value="${pag}"/>
		<c:forEach begin="1" end="5" step="1" var="i">
			<c:if test="${b}">	
			<c:choose>
				<c:when test="${pagg+1==pageNumber}">
					<a class="select" href="workList.wo?pageNumber=${pagg+1}&&serch=${serch}">${pagg+1}</a>
				</c:when>
				<c:otherwise>
					<a href="workList.wo?pageNumber=${pagg+1}&&serch=${serch}">${pagg+1}</a>			
				</c:otherwise>
			</c:choose>
			</c:if>
			<c:set var="pagg" value="${pagg+1}"/>
			<c:set var="b" value="${DAO.nextPage(pagg+1,serch,userID)}"/>
		</c:forEach>
		<c:if test="${a}">
			<a href="workList.wo?pageNumber=${pageNumber+1}&&serch=${serch}"
				class="btn btn-success">다음</a>			
		</c:if>
		
		</div>
	<a href="work1.jsp" class="btn btn-primary pull-right">문제집만들기</a>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>
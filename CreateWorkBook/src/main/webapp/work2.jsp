<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.io.PrintWriter"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap.css">
<meta charset="UTF-8">
</head>
<body>
	<c:if test="${empty sessionScope.userID}">
		<script>
			alert("로그인하시오")
			location.href="login.jsp"
		</script>
	</c:if>
	<c:if test="${val==1}">
		<script>
			alert("모든 항목을 채워주세요")
		</script>
	</c:if>
	<jsp:include page="privateNav.jsp"/>
	<form action="work2Action.wo" method="post">
		<input type="hidden" name="work1Title" value="${param.work1Title}">
		<input type="hidden" name="userId" value="${sessionScope.userID}"> <input
			type="hidden" name="work1Id" value="${param.work1Id}"> 문제 <input
			type="text" name="work2_Qw"><br /> 보기1<input type="text"
			name="work2_view1"><br /> 보기2<input type="text"
			name="work2_view2"><br /> 보기3<input type="text"
			name="work2_view3"><br /> 보기4<input type="text"
			name="work2_view4"><br /> 정답
			1번<input type="radio" name="work2_value" value="1">&nbsp;
			2번<input type="radio" name="work2_value" value="2">&nbsp;
			3번<input type="radio" name="work2_value" value="3">&nbsp;
			4번<input type="radio" name="work2_value" value="4"><br /> 
			<input type="submit" value="추가">
	</form>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
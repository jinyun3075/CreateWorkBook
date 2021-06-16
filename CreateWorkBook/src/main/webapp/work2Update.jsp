<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<jsp:include page="privateNav.jsp"/>
	<form action="Update.wo" method="post">
		<input type="hidden" name="userId" value="${sessionScope.userID}"> <input
			type="hidden" name="work1Id" value="${param.work1Id }"> <input
			type="hidden" name="work2Id" value="${param.work2Id }"> 문제 <input
			type="text" name="work2_Qw" value="${dto.getWork2_Qw()}"><br />
		보기1<input type="text" name="work2_view1"
			value="${dto.getWork2_view1()}"><br /> 보기2<input
			type="text" name="work2_view2" value="${dto.getWork2_view2()}"><br />
		보기3<input type="text" name="work2_view3"
			value="${dto.getWork2_view3()}"><br /> 보기4<input
			type="text" name="work2_view4" value="${dto.getWork2_view4()}"><br />
		정답
			<c:choose>
				<c:when test="${dto.getWork2_value()==1 }">
					1번<input type="radio" name="work2_value" value="1" checked>		
				</c:when>
				<c:otherwise>
					1번<input type="radio" name="work2_value" value="1">			
				</c:otherwise>
			</c:choose>
			&nbsp;
			<c:choose>
				<c:when test="${dto.getWork2_value()==2 }">
					2번<input type="radio" name="work2_value" value="2" checked>		
				</c:when>
				<c:otherwise>
					2번<input type="radio" name="work2_value" value="2">			
				</c:otherwise>
			</c:choose>
			&nbsp;
			<c:choose>
				<c:when test="${dto.getWork2_value()==3 }">
					3번<input type="radio" name="work2_value" value="3" checked>		
				</c:when>
				<c:otherwise>
					3번<input type="radio" name="work2_value" value="3">			
				</c:otherwise>
			</c:choose>
			&nbsp;
			<c:choose>
				<c:when test="${dto.getWork2_value()==4 }">
					4번<input type="radio" name="work2_value" value="4" checked>		
				</c:when>
				<c:otherwise>
					4번<input type="radio" name="work2_value" value="4">			
				</c:otherwise>
			</c:choose>
			<br /> <input type="submit" value="수정">
	</form>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
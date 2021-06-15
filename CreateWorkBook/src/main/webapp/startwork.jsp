<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="work2.Work2DAO"%>
<%@ page import="java.io.PrintWriter"%>

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
	<%
		request.setCharacterEncoding("UTF-8");
		
		int	work2id= 0;
		if(request.getParameter("work2id")!=null){			
			work2id=Integer.parseInt((String)request.getParameter("work2id"));
		}
		String userID=(String)session.getAttribute("userID");
		Work2DAO dao = new Work2DAO();
	%>
	<jsp:include page="privateNav.jsp"/>
	
	<c:if test="${param.cs==0}">
		<c:if test="${param.val==param.qs}">
			<h1>정답입니다!!</h1>
			<form action="resolvWork.wo" method="post">
				<input type="hidden" name="cs" value="0"> <input type="hidden"
					name="num" value="${param.num }"> <input type="hidden"
					name="work1Id" value="${param.work1Id}"> <input type="submit"
					value="문제 다시풀기">
			</form>
			<form action="resolvWork.wo" method="post">
				<input type="hidden" name="cs" value="0"> <input type="hidden"
					name="num" value="${param.num+1}"> <input type="hidden"
					name="work1Id" value="${param.work1Id}"> <input type="submit"
					value="다음문제 풀기">
			</form>
		</c:if>
		<c:if test="${param.val!=param.qs}">
			<h1>틀렸습니다!!</h1>
			<form action="resolvWork.wo" method="post">
				<input type="hidden" name="cs" value="0"> <input type="hidden"
					name="num" value="${param.num }"> <input type="hidden"
					name="work1Id" value="${param.work1Id}"> <input type="submit"
					value="문제 다시풀기">
			</form>			
		</c:if>
	</c:if>
	<c:if test="${param.cs==1}">
		<c:if test="${param.val==param.qs}">
			<c:redirect url="resolvWork.wo">
				<c:param name="cs" value="1"/>
				<c:param name="num" value="${param.num+1}"/>
				<c:param name="score" value="${param.score+1}"/>
				<c:param name="work1Id" value="${param.work1Id}"/>
			</c:redirect>			
		</c:if>
		<c:if test="${param.val!=param.qs}">
			<%dao.wrong(userID, work2id);%>
			<c:redirect url="resolvWork.wo">
				<c:param name="cs" value="1"/>
				<c:param name="num" value="${param.num+1}"/>
				<c:param name="score" value="${param.score}"/>
				<c:param name="work1Id" value="${param.work1Id}"/>
			</c:redirect>			
		</c:if>
	</c:if>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="work2.Work2DTO" %>
	<%@ page import="work2.Work2DAO" %>
	<%@ page import="java.io.PrintWriter" %>
	<%request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="work2" class="work2.Work2DTO"/>
	<jsp:setProperty property="userId" name="work2"/>
	<jsp:setProperty property="work1Id" name="work2"/>
	<jsp:setProperty property="work2Id" name="work2"/>
	<jsp:setProperty property="work2_Qw" name="work2"/>
	<jsp:setProperty property="work2_view1" name="work2"/>
	<jsp:setProperty property="work2_view2" name="work2"/>
	<jsp:setProperty property="work2_view3" name="work2"/>
	<jsp:setProperty property="work2_view4" name="work2"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%		
	
		
		Work2DTO dto = new Work2DTO();
		Work2DAO dao = new Work2DAO();
		int result = dao.update(work2);
		if(result ==1){
			response.sendRedirect("work1View.jsp?work1id="+work2.getWork1Id());
		}else if(result==-1){
			response.sendRedirect("work1View.jsp?work1id="+work2.getWork1Id());
		}
		
	%>
	
	
</body>
</html>
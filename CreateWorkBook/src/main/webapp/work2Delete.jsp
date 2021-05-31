<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="work2.Work2DAO" %>
	<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
		<%
			String userID = (String)session.getAttribute("userID");
			String work1Id = (String) request.getParameter("id1");
			String work2Id = (String) request.getParameter("id2");
			Work2DAO dao =new Work2DAO();
			
			int result = dao.delete(userID,work1Id,work2Id);
			if(result==1){
				response.sendRedirect("work1View.jsp?work1id="+work1Id);
			}else{
				response.sendRedirect("work1View.jsp?work1id="+work1Id);
			}
			
		%>
</body>
</html>
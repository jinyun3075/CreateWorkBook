<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="work1.Work1DAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
			PrintWriter script = response.getWriter();
			String userID = (String)session.getAttribute("userID");
			String work1Id = (String) request.getParameter("work1id");
			Work1DAO dao =new Work1DAO();
			
			int result = dao.delete(userID,work1Id);
			if(result==1){
				script.println("<script>");
				script.println("alert('삭제되었습니다.')");
				script.println("location.href='work.jsp'");
				script.println("</script>");
			}else{
				script.println("<script>");
				script.println("location.href='work.jsp'");
				script.println("alert('실패')");
				script.println("</script>");
			}
			
		%>
</body>
</html>
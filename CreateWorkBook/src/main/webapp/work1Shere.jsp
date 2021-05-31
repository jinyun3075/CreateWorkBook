<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="work1.Work1DAO" %>
	<%@ page import="java.io.PrintWriter" %>
	<%request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="work1" class="work1.Work1DTO" scope="page"/>
	<jsp:setProperty property="work1Id" name="work1"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
		<% 
			
			PrintWriter script = response.getWriter();
			String val = (String)request.getParameter("shere");
			String userID = null;
			if(session.getAttribute("userID")!=null){
				userID = (String) session.getAttribute("userID");								
				Work1DAO work = new Work1DAO();
				int result= work.change(work1.getWork1Id(),userID,val);
				if(result == -1){
					script.println("<script>");
					script.println("alert('실패')");
					script.println("location.href='work.jsp'");
					script.println("</script>");
				}else{					
					response.sendRedirect("work1View.jsp?work1id="+work1.getWork1Id());
				}
			}else{
				script.println("<script>");
				script.println("alert('로그인후 이용해주세요')");
				script.println("location.href='login.jsp'");
				script.println("</script>");
			}
		%>
</body>
</html>
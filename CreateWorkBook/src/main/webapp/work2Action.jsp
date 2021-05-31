<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="work2.Work2DAO" %>
	<%@ page import="java.io.PrintWriter" %>
	<%request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="work2" class="work2.Work2DTO" scope="page"/>
	<jsp:setProperty property="userId" name="work2"/>
	<jsp:setProperty property="work1Id" name="work2"/>
	<jsp:setProperty property="work2Id" name="work2"/>
	<jsp:setProperty property="work2_Qw" name="work2"/>
	<jsp:setProperty property="work2_view1" name="work2"/>
	<jsp:setProperty property="work2_view2" name="work2"/>
	<jsp:setProperty property="work2_view3" name="work2"/>
	<jsp:setProperty property="work2_view4" name="work2"/>
	<jsp:setProperty property="work2_value" name="work2"/>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
		<% 
			PrintWriter script = response.getWriter();
			String userID = null;
			if(session.getAttribute("userID")!=null){
				userID = (String) session.getAttribute("userID");
				if(work2.getWork2_Qw()!=null||work2.getWork2_view1()!=null||work2.getWork2_view2()!=null||
						work2.getWork2_view3()!=null||work2.getWork2_view4()!=null||work2.getWork2_value()!=null){					
						Work2DAO work = new Work2DAO();
				int result=work.createQs(work2);
				if(result == -1){  
					script.println("<script>");
					script.println("alert('만들기 실패')");
					script.println("location.href='work.jsp'");
					script.println("</script>");
				}else{					
					response.sendRedirect("work1View.jsp?work1id="+work2.getWork1Id());
				}
					}
				else{
					script.println("<script>");
					script.println("alert('문제집 이름을 알려주세요!')");
					script.println("location.href='work1View.jsp'");
					script.println("</script>");	
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
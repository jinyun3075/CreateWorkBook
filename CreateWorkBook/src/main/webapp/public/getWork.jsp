<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%request.setCharacterEncoding("UTF-8");  %>
	<%@ page import="work2.Work2DAO" %>
	<%@ page import="java.util.ArrayList" %>
	<%@ page import="work2.Work2DTO" %>
	<%@ page import="work1.Work1DAO" %>
	<%@ page import="java.io.PrintWriter" %>
	<jsp:useBean id="work1" class="work1.Work1DTO"/>
	<jsp:setProperty property="work1Id" name="work1"/>
	<jsp:setProperty property="userId" name="work1"/>
	<jsp:setProperty property="work1Title" name="work1"/>
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
			}
			Work2DAO work2dao = new Work2DAO();
			ArrayList<Work2DTO> list = new ArrayList<>();
			list = work2dao.getWork2(work1.getUserId(), work1.getWork1Id());
			
			Work1DAO work1dao = new Work1DAO();
			int newWork1Id = work1dao.makeAndget(work1.getWork1Title(), userID);
			
			for(int i=0;i<list.size();i++){
				list.get(i).setUserId(userID);
				list.get(i).setWork1Id(""+newWork1Id);
				work2dao.createQs(list.get(i));
			}	
			script.println("<script>");
			script.println("alert('저장되었습니다.')");
			script.println("history.back()");
			script.println("</script>");
		%>
		
		
		
	
</body>
</html>
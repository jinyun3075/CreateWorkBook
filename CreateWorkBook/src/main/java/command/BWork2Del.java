package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import work2.Work2DAO;

public class BWork2Del implements BCommand{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String userID = (String) session.getAttribute("userID");
		String work1Id = (String) request.getParameter("work1Id");
		String work2Id = (String) request.getParameter("work2Id");
		Work2DAO dao = new Work2DAO();
		dao.delete(userID, work1Id, work2Id);
		
	}
}

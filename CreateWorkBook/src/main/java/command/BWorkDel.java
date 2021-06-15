package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import work1.Work1DAO;

public class BWorkDel implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		String userID = (String)session.getAttribute("userID");
		String work1Id = (String) request.getParameter("work1Id");
		Work1DAO dao =new Work1DAO();
		dao.delete(userID,work1Id);
		request.setAttribute("val", 4);
	}

}

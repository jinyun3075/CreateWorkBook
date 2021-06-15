package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import work1.Work1DAO;

public class BWorkShere implements BCommand{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String val = (String) request.getParameter("shere");
		String work1Id = (String) request.getParameter("work1Id");
		String userId = (String) session.getAttribute("userID");
		Work1DAO work = new Work1DAO();
		work.change(work1Id, userId, val);
		
	}
}

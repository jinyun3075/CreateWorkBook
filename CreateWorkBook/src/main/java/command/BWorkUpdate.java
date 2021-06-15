package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import work1.Work1DAO;

public class BWorkUpdate implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Work1DAO dao =new Work1DAO();
		String userId = (String)session.getAttribute("userID");
		String work1Title =request.getParameter("work1Title");
		String work1Id = request.getParameter("work1Id");
		dao.Update(work1Title, work1Id, userId);
		
	}

}

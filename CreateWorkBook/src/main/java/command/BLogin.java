package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.UserDAO;

public class BLogin implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession(true);
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		UserDAO dao = new UserDAO();
		int result = dao.login(request.getParameter("userID"), request.getParameter("userPW"));
		request.setAttribute("val", result);
		if(result==1) {			
		session.setAttribute("userID", request.getParameter("userID"));
		session.setAttribute("userName",dao.name(request.getParameter("userID")));
		}
			
	}

}

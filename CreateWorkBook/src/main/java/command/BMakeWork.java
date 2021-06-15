package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import work1.Work1DAO;

public class BMakeWork implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		String title= (String)request.getParameter("work1Title");
		String userID=(String)session.getAttribute("userID");
		if(title!="") {
			Work1DAO work =new Work1DAO();
			int result = work.makeWork1(title, userID);
			if(result==-1) {
				request.setAttribute("val", 1);
			}else {
				request.setAttribute("work1", work.get(userID));
				request.setAttribute("val", 2);
			}
		}else {
			request.setAttribute("val", 3);
		}
	}

}

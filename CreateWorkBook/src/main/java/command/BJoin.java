package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDAO;

public class BJoin implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		String id = (String) request.getParameter("userID");

		String pw = (String) request.getParameter("userPW");

		String name = (String) request.getParameter("name");

		if (id == "" || pw == "" || name == "") {
			request.setAttribute("val", 1);
		} else {
			UserDAO dao = new UserDAO();

			int result = dao.join(id, pw, name);
			if (result == 1) {
				request.setAttribute("val", 2);
			} else if (result == -1) {
				request.setAttribute("val", 3);
			}
		}

	}

}

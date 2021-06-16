package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import work2.Work2DAO;

public class BPublWorkChoice implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String userID = (String)session.getAttribute("userID");
		Work2DAO d = new Work2DAO();
		d.wrongdel(userID);
	}

}

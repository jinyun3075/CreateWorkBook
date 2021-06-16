package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import work1.Work1DAO;
import work2.Work2DAO;
import work2.Work2DTO;

public class BPublWork1View implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String work1Id = (String) request.getParameter("work1Id");
		String makeUser = (String) request.getParameter("makeUser");
		Work2DAO dao = new Work2DAO();
		ArrayList<Work2DTO> list = new ArrayList<>();
		list = dao.getList(work1Id, makeUser);
		request.setAttribute("list", list);

	}

}

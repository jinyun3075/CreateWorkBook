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

public class BWork2View implements BCommand{
@Override
public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String userID = (String) session.getAttribute("userID");
		String work1Id = (String) request.getParameter("work1Id");
		Work2DAO dao = new Work2DAO();
		Work1DAO work1dao = new Work1DAO();
		ArrayList<Work2DTO> list = new ArrayList<>();
		list = dao.getList(work1Id, userID);
		String comp = work1dao.shere(work1Id, userID);
		request.setAttribute("list", list);
		request.setAttribute("comp", comp);
		
	}
}

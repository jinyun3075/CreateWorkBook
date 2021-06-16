package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import work1.Work1DAO;
import work1.Work1DTO;
import work2.Work2DAO;
import work2.Work2DTO;

public class BpublGet implements BCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
	
		String userID = (String) session.getAttribute("userID");

		Work1DTO work1 = new Work1DTO();
		work1.setWork1Id(request.getParameter("work1Id"));
		work1.setWork1Title(request.getParameter("work1Title"));
		work1.setUserId(request.getParameter("makeUser"));
		
		Work2DAO work2dao = new Work2DAO();
		ArrayList<Work2DTO> list = new ArrayList<>();
		list = work2dao.getWork2(work1.getUserId(), work1.getWork1Id());

		Work1DAO work1dao = new Work1DAO();
		int newWork1Id = work1dao.makeAndget(work1.getWork1Title(), userID);

		for (int i = 0; i < list.size(); i++) {
			list.get(i).setUserId(userID);
			list.get(i).setWork1Id("" + newWork1Id);
			work2dao.createQs(list.get(i));
		}
		request.setAttribute("va", 1);
	
	}
}

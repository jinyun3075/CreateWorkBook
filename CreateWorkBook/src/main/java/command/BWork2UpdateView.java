package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import work2.Work2DAO;
import work2.Work2DTO;

public class BWork2UpdateView implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String work1Id = (String) request.getParameter("work1Id");
		String work2Id = (String) request.getParameter("work2Id");
		String userId= (String)session.getAttribute("userID");
		Work2DTO dto = new Work2DTO();
		Work2DAO dao = new Work2DAO();
		dto = dao.updateList(userId, work1Id, work2Id);
		
		request.setAttribute("dto", dto);

	}

}

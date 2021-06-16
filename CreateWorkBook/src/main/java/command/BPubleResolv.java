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

public class BPubleResolv implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		String makeUser = request.getParameter("makeUser");
		String userID = (String) session.getAttribute("userID");
		String value=(String) request.getParameter("work1Id");
		
		int num = 0;
		if(request.getParameter("num")!=null) {
			num=Integer.parseInt(request.getParameter("num"));
		}
		int cs = 0;
		if(request.getParameter("cs")!=null) {
			cs=Integer.parseInt(request.getParameter("cs"));
		}
		ArrayList<Work2DTO> list = new ArrayList<>();
		Work2DAO dao = new Work2DAO();
		list = dao.getWork2(makeUser, value);
		request.setAttribute("list",list);
		if(list.size()<=num&&cs==1) {
			Work1DAO wo = new Work1DAO();
			wo.cliUp(value, makeUser);
			ArrayList<Work2DTO> wrong = new ArrayList<>();
			wrong = dao.publgetwrong2(userID, value,makeUser);
			request.setAttribute("wrong",wrong);
		}
	}

}

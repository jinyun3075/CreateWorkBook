package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import work1.Work1DAO;
import work1.Work1DTO;

public class BPublWorkView implements BCommand{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		String serch = "%";
		if (request.getParameter("serch") != null) {
			serch = (String) request.getParameter("serch") + "%";
		}
		Work1DAO DAO = new Work1DAO();
		int pag=(pageNumber/5)*5;
		boolean b = DAO.publnextPage(pag+1,serch);
		boolean a= DAO.publnextPage(pageNumber + 1, serch);
		ArrayList<Work1DTO> list = DAO.publicgetlist(serch, pageNumber);
		for(int i=0;i<list.size();i++) {
			list.get(i).setWorkDate( list.get(i).getWorkDate().substring(0, 11) + list.get(i).getWorkDate().substring(11, 13) + "½Ã"+ list.get(i).getWorkDate().substring(14, 16) + "ºÐ");
		}
		request.setAttribute("DAO", DAO);
		request.setAttribute("serch", serch);
		request.setAttribute("list", list);
		request.setAttribute("pag", pag);
		request.setAttribute("pageNumber", pageNumber);
		request.setAttribute("b", b);
		request.setAttribute("a", a);
		
	}
}

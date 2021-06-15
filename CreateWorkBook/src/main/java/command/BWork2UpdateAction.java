package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import work2.Work2DAO;
import work2.Work2DTO;

public class BWork2UpdateAction implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		Work2DTO dto = new Work2DTO();
		dto.setUserId(request.getParameter("userId"));
		dto.setWork1Id(request.getParameter("work1Id"));
		dto.setWork2_Qw(request.getParameter("work2_Qw"));
		dto.setWork2_value(request.getParameter("work2_value"));
		dto.setWork2_view1(request.getParameter("work2_view1"));
		dto.setWork2_view2(request.getParameter("work2_view2"));
		dto.setWork2_view3(request.getParameter("work2_view3"));
		dto.setWork2_view4(request.getParameter("work2_view4"));
		dto.setWork2Id(request.getParameter("work2Id"));
		
		Work2DAO dao = new Work2DAO();
		dao.update(dto);
	}

}

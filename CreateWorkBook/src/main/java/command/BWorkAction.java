package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import work2.Work2DAO;
import work2.Work2DTO;

public class BWorkAction implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Work2DTO work2 = new Work2DTO();
		work2.setUserId(request.getParameter("userId"));
		work2.setWork1Id(request.getParameter("work1Id"));
		work2.setWork2_Qw(request.getParameter("work2_Qw"));
		work2.setWork2_value(request.getParameter("work2_value"));
		work2.setWork2_view1(request.getParameter("work2_view1"));
		work2.setWork2_view2(request.getParameter("work2_view2"));
		work2.setWork2_view3(request.getParameter("work2_view3"));
		work2.setWork2_view4(request.getParameter("work2_view4"));
		if (work2.getWork2_Qw() != "" && work2.getWork2_view1() != "" && work2.getWork2_view2() != ""
				&& work2.getWork2_view3() != "" && work2.getWork2_view4() != "" && work2.getWork2_value() != "") {
			Work2DAO work = new Work2DAO();
			work.createQs(work2);
			request.setAttribute("val",2);
		}else {
			request.setAttribute("val",1);
		}

	}

}

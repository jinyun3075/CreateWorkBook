package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.BCommand;
import command.BPublWork1View;
import command.BPublWorkChoice;
import command.BPublWorkView;
import command.BPubleResolv;
import command.BpublGet;

/**
 * Servlet implementation class publAction
 */
@WebServlet("*.publ")
public class publAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public publAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionDo(request,response);
	}
	
	protected void ActionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		String conf = request.getContextPath();
		String com = uri.substring(conf.length());
		String viewPage =null;
		BCommand command = null;
		if(com.equals("/workList.publ")) {
			command = new BPublWorkView();
			command.execute(request, response);	
			viewPage="public/public.jsp";
		}else if(com.equals("/work1View.publ")) {
			command = new BPublWork1View();
			command.execute(request, response);
			viewPage="public/work1View.jsp";
		}else if(com.equals("/choice.publ")) {
			command =new BPublWorkChoice();
			command.execute(request, response);
			viewPage="public/workChoice.jsp";
		}else if(com.equals("/resolvWork.publ")) {
			command = new BPubleResolv();
			command.execute(request, response);
			viewPage="public/startworkView.jsp";
		}else if(com.equals("/getWork.publ")) {
			command = new BpublGet();
			command.execute(request, response);
			viewPage="work1View.publ";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}

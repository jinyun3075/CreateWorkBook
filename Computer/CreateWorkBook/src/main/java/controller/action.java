package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.BCommand;
import command.BLogin;

/**
 * Servlet implementation class action
 */
@WebServlet("*.do")
public class action extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public action() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		
		String uri = request.getRequestURI();
		String conf = request.getContextPath();
		String com = uri.substring(conf.length());
		HttpSession session = request.getSession(true);
		String viewPage =null;
		BCommand command = null;
		if(com.equals("/login.do")) {
			command = new BLogin();
			command.execute(request, response);
			int a = (int)request.getAttribute("val");
			if (a == 1) {
				session.setAttribute("userID", request.getParameter("userID"));
				session.setAttribute("userName",request.getAttribute("userName"));
				viewPage ="index.jsp";
			} else {
				viewPage ="login.jsp";
			}
		}else if(com.equals("/join.do")){
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}

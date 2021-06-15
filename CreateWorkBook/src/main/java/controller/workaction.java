package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.BCommand;
import command.BMakeWork;
import command.BResolv;
import command.BWork2Del;
import command.BWork2UpdateAction;
import command.BWork2UpdateView;
import command.BWork2View;
import command.BWorkAction;
import command.BWorkChoice;
import command.BWorkDel;
import command.BWorkShere;
import command.BWorkUpdate;
import command.BWorkView;

/**
 * Servlet implementation class work1action
 */
@WebServlet("*.wo")
public class workaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public workaction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request,response);
	}
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		
		String uri=request.getRequestURI();
		String conf =request.getContextPath();
		String com = uri.substring(conf.length());
		String viewPage =null;
		BCommand command = null;
		if(com.equals("/resolvWork.wo")) {
			command = new BResolv();
			command.execute(request, response);
			viewPage="startworkView.jsp";
		}else if(com.equals("/workList.wo")) {
			command =new BWorkView();
			command.execute(request, response);
			viewPage="work.jsp";
		}else if(com.equals("/makeWork1.wo")){
			command = new BMakeWork();
			command.execute(request, response);
			int result =(int)request.getAttribute("val");
			if(result==3) {
				viewPage="work1.jsp";				
			}else {
				viewPage="workList.wo";
			}
		}else if(com.equals("/work1Delete.wo")) {
			command = new BWorkDel();
			command.execute(request, response);
			viewPage="workList.wo";
		}else if(com.equals("/work1Update.wo")) {
			command = new BWorkUpdate();
			command.execute(request, response);
			viewPage="work2View.wo";
		}else if(com.equals("/workShere.wo")) {
			command= new BWorkShere();
			command.execute(request, response);
			viewPage="work2View.wo";
		}else if(com.equals("/work2View.wo")) {
			command = new BWork2View();
			command.execute(request, response);
			viewPage="work1View.jsp";
		}else if(com.equals("/work2Action.wo")) {
			command = new BWorkAction();
			command.execute(request, response);
			int result=(int)request.getAttribute("val");
			if(result==1) {
				viewPage="work2.jsp";
			}else{
				viewPage="work2View.wo";				
			}
		}else if(com.equals("/work2Delete.wo")) {
			command = new BWork2Del();
			command.execute(request, response);
			
			viewPage="work2View.wo";
		}else if(com.equals("/work2Update.wo")) {
			command = new BWork2UpdateView();
			command.execute(request, response);
			viewPage="work2Update.jsp";
		}else if(com.equals("/Update.wo")) {
			command = new BWork2UpdateAction();
			command.execute(request, response);
			viewPage="work2View.wo";
		}else if(com.equals("/choice.wo")) {
			command= new BWorkChoice();
			command.execute(request, response);
			viewPage="workChoice.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}

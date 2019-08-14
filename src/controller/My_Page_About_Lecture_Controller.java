package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PaymentDAOImpl;
import model.Members;
import model.Payment;
@WebServlet(name="My_Page_About_Lecture_Controller", urlPatterns = {"/go_Attended_Lecture.do","/go_Attending_Lecture.do"})
public class My_Page_About_Lecture_Controller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	public void process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String uri = req.getRequestURI();
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex+1);
		
		RequestDispatcher rd = null;
		
		if(action.equals("go_Attending_Lecture.do")) {
			PaymentDAOImpl pdao = new PaymentDAOImpl();
			HttpSession session = req.getSession();
			List<Payment> attending_List = new ArrayList<Payment>();
			Members member =  (Members) session.getAttribute("members_info");		
			attending_List = pdao.attending_Lecture(member.getMember_no());
			req.setAttribute("attending_List", attending_List);
			rd = req.getRequestDispatcher("my_Page/details/attending_Lecture.jsp");
			rd.forward(req, resp);
		}else if(action.equals("go_Attended_Lecture.do")) {
			HttpSession session = req.getSession();
			PaymentDAOImpl pdao = new PaymentDAOImpl();
			List<Payment> selected_Period_List = new ArrayList<Payment>();
			Members member =  (Members) session.getAttribute("members_info");		
			selected_Period_List = pdao.attended_Lecture(member.getMember_no());
			req.setAttribute("selected_Period_List", selected_Period_List);
			rd = req.getRequestDispatcher("my_Page/details/attended_Lecture.jsp");
			rd.forward(req, resp);
		}
	}
}

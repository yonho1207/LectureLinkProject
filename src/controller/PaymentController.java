package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LectureDAOImpl;
import dao.PaymentDAOImpl;
import model.Lecture;
import model.Payment;
@WebServlet(name="PaymentController", urlPatterns = {"/payment_Process","/payment_Confirm","/account_Transfer_Accept","/payment_Accept","/go_payment"})
public class PaymentController extends HttpServlet {

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
		
		if(action.equals("go_payment")) {
			PaymentDAOImpl pdao = new PaymentDAOImpl();
			LectureDAOImpl ldao = new LectureDAOImpl();
			List<Lecture> lecture_List_Serve = ldao.select_All_Lecture();
			req.setAttribute("lecture_List_Serve", lecture_List_Serve);
			rd = req.getRequestDispatcher("payment/payment_Insert.jsp");
			rd.forward(req, resp);
			//resp.sendRedirect("payment/payment_Form.jsp");
		}else if(action.equals("account_Transfer_Accept")) {
			rd = req.getRequestDispatcher("index.jsp");
			rd.forward(req, resp);
		}else if(action.equals("payment_Process")) {
			String select_month = req.getParameter("select_Price");
			req.setAttribute("select_month", select_month);
			rd = req.getRequestDispatcher("payment/payment_Form.jsp");
			rd.forward(req, resp);
			
		}
	}
}

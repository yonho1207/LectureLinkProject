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

import dao.LectureDAOImpl;
import dao.PaymentDAOImpl;
import dao.QnaDAO;
import dao.QnaDAOImpl;
import model.Lecture;
import model.Members;
import model.Payment;
import model.Qna;
import page.PageDAOImpl;
import page.PageGroupResult;
import page.PageManager;
import page.PageSQL;
@WebServlet(name="Page_Move_Contoroller", urlPatterns = {"/accept_Purchase.do",
		"/credit_Card.do","/account_Transfer.do","/cell_Phone_Bill.do",
		"/gift_Card_ETC.do","/goMain","/go_Customer_Support",
		"/purchase_Succes","/purchase_Failed","/go_Lecture_List"})
public class Page_Move_Contoroller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	public void process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex+1);
		
		RequestDispatcher rd = null;
		
		if(action.equals("goMain")) { 
			HttpSession session = req.getSession();
			List<Qna> qnaList = new ArrayList<Qna>();
			QnaDAO qdao = new QnaDAOImpl();
			qnaList = qdao.selectAll();
			req.setAttribute("qnaList", qnaList);
			rd = req.getRequestDispatcher("/index.jsp");
			rd.forward(req, resp);
		}else if(action.equals("go_Customer_Support")) {
			rd = req.getRequestDispatcher("customer_Support/customer_Support.jsp");
			rd.forward(req, resp);
		}else if(action.equals("accept_Purchase.do")) {
			rd = req.getRequestDispatcher("/payment/payment_Form.jsp");
			rd.forward(req, resp);
		}else if(action.equals("credit_Card.do")) {
			int pay_option = 2;
			req.setAttribute("pay_option", pay_option);
			rd = req.getRequestDispatcher("payment/methodsOfPayment/credit_Card.jsp");
			rd.forward(req, resp);
		}else if(action.equals("account_Transfer.do")) {
			int pay_option = 1;
			req.setAttribute("pay_option", pay_option);
			rd = req.getRequestDispatcher("payment/methodsOfPayment/account_Transfer.jsp");
			rd.forward(req, resp);
		}else if(action.equals("cell_Phone_Bill.do")) {
			int pay_option = 3;
			req.setAttribute("pay_option", pay_option);
			rd = req.getRequestDispatcher("payment/methodsOfPayment/cell_Phone_Charge.jsp");
			rd.forward(req, resp);
		}else if(action.equals("gift_Card_ETC.do")) {
			int pay_option = 4;
			req.setAttribute("pay_option", pay_option);
			rd = req.getRequestDispatcher("payment/methodsOfPayment/gift_Card_etc.jsp");
			rd.forward(req, resp);
		}else if(action.equals("purchase_Succes")) {
			resp.sendRedirect("payment/methodsOfPayment/purchase_Succes.jsp");
		}else if(action.equals("purchase_Failed")) {
			resp.sendRedirect("payment/methodsOfPayment/purchase_Failed.jsp");
		}else if(action.equals("go_Lecture_List")) {
	
			rd = req.getRequestDispatcher("lecture/lecture_List_in_Progress.jsp");
			rd.forward(req, resp);
		}
	}
}
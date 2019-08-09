package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BaseDAO;
import dao.LectureDAOImpl;
import dao.MembersDAOImpl;
import dao.PaymentDAOImpl;
import dao.Time_Set_Helper;
import model.Lecture;
import model.Members;
import model.Payment;
@WebServlet(name="PaymentController", urlPatterns = {"/clear_Purchase_Basket","/account_Transfer","/gift_Card_ETC","/cell_Phone_Bill","/credit_Card","/accept_Purchase","/payment_Process","/payment_Confirm","/account_Transfer_Accept","/payment_Accept","/go_payment"})
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
			HttpSession session = req.getSession();
			PaymentDAOImpl pdao = new PaymentDAOImpl();
			LectureDAOImpl ldao = new LectureDAOImpl();
			req.setAttribute("payment_date", Time_Set_Helper.get_Today());
			req.setAttribute("one_Month_Later", Time_Set_Helper.get_OneMonth_Later());
			List<Payment> purchase_Basket = null;
			List<Lecture> lecture_List_Serve = ldao.select_All_Lecture();
			req.setAttribute("lecture_List_Serve", lecture_List_Serve);
			purchase_Basket = (List<Payment>) session.getAttribute("purchase_Basket");
			rd = req.getRequestDispatcher("payment/payment_Insert.jsp");
			rd.forward(req, resp);
			//resp.sendRedirect("payment/payment_Form.jsp");
		}else if(action.equals("payment_Process")) {
			HttpSession session = req.getSession();
			PaymentDAOImpl pdao = new PaymentDAOImpl();
			LectureDAOImpl ldao = new LectureDAOImpl();
			int selected_Lecture_No = Integer.parseInt(req.getParameter("select_Lecture_Pick"));
			Lecture lecture = ldao.select_Lecture_No(selected_Lecture_No);
			Payment payment = new Payment();
			payment.setLecture_no(Integer.parseInt(req.getParameter("select_Lecture_Pick")));
			payment.setMember_no(Integer.parseInt(req.getParameter("member_no")));
			payment.setId(req.getParameter("id"));
			payment.setPayment_date(req.getParameter("payment_date"));
			payment.setLecture_name(lecture.getLecture_name());
			payment.setPrice(Integer.parseInt(req.getParameter("select_Price")));
			payment.setPeriod(req.getParameter("period"));
			List<Payment> purchase_Basket = (List<Payment>) session.getAttribute("purchase_Basket");
			if(purchase_Basket==null) {
				purchase_Basket = new ArrayList<Payment>();
			}
			purchase_Basket.add(payment);
			session.setAttribute("purchase_Basket", purchase_Basket);
			for(Payment list : purchase_Basket){
				System.out.println(list);
			}
			rd = req.getRequestDispatcher("go_payment");
			rd.forward(req, resp);
			
		}else if(action.equals("accept_Purchase")) {
			rd = req.getRequestDispatcher("/payment/payment_Form.jsp");
			rd.forward(req, resp);
		}else if(action.equals("credit_Card")) {
			int pay_option = 2;
			req.setAttribute("pay_option", pay_option);
			rd = req.getRequestDispatcher("payment/methodsOfPayment/credit_Card.jsp");
			rd.forward(req, resp);
		}else if(action.equals("account_Transfer")) {
			int pay_option = 1;
			req.setAttribute("pay_option", pay_option);
			rd = req.getRequestDispatcher("payment/methodsOfPayment/account_Transfer.jsp");
			rd.forward(req, resp);
		}else if(action.equals("cell_Phone_Bill")) {
			int pay_option = 3;
			req.setAttribute("pay_option", pay_option);
			rd = req.getRequestDispatcher("payment/methodsOfPayment/cell_Phone_Charge.jsp");
			rd.forward(req, resp);
		}else if(action.equals("gift_Card_ETC")) {
			int pay_option = 4;
			req.setAttribute("pay_option", pay_option);
			rd = req.getRequestDispatcher("payment/methodsOfPayment/gift_Card_etc.jsp");
			rd.forward(req, resp);
		}else if(action.equals("account_Transfer_Accept")) {
			int account_Transfer_Pay_Option = 1;
			HttpSession session = req.getSession();
			PaymentDAOImpl pdao = new PaymentDAOImpl();
			Payment payment = null;
			BaseDAO bdao = new BaseDAO();
			Connection connection = bdao.getConnection();
			try {
				connection.setAutoCommit(false);
			}catch(SQLException ex01) {
				ex01.printStackTrace();
			}
			
			List<Payment> purchase_Basket = (List<Payment>) session.getAttribute("purchase_Basket");
			for(Payment list : purchase_Basket) {
					payment = new Payment();
					payment.setLecture_no(list.getLecture_no());
					payment.setMember_no(list.getMember_no());
					payment.setId(list.getId());
					payment.setPayment_date(list.getPayment_date());
					payment.setLecture_name(list.getLecture_name());
					payment.setPrice(list.getPrice());
					payment.setPay_option(account_Transfer_Pay_Option);
					payment.setPeriod(list.getPeriod());
					if(payment.getLecture_no()==3){
						payment.setPay_option(6);
					}
					try {
						connection.rollback();
						System.out.println("error");
					}catch(SQLException ex02) {
						ex02.printStackTrace();
					}
					pdao.insert_Payment(payment);	
				}
		
			
			try {
				connection.commit();
				connection.setAutoCommit(true);
			}catch(SQLException ex03) {
				ex03.printStackTrace();
			}
				
				resp.sendRedirect("index.jsp");
				
				
		}else if(action.equals("clear_Purchase_Basket")) {
			HttpSession session = req.getSession();
			List<Payment> purchase_Basket = (List<Payment>) session.getAttribute("purchase_Basket");
			purchase_Basket.clear();
			session.setAttribute("purchase_Basket", purchase_Basket);
			rd = req.getRequestDispatcher("go_payment");
			rd.forward(req, resp);
		}
	}
}

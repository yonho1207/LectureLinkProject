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
import dao.QnaDAO;
import dao.QnaDAOImpl;
import dao.Time_Set_Helper;
import model.Lecture;
import model.Members;
import model.Payment;
import model.Qna;
@WebServlet(name="PaymentController", urlPatterns = {"/check_Period","/clear_Purchase_Basket.do","/payment_Process.do","/payment_Confirm.do","/account_Transfer_Accept.do","/payment_Accept.do","/go_payment.do"})
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
		req.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex+1);
		
		RequestDispatcher rd = null;
		
		if(action.equals("go_payment.do")) {
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
		}else if(action.equals("payment_Process.do")) {
			HttpSession session = req.getSession();
			PaymentDAOImpl pdao = new PaymentDAOImpl();
			LectureDAOImpl ldao = new LectureDAOImpl();
			Members member = (Members) session.getAttribute("members_info");
			int selected_Lecture_No = Integer.parseInt(req.getParameter("select_Lecture_Pick"));
			Lecture lecture = ldao.select_Lecture_No(selected_Lecture_No);
			Payment payment = new Payment();
			payment.setLecture_no(Integer.parseInt(req.getParameter("select_Lecture_Pick")));
			payment.setMember_no(member.getMember_no());
			payment.setId(member.getId());
			payment.setPayment_date(req.getParameter("payment_date"));
			payment.setLecture_name(lecture.getLecture_name());
			int select_Price = Integer.parseInt(req.getParameter("select_Price"));
			int perchase_Book =0;
			if(req.getParameter("buy_Book") != null) {
				perchase_Book = Integer.parseInt(req.getParameter("buy_Book"));
			}				
				Lecture book_Info = null;
				if(perchase_Book==1) {
					book_Info = ldao.select_Lecture_No(Integer.parseInt(req.getParameter("select_Lecture_Pick")));
					payment.setPrice(lecture.getPrice()+book_Info.getText_price());
					payment.setPeriod(Time_Set_Helper.get_period_date(select_Price));
				}else{
					payment.setPrice(lecture.getPrice());
					payment.setPeriod(Time_Set_Helper.get_period_date(select_Price));
				}
			
			List<Payment> purchase_Basket = (List<Payment>) session.getAttribute("purchase_Basket");
			if(purchase_Basket==null) {
				purchase_Basket = new ArrayList<Payment>();
			}
			purchase_Basket.add(payment); 
			session.setAttribute("purchase_Basket", purchase_Basket);
			rd = req.getRequestDispatcher("go_payment.do");
			rd.forward(req, resp);
			
		}else if(action.equals("account_Transfer_Accept.do")) {

			int account_Transfer_Pay_Option = 1;
			HttpSession session = req.getSession();
			PaymentDAOImpl pdao = new PaymentDAOImpl();
			BaseDAO bdao = new BaseDAO();
			
			List<Payment> purchase_Basket = (List<Payment>) session.getAttribute("purchase_Basket");
			for(Payment list : purchase_Basket) {				
				list.setPay_option(account_Transfer_Pay_Option);
			}
			boolean result = pdao.insert_Payment(purchase_Basket);
			if(result==false) {
				resp.sendRedirect("payment/methodsOfPayment/puchase_Failed.jsp");
			}else if(result==true){
				resp.sendRedirect("payment/methodsOfPayment/purchase_Succes.jsp");
			}											
		}else if(action.equals("clear_Purchase_Basket.do")) {
			HttpSession session = req.getSession();
			List<Payment> purchase_Basket = (List<Payment>) session.getAttribute("purchase_Basket");
			purchase_Basket.clear();
			session.setAttribute("purchase_Basket", purchase_Basket);
			rd = req.getRequestDispatcher("go_payment.do");
			rd.forward(req, resp);
		}else if(action.equals("check_Period")) {
			
		}
			
	}
}

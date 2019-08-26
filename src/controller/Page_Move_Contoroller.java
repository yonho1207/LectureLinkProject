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

import dao.AdminDAO;
import dao.AdminDAOImpl;
import dao.LectureDAOImpl;
import dao.PaymentDAOImpl;
import dao.QnaDAO;
import dao.QnaDAOImpl;
import model.AgeGroup;
import model.Lecture;
import model.Members;
import model.Payment;
import model.Qna;
import page.PageDAOImpl;
import page.PageGroupResult;
import page.PageManager;
import page.PageManager_For_Lecture;
import page.PageSQL;
@WebServlet(name="Page_Move_Contoroller", urlPatterns = {"/accept_Purchase.do",
		"/credit_Card.do","/account_Transfer.do","/cell_Phone_Bill.do",
		"/gift_Card_ETC.do","/goMain","/go_Customer_Support",
		"/purchase_Succes","/purchase_Failed","/go_Lecture_List", "/go_Cutomer_Information.admin",
		"/go_Lecture_attend.do"})
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
			String before_address = req.getRequestURI();
			System.out.println(before_address);
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
			rd = req.getRequestDispatcher("payment/methodsOfPayment/purchase_Succes.jsp");
			rd.forward(req, resp);
		}else if(action.equals("purchase_Failed")) {
			rd = req.getRequestDispatcher("payment/methodsOfPayment/purchase_Failed.jsp");
			rd.forward(req, resp);
		}else if(action.equals("go_Lecture_List")) {		
			HttpSession session = req.getSession();
			String before_address = req.getHeader("referer");
			int reqPage = Integer.parseInt(req.getParameter("reqPage"));
			String search_Word = (String) req.getAttribute("search_Word");
			if(search_Word!=null) {
				rd = req.getRequestDispatcher("lecture/lecture_List_in_Progress.jsp");
				rd.forward(req, resp);
			}else if(search_Word==null){
				PageManager_For_Lecture pm = new PageManager_For_Lecture(reqPage);
				PageGroupResult pageGroupResult = pm.getpageGroupResult(page.PageSQL.LECTURE_SELECTE_ALL_COUNT);
				req.setAttribute("pageGroupResult", pageGroupResult);
					if(before_address.contains("search_Word")) {
						String URL = before_address;
						int a = URL.lastIndexOf("/search_Lecture");
						URL.indexOf(a);
						URL.concat("reqPage="+reqPage);
						System.out.println(URL);
						rd = req.getRequestDispatcher(URL);
						rd.forward(req, resp);
					}else {
						rd = req.getRequestDispatcher("lecture/lecture_List_in_Progress.jsp");
						rd.forward(req, resp);
					}

			}
		}else if(action.equals("go_Cutomer_Information.admin")) {
			AdminDAO adao = new AdminDAOImpl();
			List<Double> genderRating = adao.get_GenderRating();
			double female_Rating = genderRating.get(0);
			double male_Rating = genderRating.get(1);
			req.setAttribute("female_Rating", female_Rating);
			req.setAttribute("male_Rating", male_Rating);
			List<AgeGroup> ageGroup = adao.get_AgeGroup();
			req.setAttribute("ageGroup", ageGroup);
			rd = req.getRequestDispatcher("administrator/customer_Information/customer_Information.jsp");
			rd.forward(req, resp);			
		}else if(action.equals("go_Lecture_attend.do")) {
			HttpSession session = req.getSession();
			LectureDAOImpl ldao = new LectureDAOImpl();
			PaymentDAOImpl pdao = new PaymentDAOImpl();
			Lecture selected_Lecture = ldao.select_Lecture_No(Integer.parseInt(req.getParameter("lecture_no")));
			req.setAttribute("selected_Lecture", selected_Lecture);
			Members member = (Members) session.getAttribute("members_info");
			List<Payment> attending_Lecture = pdao.attending_Lecture(member.getMember_no());
			for(Payment attending : attending_Lecture) {
				if(attending.getLecture_no()==selected_Lecture.getLecture_no()) {
					rd = req.getRequestDispatcher("lecture/lecture_Detail/lecture_PlayPage.jsp");			
					rd.forward(req, resp);
				}else if(attending.getLecture_no()!=selected_Lecture.getLecture_no()){
					rd = req.getRequestDispatcher("lecture/lecture_Detail/not_Purchase.jsp");			
					rd.forward(req, resp);
				}		
			}
			

		}
	}
}

package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
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
import dao.Time_Set_Helper;
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
import sun.util.resources.LocaleData;
@WebServlet(name="Page_Move_Contoroller", urlPatterns = {"/accept_Purchase.do",
		"/credit_Card.do","/account_Transfer.do","/cell_Phone_Bill.do",
		"/gift_Card_ETC.do","/goMain","/go_Customer_Support",
		"/purchase_Succes","/purchase_Failed","/go_Lecture_List", "/go_Cutomer_Information.admin",
		"/go_Lecture_attend.do","/go_Attend_Lecture.admin","/jump_To_Clicked_Lecture"
		,"/go_about_Pay.admin"})
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
				rd = req.getRequestDispatcher("lecture/lecture_List_in_Progress.jsp");
				rd.forward(req, resp);


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
			boolean have_Right = false;
			for(Payment attending : attending_Lecture) {
				String period = attending.getPeriod();
				String replaced_Period = period.replaceAll("[^0-9]", "");
				Long period_To_Long = Long.parseLong(replaced_Period);
				String get_Today = Time_Set_Helper.get_Today();
				String replaced_Today = get_Today.replaceAll("[^0-9]", "");
				Long today_to_Long = Long.parseLong(replaced_Today);
				if(attending.getLecture_no()==selected_Lecture.getLecture_no() && period_To_Long > today_to_Long) {					
					have_Right = true;
				}else if(attending.getLecture_no()!=selected_Lecture.getLecture_no() ||  period_To_Long < today_to_Long){
					have_Right = false;
				}		
			}
			if(have_Right==true) {
				rd = req.getRequestDispatcher("lecture/lecture_Detail/lecture_PlayPage.jsp");			
				rd.forward(req, resp);
			}else {
				rd = req.getRequestDispatcher("lecture/lecture_Detail/not_Purchase.jsp");			
				rd.forward(req, resp);
			}
			
		}else if(action.equals("go_Attend_Lecture.admin")) {
			LectureDAOImpl ldao = new LectureDAOImpl();
			List<Lecture> lecture_List_Serve = ldao.select_All_Lecture();
			req.setAttribute("lecture_List_Serve", lecture_List_Serve);
			rd = req.getRequestDispatcher("administrator/customer_Information/count_Attending_Member.jsp");			
			rd.forward(req, resp);
		}else if(action.equals("get_CustomerInfo.admin")) {
			rd = req.getRequestDispatcher("go_Cutomer_Information.admin");
			rd.forward(req, resp);
		}else if(action.equals("jump_To_Clicked_Lecture")) {
			HttpSession session = req.getSession();
			LectureDAOImpl ldao = new LectureDAOImpl();
			PaymentDAOImpl pdao = new PaymentDAOImpl();
			Lecture selected_Lecture = ldao.select_Lecture_No(Integer.parseInt(req.getParameter("search-select")));
			req.setAttribute("selected_Lecture", selected_Lecture);
			Members member = (Members) session.getAttribute("members_info");
			String period = pdao.select_Attending_Lecture
					(member.getMember_no(), Integer.parseInt(req.getParameter("search-select")));
/*			String period = period_a.substring(0, 10)+" "+"01"+period_a.substring(13, period_a.length()) ;*/
			//insert 당시 오류로 인한 00:00:00 케이스 처리를 위한 구문
			boolean have_Right = ldao.distinction_Access_Authority
					(member.getMember_no(), period, Integer.parseInt(req.getParameter("search-select")));
			if(have_Right==true) {
				rd = req.getRequestDispatcher("lecture/lecture_Detail/lecture_PlayPage.jsp");			
				rd.forward(req, resp);
			}else {
				rd = req.getRequestDispatcher("lecture/lecture_Detail/not_Purchase.jsp");			
				rd.forward(req, resp);
			}
			
		}else if(action.equals("go_about_Pay.admin")) {
			LectureDAOImpl ldao = new LectureDAOImpl();
			PaymentDAOImpl pdao = new PaymentDAOImpl();
			AdminDAO adao = new AdminDAOImpl();
			
			List<Integer> get_PayOption = adao.get_Payoption_CNT();
			List<Integer> get_PayOption_AVG = adao.get_Payoption_AVG();
			double paymented_Month_AVG = adao.get_AVG_period();
			List<String> payOption_Name = new ArrayList<String>();
			payOption_Name.add("口座振替");
			payOption_Name.add("クレジットカード");
			payOption_Name.add("携帯");
			payOption_Name.add("ギフトカード");
			req.setAttribute("payOption_Name", payOption_Name);
			req.setAttribute("get_PayOption", get_PayOption);
			req.setAttribute("get_PayOption_AVG", get_PayOption_AVG);
			req.setAttribute("paymented_Month_AVG", paymented_Month_AVG);
			
			rd = req.getRequestDispatcher("administrator/customer_Information/about_Payment.jsp");			
			rd.forward(req, resp);
			
		}
	}
}

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

import dao.NoticeDAO;
import dao.NoticeDAOImpl;
import model.Notice;


@WebServlet(name = "NoticeController", urlPatterns
= {"/go_notice","/notice_detail","/notice_inputform","/notice_insert"})

public class NoticeController  extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("utf-8");
		Process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("utf-8");
		Process(req, resp);
	}
	
	private void Process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");

		String uri = req.getRequestURI();

		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex + 1);
		
		if (action.equals("go_notice")) {
			
			req.setCharacterEncoding("utf-8");

			List<Notice> noticeList = new ArrayList<Notice>();
			NoticeDAO dao = new NoticeDAOImpl();

			noticeList = dao.selectAll();
			
			HttpSession session = req.getSession(); 
			session.setAttribute("noticeList", noticeList);
			
			RequestDispatcher rd = req.getRequestDispatcher("/notice/noticeList.jsp");
			rd.forward(req, resp);
			
		}else if (action.equals("notice_detail")) {
			
			int notice_no = Integer.parseInt(req.getParameter("notice_no"));

			NoticeDAO dao = new NoticeDAOImpl();
			Notice notice = dao.seleteByNo(notice_no);
			
			req.setAttribute("notice", notice);
			System.out.println(notice);

			RequestDispatcher rd = req.getRequestDispatcher("notice/noticeDetail.jsp");
			rd.forward(req, resp);
			
		}else if (action.equals("notice_inputform")) {
			
			RequestDispatcher rd = req.getRequestDispatcher("notice/noticeInput.jsp");
			rd.forward(req, resp);
			
		}else if (action.equals("notice_insert")) {
			
			Notice notice = new Notice();
			NoticeDAO dao = new NoticeDAOImpl();
			
			notice.setNotice_no(Integer.parseInt(req.getParameter("notice_no")));
			notice.setNotice_title(req.getParameter("notice_title"));
			notice.setNotice_con(req.getParameter("notice_con"));
			notice.setNotice_date(req.getParameter("notice_date"));

			dao.noticeInsert(notice);
			System.out.println(notice);

			RequestDispatcher rd = req.getRequestDispatcher("go_notice");
			rd.forward(req, resp);
		}

		
	}
	
	
	
}

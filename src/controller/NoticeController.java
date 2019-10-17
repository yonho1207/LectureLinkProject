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
import dao.QnaDAO;
import dao.QnaDAOImpl;
import model.Notice;
import model.Qna;
import page.PageManager;
import page.PageSQL;

@WebServlet(name = "NoticeController", urlPatterns = { "/go_notice", "/notice_detail", "/notice_inputform",
		"/notice_insert", "/notice_update", "/notice_delete", "/notice_req_list" })

public class NoticeController extends HttpServlet {

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

		if (action.equals("go_notice")) { // 공지사항 리스트

			req.setCharacterEncoding("utf-8");

			List<Notice> noticeList = new ArrayList<Notice>();
			NoticeDAO dao = new NoticeDAOImpl();

			noticeList = dao.selectAll();

			HttpSession session = req.getSession();
			session.setAttribute("noticeList", noticeList);

			RequestDispatcher rd = req.getRequestDispatcher("notice_req_list?reqPage=1");
			rd.forward(req, resp);

		} else if (action.equals("notice_detail")) { // 공지사항 상세보기

			int notice_no = Integer.parseInt(req.getParameter("notice_no"));

			NoticeDAO dao = new NoticeDAOImpl();
			Notice notice = dao.seleteByNo(notice_no);

			req.setAttribute("notice", notice);

			RequestDispatcher rd = req.getRequestDispatcher("notice/noticeDetail.jsp");
			rd.forward(req, resp);

		} else if (action.equals("notice_inputform")) { // 공지사항 입력 창 이동

			RequestDispatcher rd = req.getRequestDispatcher("notice/noticeInput.jsp");
			rd.forward(req, resp);

		} else if (action.equals("notice_insert")) { // 공지사항 추가

			Notice notice = new Notice();
			NoticeDAO dao = new NoticeDAOImpl();

			notice.setNotice_title(req.getParameter("notice_title"));
			notice.setNotice_con(req.getParameter("notice_con"));

			dao.noticeInsert(notice);

			RequestDispatcher rd = req.getRequestDispatcher("go_notice");
			rd.forward(req, resp);

		} else if (action.equals("notice_update")) { // 공지사항 수정

			Notice notice = new Notice();
			NoticeDAO dao = new NoticeDAOImpl();
			
			notice.setNotice_no(Integer.parseInt(req.getParameter("notice_no")));
			notice.setNotice_title(req.getParameter("notice_title"));
			notice.setNotice_con(req.getParameter("notice_con"));
			
			dao.update(notice);
			System.out.println(notice);

			RequestDispatcher rd = req.getRequestDispatcher("notice_req_list?reqPage=1");
			rd.forward(req, resp);

		} else if (action.equals("notice_delete")) { // 공지사항 삭제

			Notice notice = new Notice();
			NoticeDAO dao = new NoticeDAOImpl();

			notice.setNotice_no(Integer.parseInt(req.getParameter("notice_no")));

			dao.delete(notice.getNotice_no());

			RequestDispatcher rd = req.getRequestDispatcher("notice_req_list?reqPage=1");
			rd.forward(req, resp);

		} else if (action.equals("notice_req_list")) {

			int requestPage = Integer.parseInt(req.getParameter("reqPage"));

			PageManager pm = new PageManager(requestPage);

			NoticeDAO dao = new NoticeDAOImpl();

			List<Notice> noticeList = dao.selectAllPage(pm.getPageRowResult().getRowStartNumber(),
			pm.getPageRowResult().getRowEndNumber());

			HttpSession session = req.getSession();
			session.setAttribute("noticeList", noticeList);
			req.setAttribute("pageGroupResult", pm.getpageGroupResult(PageSQL.NOTICE_SELETE_ALL_COUNT));

			RequestDispatcher rd = req.getRequestDispatcher("notice/noticeList.jsp");
			rd.forward(req, resp);

		}

	}

}

package controller;

import java.io.IOException;
import java.net.URL;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CmtDAO;
import dao.CmtDAOImpl;
import dao.LectureDAO;
import dao.LectureDAOImpl;
import model.Cmt;
import model.Lecture;
import page.PageManager;
import page.PageSQL;

@WebServlet(name = "CmtController", urlPatterns = { "/cmt_list", "/cmt_insert", "/cmt_delete", "/go_cmt_Fom" })

public class CmtController extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		process(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		process(req, resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");

		String uri = req.getRequestURI();
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex + 1);

		if (action.equals("go_cmt_Fom")) {

			int lecture_no = Integer.parseInt(req.getParameter("lecture_no"));
			int requestPage = 1;

			HttpSession session = req.getSession();
			CmtDAO dao = new CmtDAOImpl();
			LectureDAO daol = new LectureDAOImpl();

			Lecture lecture = daol.select_Lecture_No(lecture_no);
			List<Cmt> cmtlists = dao.selectByLecture_no(lecture_no);

			session.setAttribute("lecture", lecture);
			session.setAttribute("cmtlists", cmtlists);
			session.setAttribute("reqPage", requestPage);
			session.setAttribute("lecture_no", lecture_no);

			RequestDispatcher rd = req.getRequestDispatcher("/cmt/cmtForm.jsp");
			rd.forward(req, resp);

		} else if (action.equals("cmt_insert")) {

			Cmt cmt = new Cmt();
			CmtDAO dao = new CmtDAOImpl();

			cmt.setMember_no(Integer.parseInt(req.getParameter("member_no")));
			cmt.setLecture_no(Integer.parseInt(req.getParameter("lecture_no")));
			cmt.setId(req.getParameter("id"));
			cmt.setCmt_con(req.getParameter("cmt_con"));
			cmt.setRating(Integer.parseInt(req.getParameter("star-input")));

			Cmt resultComment = dao.insert(cmt);

			if (resultComment != null) {

				req.setAttribute("result", true);

			} else {

				req.setAttribute("result", false);

			}

			req.setAttribute("cmt", resultComment);

			RequestDispatcher rd = req.getRequestDispatcher("/cmt/cmtForm.jsp");

			rd.forward(req, resp);

		} else if (action.equals("cmt_delete")) {

			CmtDAO dao = new CmtDAOImpl();

			int cmt_no = Integer.parseInt(req.getParameter("cmt_no"));

			dao.deleteByCmt_no(cmt_no);

			RequestDispatcher rd = req.getRequestDispatcher("cmt_list");
			rd.forward(req, resp);

		} else if (action.equals("cmt_list")) {

			HttpSession session = req.getSession();

			String before_address = req.getHeader("referer");
			System.out.println("비포어"+before_address);//last
			int get_Intersection_Info = before_address.indexOf("=");
			System.out.println("겟"+get_Intersection_Info);
			int lecture_no = Integer
					.parseInt(before_address.substring(get_Intersection_Info+1, get_Intersection_Info));
			System.out.println("렉쳐넘버"+lecture_no);

			int get_lastIndex = before_address.lastIndexOf("=");
			String get_reqPage = before_address.substring(get_lastIndex + 1);

			CmtDAO dao = new CmtDAOImpl();
			LectureDAO daol = new LectureDAOImpl();

			PageManager pm = new PageManager(Integer.parseInt(get_reqPage));

			Lecture lecture = daol.select_Lecture_No(lecture_no);

			List<Cmt> cmtList = dao.selectByLecture_noPage(pm.getPageRowResult().getRowStartNumber(),
					pm.getPageRowResult().getRowEndNumber(), lecture_no);

			List<Cmt> cmtlists = dao.selectByLecture_no(lecture_no);

			session.setAttribute("cmtList", cmtList);
			session.setAttribute("lecture", lecture);
			session.setAttribute("cmtlists", cmtlists);

			session.setAttribute("pageGroupResult", pm.getpageGroupResult(PageSQL.CMT_SELECTE_ALL_COUNT));

			RequestDispatcher rd = req.getRequestDispatcher("/cmt/cmtList.jsp");
			rd.forward(req, resp);

		}
	}
}

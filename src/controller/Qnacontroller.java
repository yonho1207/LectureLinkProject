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

import dao.QnaDAO;
import dao.QnaDAOImpl;
import model.Qna;
import page.PageManager;
import page.PageSQL;

@WebServlet(name = "Qnacontroller", urlPatterns = { "/go_qna", "/qna_detail", "/qna_inputform", "/qna_insert",
		"/qna_req_list" })

public class Qnacontroller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet");
		req.setCharacterEncoding("utf-8");
		Process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost");
		req.setCharacterEncoding("utf-8");
		Process(req, resp);
	}

	private void Process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");

		String uri = req.getRequestURI();

		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex + 1);

		if (action.equals("go_qna")) {// QNA 리스트로가기

			req.setCharacterEncoding("utf-8");

			List<Qna> qnaList = new ArrayList<Qna>();
			QnaDAO dao = new QnaDAOImpl();

			qnaList = dao.selectAll();
			
			HttpSession session = req.getSession(); 
			session.setAttribute("qnaList", qnaList);
			
			//resp.sendRedirect("qna_req_list?reqPage=1");
			RequestDispatcher rd = req.getRequestDispatcher("qna_req_list?reqPage=1");
			rd.forward(req, resp);

		} else if (action.equals("qna_detail")) { // QNA 상세페이지

			int qna_no = Integer.parseInt(req.getParameter("qna_no"));

			QnaDAO dao = new QnaDAOImpl();
			Qna qna = dao.seleteByNo(qna_no);

			dao.updateVisited(qna_no);

			HttpSession session = req.getSession(); // 브라우저 닫을때가지 생존
			session.setAttribute("qna", qna);

			RequestDispatcher rd = req.getRequestDispatcher("qnaDetail.jsp");
			rd.forward(req, resp);

		} else if (action.equals("qna_inputform")) { // QNA 글쓰기창 이동

			RequestDispatcher rd = req.getRequestDispatcher("qnaInput.jsp");
			rd.forward(req, resp);

		} else if (action.equals("qna_insert")) {// QNA 새글 등록

			Qna qna = new Qna();
			QnaDAO dao = new QnaDAOImpl();

			qna.setQna_title(req.getParameter("qna_title"));
			qna.setId(req.getParameter("id"));
			qna.setQna_con(req.getParameter("qna_con"));
			qna.setGrp(Integer.parseInt(req.getParameter("grp")));

			dao.QnaInsert(qna);

			RequestDispatcher rd = req.getRequestDispatcher("go_qna");
			rd.forward(req, resp);

		} else if (action.equals("qna_req_list")) { // QNA 페이징 리스트

			int requestPage = Integer.parseInt(req.getParameter("reqPage"));

			PageManager pm = new PageManager(requestPage);

			QnaDAO dao = new QnaDAOImpl();

			List<Qna> qnaList = dao.selectAllPage(pm.getPageRowResult().getRowStartNumber(),
			pm.getPageRowResult().getRowEndNumber());

			req.setAttribute("qnaList", qnaList);
			req.setAttribute("pageGroupResult", pm.getpageGroupResult(PageSQL.QNA_SELETE_ALL_COUNT));

			RequestDispatcher rd = req.getRequestDispatcher("qnaList.jsp");
			rd.forward(req, resp);
		}
	}
}

package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CmtDAO;
import dao.CmtDAOImpl;
import model.Cmt;

@WebServlet(name = "CmtController", urlPatterns = { "/go_cmt", "/cmt_list", "/cmt_insert", "/cmt_delete" })

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

		if (action.equals("go_cmt")) {

			RequestDispatcher rd = req.getRequestDispatcher("/cmt/cmtForm.jsp");
			rd.forward(req, resp);

		} else if (action.equals("cmt_list")) {

			CmtDAO dao = new CmtDAOImpl();
			List<Cmt> cmtList = dao.selectAll();

			req.setAttribute("cmtList", cmtList);

			RequestDispatcher rd = req.getRequestDispatcher("/cmt/cmtList.jsp");
			rd.forward(req, resp);

		} else if (action.equals("cmt_insert")) {

			Cmt cmt = new Cmt();

			cmt.setMember_no(Integer.parseInt(req.getParameter("member_no")));
			cmt.setLecture_no(Integer.parseInt(req.getParameter("lecture_no")));
			cmt.setId(req.getParameter("id"));
			cmt.setCmt_con(req.getParameter("cmt_con"));
			
			cmt.setRating(Integer.parseInt(req.getParameter("star-input")));

			CmtDAO dao = new CmtDAOImpl();

			Cmt resultComment = dao.insert(cmt);

			if (resultComment != null) {
				req.setAttribute("result", true);
				req.setAttribute("message", "댓글이 추가 성공!");

			} else {
				req.setAttribute("result", false);
				req.setAttribute("message", "댓글 추가 실패~");
			}

			req.setAttribute("cmt", resultComment);

			RequestDispatcher rd = req.getRequestDispatcher("/cmt/cmtItem.jsp");
			rd.forward(req, resp);

		} else if (action.equals("cmt_delete")) {

			CmtDAO dao = new CmtDAOImpl();

			int num = Integer.parseInt(req.getParameter("cmt_no"));

			boolean result = dao.deleteByCmt_no(num);

			RequestDispatcher rd = req.getRequestDispatcher("/cmt/cmtList.jsp");
			rd.forward(req, resp);

		}

	}
}

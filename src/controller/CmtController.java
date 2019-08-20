package controller;

import java.io.IOException;
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
import dao.QnaDAO;
import dao.QnaDAOImpl;
import model.Cmt;
import model.Qna;
import page.PageManager;
import page.PageSQL;

@WebServlet(name = "CmtController", urlPatterns = { "/go_cmt", "/cmt_list", "/cmt_insert", "/cmt_delete", "/cmt_Fom1",
		"/cmt_Fom2", "/cmt_Fom3", "/cmt_req_list" })

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
			
			RequestDispatcher rd = req.getRequestDispatcher("/cmt/cmtTest.jsp");
			rd.forward(req, resp);

		}else if (action.equals("cmt_Fom1")) {
			
			
			 int requestPage = Integer.parseInt(req.getParameter("reqPage")); 
			 PageManager pm = new PageManager(requestPage);
			 
			 HttpSession session = req.getSession(); 
			 session.setAttribute("reqPage", requestPage);
			 
			 req.setAttribute("pageGroupResult",pm.getpageGroupResult(PageSQL.CMT_SELECTE_ALL_COUNT));
			 
			RequestDispatcher rd = req.getRequestDispatcher("/cmt/cmtForm1.jsp");
			rd.forward(req, resp);
			
		}else if (action.equals("cmt_Fom2")) {
			
			RequestDispatcher rd = req.getRequestDispatcher("/cmt/cmtForm2.jsp");
			rd.forward(req, resp);
			
		}else if (action.equals("cmt_Fom3")) {
			
			RequestDispatcher rd = req.getRequestDispatcher("/cmt/cmtForm3.jsp");
			rd.forward(req, resp);
			
		} else if (action.equals("cmt_req_list")) {
			
			int lecture_no=2;
			
			//int lecture_no = Integer.parseInt(req.getParameter("lecture_no"));
			
			CmtDAO dao = new CmtDAOImpl();
			List<Cmt> cmtList = dao.selectByLecture_no(lecture_no);
			
			req.setAttribute("cmtList", cmtList);
			System.out.println(cmtList);
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

			} else {
				
				req.setAttribute("result", false);
				
			}

			req.setAttribute("cmt", resultComment);

			RequestDispatcher rd = req.getRequestDispatcher("/cmt/cmtItem.jsp");
			rd.forward(req, resp);

		} else if (action.equals("cmt_delete")) {

			CmtDAO dao = new CmtDAOImpl();

			int cmt_no = Integer.parseInt(req.getParameter("cmt_no"));

			dao.deleteByCmt_no(cmt_no);

			RequestDispatcher rd = req.getRequestDispatcher("cmt_list");
			rd.forward(req, resp);

		} else if (action.equals("cmt_list")) {
			
			 HttpSession session = req.getSession(); 
			  int requestPage = (int) session.getAttribute("reqPage"); 
			  PageManager pm = new PageManager(requestPage);
			  
			  int lecture_no=2; 
			  //int lecture_no =Integer.parseInt(req.getParameter("lecture_no"));
			  
			  CmtDAO dao = new CmtDAOImpl();
			 
			  List<Cmt> cmtList =dao.selectByLecture_noPage(pm.getPageRowResult().getRowStartNumber(),
			  pm.getPageRowResult().getRowEndNumber(),lecture_no);
			  
			  session.setAttribute("cmtList",cmtList);
			 
			  //req.setAttribute("pageGroupResult",
			  //pm.getpageGroupResult(PageSQL.CMT_SELECTE_ALL_COUNT));
			  
			  System.out.println(pm.getpageGroupResult(PageSQL.CMT_SELECTE_ALL_COUNT));
			  //RequestDispatcher rd = req.getRequestDispatcher("cmt/cmtForm1.jsp");
			  RequestDispatcher rd = req.getRequestDispatcher("/cmt/cmtList.jsp");
			  rd.forward(req, resp); 
		}
	}
}

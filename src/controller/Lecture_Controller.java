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

import dao.LectureDAOImpl;
import model.Lecture;
import model.Members;
@WebServlet(name="Lecture_Controller", urlPatterns = {"/delete_Lecture.do","/go_Main_in_Lectrue","/go_Lecture_List.do","/update_Lecture.do","/go_Lecture_Update.do","/go_Lecture_Insert.do","/insert_Lecture.do"})
public class Lecture_Controller extends HttpServlet {
	
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
		
		if(action.equals("insert_Lecture.do")) {
			HttpSession session = req.getSession();
			Members member = (Members) session.getAttribute("members_info");
			LectureDAOImpl ldao = new LectureDAOImpl();
				if(member!=null) {
					Lecture lecture = new Lecture();
					lecture.setLecture_name(req.getParameter("lecture_name"));
					lecture.setLecture_teacher(req.getParameter("lecture_teacher"));
					lecture.setPrice(Integer.parseInt(req.getParameter("price")));
					lecture.setText_price(Integer.parseInt(req.getParameter("text_price")));
					ldao.insert_Lecture(lecture);
					resp.sendRedirect("index.jsp");
				}else {
					resp.sendRedirect("index.jsp");
				}
				
				
		}else if(action.equals("go_Lecture_Insert.do")) {

			rd = req.getRequestDispatcher("administrator/lecture/insert_Lecture.jsp");
			rd.forward(req, resp);
		}else if(action.equals("go_Lecture_Update.do")) {
			LectureDAOImpl ldao = new LectureDAOImpl();
			Lecture lecture = 
			ldao.select_Lecture_No(Integer.parseInt(req.getParameter("lecture_no")));
			req.setAttribute("lecture", lecture);
			rd = req.getRequestDispatcher("administrator/lecture/update_Lecture.jsp");
			rd.forward(req, resp);
		}else if(action.equals("update_Lecture.do")) {
			LectureDAOImpl ldao = new LectureDAOImpl();
			Lecture lecture = new Lecture();
			lecture.setLecture_no(Integer.parseInt(req.getParameter("lecture_no")));
			lecture.setLecture_name(req.getParameter("lecture_name"));
			lecture.setLecture_teacher(req.getParameter("lecture_teacher"));
			lecture.setPrice(Integer.parseInt(req.getParameter("price")));
			lecture.setText_price(Integer.parseInt(req.getParameter("text_price")));
			ldao.update_Lecture(lecture);
			rd = req.getRequestDispatcher("go_Lecture_List.do");
			rd.forward(req, resp);
			
		}else if(action.equals("go_Lecture_List.do")) {
			LectureDAOImpl ldao = new LectureDAOImpl();
			List<Lecture> lecture_List = ldao.select_All_Lecture();
			req.setAttribute("lecture_List", lecture_List);
			rd = req.getRequestDispatcher("administrator/lecture/lecture_List.jsp");
			rd.forward(req, resp);
		}else if(action.equals("go_Main_in_Lectrue")) {
			rd = req.getRequestDispatcher("/index.jsp");
			rd.forward(req, resp);	
		}else if(action.equals("delete_Lecture.do")) {
			LectureDAOImpl ldao = new LectureDAOImpl();
			ldao.delete_Lecture(Integer.parseInt(req.getParameter("lecture_no")));
			rd = req.getRequestDispatcher("go_Lecture_List.do");
			rd.forward(req, resp);
		}
	}
	
}
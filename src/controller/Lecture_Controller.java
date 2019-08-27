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
import dao.LectureDAOImpl;
import model.Cmt;
import model.Lecture;
import model.Members;
import page.PageGroupResult;
import page.PageManager;
import page.PageManager_For_Lecture;
@WebServlet(name="Lecture_Controller", urlPatterns = {"/get_Price",
		"/jump_To_Clicked_Lecture","/delete_Lecture.admin",
		"/go_Main_in_Lectrue","/go_Lecture_List.do","/update_Lecture.admin",
		"/go_Lecture_Update.admin","/go_Lecture_Insert.admin","/insert_Lecture.admin",
		"/lecture_Tmpl", "/search_Lecture"})
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
		req.setCharacterEncoding("utf-8");
		
		if(action.equals("insert_Lecture.admin")) {
			HttpSession session = req.getSession();
			Members member = (Members) session.getAttribute("admin");
			LectureDAOImpl ldao = new LectureDAOImpl();
				if(member!=null) {
					Lecture lecture = new Lecture();
					lecture.setLecture_name(req.getParameter("lecture_name"));
					lecture.setLecture_teacher(req.getParameter("lecture_teacher"));
					lecture.setPrice(Integer.parseInt(req.getParameter("price")));
					lecture.setBook_price(Integer.parseInt(req.getParameter("book_price")));
					lecture.setDescription(req.getParameter("description"));
					ldao.insert_Lecture(lecture);
					resp.sendRedirect("index.jsp");
				}else {
					resp.sendRedirect("index.jsp");
				}
				
				
		}else if(action.equals("go_Lecture_Insert.admin")) {

			rd = req.getRequestDispatcher("administrator/lecture/insert_Lecture.jsp");
			rd.forward(req, resp);
		}else if(action.equals("go_Lecture_Update.admin")) {
			LectureDAOImpl ldao = new LectureDAOImpl();
			Lecture lecture = 
			ldao.select_Lecture_No(Integer.parseInt(req.getParameter("lecture_no")));
			req.setAttribute("lecture", lecture);
			rd = req.getRequestDispatcher("administrator/lecture/update_Lecture.jsp");
			rd.forward(req, resp);
		}else if(action.equals("update_Lecture.admin")) {
			LectureDAOImpl ldao = new LectureDAOImpl();
			Lecture lecture = new Lecture();
			lecture.setLecture_no(Integer.parseInt(req.getParameter("lecture_no")));
			lecture.setLecture_name(req.getParameter("lecture_name"));
			lecture.setLecture_teacher(req.getParameter("lecture_teacher"));
			lecture.setPrice(Integer.parseInt(req.getParameter("price")));
			lecture.setBook_price(Integer.parseInt(req.getParameter("book_price")));
			lecture.setDescription(req.getParameter("description"));
			ldao.update_Lecture(lecture);
			rd = req.getRequestDispatcher("go_Lecture_List.admin");
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
		}else if(action.equals("delete_Lecture.admin")) {
			LectureDAOImpl ldao = new LectureDAOImpl();
			ldao.delete_Lecture(Integer.parseInt(req.getParameter("lecture_no")));
			rd = req.getRequestDispatcher("go_Lecture_List.do");
			rd.forward(req, resp);
		}else if(action.equals("jump_To_Clicked_Lecture")) {
			LectureDAOImpl ldao = new LectureDAOImpl();
			Lecture selected_Lecture = ldao.select_Lecture_No(Integer.parseInt(req.getParameter("search-select")));
			req.setAttribute("selected_Lecture", selected_Lecture);
			rd = req.getRequestDispatcher("lecture/lecture_Detail/lecture_PlayPage.jsp");
			rd.forward(req, resp);
		}else if(action.equals("get_Price")) {
			int selectedNumber = Integer.parseInt(req.getParameter("selectedNumber"));
			LectureDAOImpl ldao = new LectureDAOImpl();
			Lecture selected_lecture = ldao.select_Lecture_No(selectedNumber);
			int returned_Price = selected_lecture.getPrice();
			req.setAttribute("returned_Price", returned_Price);
			rd = req.getRequestDispatcher("go_payment.admin");
			rd.forward(req, resp);
		}else if(action.equals("lecture_Tmpl")) {
			LectureDAOImpl ldao = new LectureDAOImpl();
			HttpSession session = req.getSession();
			String before_address = req.getHeader("referer");
			int get_lastIndex = before_address.lastIndexOf("=");
			int intersection = 0;
			int search_Option = 0;
			if(before_address.contains("&search_Word")) {
				intersection = before_address.lastIndexOf("&search_Word");
				search_Option=Integer.parseInt(before_address.substring(intersection-1,intersection));
			}
			int get_reqPage = 1;
			if (before_address.contains("reqPage")) {
				get_reqPage = Integer.parseInt(before_address.substring(get_lastIndex+1));
			}
			PageManager_For_Lecture pm = new PageManager_For_Lecture(get_reqPage);
			int rowStartNumber = pm.getPageRowResult().getRowStartNumber();
			int rowEndNumber = pm.getPageRowResult().getRowEndNumber();
			if(intersection==0) {		
				List<Lecture> Selected_Lecture_List_For_Paging = 
						ldao.lecture_List_Get_RowNum(rowStartNumber, rowEndNumber);
				req.setAttribute("Selected_Lecture_List_For_Paging", Selected_Lecture_List_For_Paging);
				rd = req.getRequestDispatcher("lecture/lecture_tmpl/lecture_tmpl.jsp");
				rd.forward(req, resp);
			}else if(search_Option==1){			
					String searchName = before_address.substring(get_lastIndex+1);
					List<Lecture> lecture_List = ldao.select_Lecture_Name(searchName);
					req.setAttribute("Selected_Lecture_List_For_Paging", lecture_List);
					List<Lecture> selected_Lecture_List_For_Paging_By_LectureName = 
							ldao.Selected_Lecture_List_For_Paging_By_LectureName
							(searchName, rowStartNumber, rowEndNumber);
					req.setAttribute("selected_Lecture_List_For_Paging_By_LectureName", 
							selected_Lecture_List_For_Paging_By_LectureName);
					rd = req.getRequestDispatcher("lecture/lecture_tmpl/lecture_tmpl.jsp");
					rd.forward(req, resp);	
			}else if(search_Option==2) {
				String lecture_teacher = before_address.substring(get_lastIndex+1);
				List<Lecture> lecture_List = ldao.select_Lecture_Teacher(lecture_teacher);
				req.setAttribute("Selected_Lecture_List_For_Paging", lecture_List);
			}

			
			
		}else if(action.equals("search_Lecture")) {
			LectureDAOImpl ldao = new LectureDAOImpl();
			HttpSession session = req.getSession();
			String before_address = req.getHeader("referer");
			int get_lastIndex = before_address.lastIndexOf("=");
			String get_reqPage = before_address.substring(get_lastIndex+1);
			PageManager_For_Lecture pm = new PageManager_For_Lecture();
			int search_Option = Integer.parseInt(req.getParameter("search_Option"));
			if(search_Option==1) {
				String lecture_name = req.getParameter("search_Word");
				req.setAttribute("search_Word", lecture_name);
				PageGroupResult pageGroupResult = pm.getpageGroupResult(page.PageSQL.LECTURE_SELECT_BY_NAME, lecture_name);
				req.setAttribute("pageGroupResult", pageGroupResult);
				rd = req.getRequestDispatcher("go_Lecture_List?reqPage=1");
				rd.forward(req, resp);
			}else if(search_Option==2){
				String lecture_teacher = req.getParameter("search_Word");
				req.setAttribute("search_Word", lecture_teacher);
				rd = req.getRequestDispatcher("go_Lecture_List?reqPage=1");
				rd.forward(req, resp);
			}

		}
	}
	
}

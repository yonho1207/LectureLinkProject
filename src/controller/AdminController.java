package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDAO;
import dao.AdminDAOImpl;
import dao.MembersDAO;
import dao.MembersDAOImpl;
import model.Members;


@WebServlet(name="AdminController",urlPatterns = {"/go_admin.admin","/admin_memberList","/member_detail","/admin_update"})
public class AdminController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		process(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		process(req,resp);
	}
		private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
			String uri = req.getRequestURI();
			System.out.println(uri);
			
			int lastIndex = uri.lastIndexOf("/");
			String action = uri.substring(lastIndex+1);
			
			req.setCharacterEncoding("utf-8");
			
			
			if(action.equals("go_admin.admin")) {
				
				
				RequestDispatcher rd = req.getRequestDispatcher("/administrator/member/adminPage.jsp");
				rd.forward(req, resp);
			}
			else if(action.equals("admin_memberList")) {
				
				MembersDAO dao = new MembersDAOImpl();
				Members members = new Members();
				
				req.setCharacterEncoding("utf-8");
				
				List<Members> memberList=dao.selectAll();
				
				req.setAttribute("members", memberList);
				
				RequestDispatcher rd = req.getRequestDispatcher("/administrator/member/memberList.jsp");
				rd.forward(req, resp);
			}
			else if(action.equals("member_detail")) {
				
				String id = req.getParameter("id");
				
				MembersDAO dao = new MembersDAOImpl();
				Members members = dao.selectById(id);
				
				req.setAttribute("members", members);
				
				RequestDispatcher rd = req.getRequestDispatcher("/administrator/member/member_detail.jsp");
				rd.forward(req, resp);
			}
			else if(action.equals("admin_update")) {
				
				AdminDAO dao = new AdminDAOImpl();
				Members members = new Members();
				
				
				members.setPassword(req.getParameter("password"));
				members.setLastname(req.getParameter("lastname"));
				members.setFirstname(req.getParameter("firstname"));
				
				members.setPhone(req.getParameter("phone"));
				members.setEmail(req.getParameter("email"));
				members.setQuestion(req.getParameter("question"));
				members.setAnswer(req.getParameter("answer"));
				members.setId(req.getParameter("id"));
				
				
				System.out.println(members);
				dao.update(members);
				
				
				RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
				rd.forward(req, resp);
			}
			
		}
		
}

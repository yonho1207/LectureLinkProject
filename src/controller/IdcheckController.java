package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MembersDAO;
import dao.MembersDAOImpl;
import model.Members;



@WebServlet(name="IdcheckController",urlPatterns = {"/idcheck","/go_searchpwd","/search_pwd","/pwd_update"})
public class IdcheckController extends HttpServlet{

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
			
			
			if(action.equals("idcheck")) {
				String id = req.getParameter("id");
				
				MembersDAO dao = new MembersDAOImpl();
				System.out.println(id);
				int cnt = dao.idcheck(id);
				req.setAttribute("cnt", cnt);
				
				if(cnt>0) {
					
					req.setAttribute("message","重なるIDが存在します。");
				}else if(cnt<1) {
					
					req.setAttribute("message","使用可能なIDです。");
				}
				
			
				RequestDispatcher rd = req.getRequestDispatcher("/members/idcheck_result.jsp");
				rd.forward(req, resp);
				
				
				
			}
			else if(action.equals("go_searchpwd")) {
				
				
				RequestDispatcher rd = req.getRequestDispatcher("/members/search_password.jsp");
				rd.forward(req, resp);
			}
			else if(action.equals("search_pwd")) {
				String id = req.getParameter("id");
				String email = req.getParameter("email");
				String question = req.getParameter("question");
				String answer = req.getParameter("answer");

				MembersDAO dao = new MembersDAOImpl();
				Members members = dao.selectById(id);
				
				System.out.println(members);
				
				if (members!=null && members.getId() !=null 
						&& email.equals(members.getEmail()) 
						&& question.equals(members.getQuestion()) 
						&& answer.equals(members.getAnswer())) {

					req.setAttribute("pwd_info", members);
					RequestDispatcher rd = req.getRequestDispatcher("/members/new_pwd.jsp");
					rd.forward(req, resp);
				
				}else{
					
					
					req.setAttribute("message", "条件に合った会員がいません。");
					
					RequestDispatcher rd = req.getRequestDispatcher("/members/search_password.jsp");
					rd.forward(req, resp);
					
					
				}
				
			}
			else if(action.equals("pwd_update")) {
				
				MembersDAO dao = new MembersDAOImpl();
				Members members = new Members();
				
				members.setPassword(req.getParameter("password"));
				members.setMember_no(Integer.parseInt(req.getParameter("member_no")));
				dao.update(members);
				
				RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
				rd.forward(req, resp);
			}
			
			
			

		}
}

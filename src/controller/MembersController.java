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

import dao.AdminDAO;
import dao.AdminDAOImpl;
import dao.MembersDAO;
import dao.MembersDAOImpl;
import dao.PaymentDAOImpl;

import model.Members;
import model.Payment;


@WebServlet(name="MembersController",urlPatterns = {"/go_account","/input_account","/go_login","/login","/logout","/go_Member_Profile.do","/go_profile_update.do","/profile_update","/delete_member"})
public class MembersController extends HttpServlet{

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
		
		
		if(action.equals("go_account")) {
			RequestDispatcher rd = req.getRequestDispatcher("/members/members_InputForm.jsp");
			rd.forward(req, resp);
		}else if(action.equals("input_account")) {
			MembersDAO dao = new MembersDAOImpl();
			Members members = new Members();
			
			members.setId(req.getParameter("id"));
			members.setPassword(req.getParameter("password"));
			members.setLastname(req.getParameter("lastname"));
			members.setFirstname(req.getParameter("firstname"));
			members.setBirth(req.getParameter("birth"));
			members.setPhone(req.getParameter("phone"));
			members.setGender(req.getParameter("gender"));
			members.setQuestion(req.getParameter("question"));
			members.setAnswer(req.getParameter("answer"));
			members.setEmail(req.getParameter("email"));
			
			dao.insert(members);
			
			
			RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
			rd.forward(req, resp);
		}
		else if (action.equals("go_login")) {
			RequestDispatcher rd = req.getRequestDispatcher("/members/login.jsp");
			rd.forward(req, resp);
		} 
		else if (action.equals("login")) {
			String id = req.getParameter("id");
			System.out.println(id);
			String password = req.getParameter("password");
			
			PaymentDAOImpl pdao = new PaymentDAOImpl();
			MembersDAOImpl dao = new MembersDAOImpl();
			Members members = dao.selectById(id);
			

			System.out.println(members);
			/*System.out.println(id);
*/
			if (members!=null && members.getId() !=null && members.getId().equals("admin")
					&& password.equals(members.getPassword())) {

				
					
					HttpSession session = req.getSession();
					session.setAttribute("admin", members);
					
					
					

					RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
					rd.forward(req, resp);
					
				
				
			
			}
			else if (members!=null && members.getId() !=null &&!members.getId().equals("admin")
					&& password.equals(members.getPassword())) {

				
					
					HttpSession session = req.getSession();
					List<Payment> attending_List = new ArrayList<Payment>();
					attending_List = pdao.attending_Lecture(members.getMember_no());
					session.setAttribute("attending_List", attending_List);
					session.setAttribute("members_info", members);
					

				RequestDispatcher rd = req.getRequestDispatcher("/goMain");
				rd.forward(req, resp);
			
			}else{
				
				
				req.setAttribute("message", "IDとパスワードをもう一度お確かめください");
				
				RequestDispatcher rd = req.getRequestDispatcher("/members/login.jsp");
				rd.forward(req, resp);
				
				
			}
			
			

		}
		else if (action.equals("logout")) {
			
			HttpSession session = req.getSession();
			session.removeAttribute("members_info");
			session.removeAttribute("admin");
			
			RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
			rd.forward(req, resp);

		}
		else if(action.equals("go_Member_Profile.do")) {
			
			MembersDAO dao = new MembersDAOImpl();
			HttpSession session = req.getSession();
			Members member =(Members) session.getAttribute("members_info");
			Members newmember =dao.selectById(member.getId());
			req.setAttribute("newmember", newmember);
			
			RequestDispatcher rd = req.getRequestDispatcher("/members/profile.jsp");
			rd.forward(req, resp);
		}
		else if(action.equals("go_profile_update.do")) {
			
			MembersDAO dao = new MembersDAOImpl();
			HttpSession session = req.getSession();
			Members member =(Members) session.getAttribute("members_info");
			Members newmember =dao.selectById(member.getId());
			req.setAttribute("newmember", newmember);
			
			RequestDispatcher rd = req.getRequestDispatcher("/members/profileUpdate.jsp");
			rd.forward(req, resp);
		}
		else if(action.equals("profile_update")) {
			
			MembersDAO dao = new MembersDAOImpl();
			Members members = new Members();
			
			
			
			members.setLastname(req.getParameter("lastname"));
			members.setFirstname(req.getParameter("firstname"));
			members.setGender(req.getParameter("gender"));
			
			members.setPhone(req.getParameter("phone"));
			members.setBirth(req.getParameter("birth"));
			members.setEmail(req.getParameter("email"));
			members.setQuestion(req.getParameter("question"));
			members.setAnswer(req.getParameter("answer"));
			members.setId(req.getParameter("id"));
			
			
			
			System.out.println(members);
			dao.updateAll(members);
			
			
			RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
			rd.forward(req, resp);
		}
		else if(action.equals("delete_member")) {
			
			MembersDAO dao = new MembersDAOImpl();
			Members members = new Members();
			
			members.setId(req.getParameter("id"));
			System.out.println(members);
			
			dao.delete(members.getId());
			HttpSession session = req.getSession();
			session.removeAttribute("members_info");
			
			
			
			RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
			rd.forward(req, resp);
		
	
		}

}
}

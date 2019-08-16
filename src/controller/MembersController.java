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


import dao.MembersDAO;
import dao.MembersDAOImpl;
import dao.PaymentDAOImpl;
import model.Members;
import model.Payment;

@WebServlet(name="MembersController",urlPatterns = {"/go_account","/input_account","/go_login","/login","/logout"})
public class MembersController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
		//System.out.println("doGet() 호占쏙옙占�");
		
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
			System.out.println("왓다");
			
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
					
					
					req.setAttribute("log","占싸깍옙占쏙옙");

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
					req.setAttribute("log","占싸깍옙占쏙옙");

				RequestDispatcher rd = req.getRequestDispatcher("/goMain");
				rd.forward(req, resp);
			
			}else{
				
				
				req.setAttribute("message", "占쏙옙占싱듸옙占� 占싻쏙옙占쏙옙占썲를 확占쏙옙占쏙옙占쌍쇽옙占쏙옙");
				
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

}
}

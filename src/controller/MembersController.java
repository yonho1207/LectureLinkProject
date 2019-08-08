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

import dao.MembersDAO;
import dao.MembersDAOImpl;
import model.Members;

@WebServlet(name="MembersController",urlPatterns = {"/go_account","/input_account"})
public class MembersController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
		//System.out.println("doGet() »£√‚µ ");
		
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

}
}

package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MembersDAO;
import dao.MembersDAOImpl;



@WebServlet(name="IdcheckController",urlPatterns = {"/idcheck"})
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
				System.out.println(cnt);
				
				if(cnt>0) {
					
					req.setAttribute("message","중복된 아이디입니다");
				}else if(cnt<1) {
					
					req.setAttribute("message","사용 가능한 아이디입니다");
				}
				
			
				RequestDispatcher rd = req.getRequestDispatcher("/members/idcheck_result.jsp");
				rd.forward(req, resp);
				
				
				
			}

		}
}

package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName="AdminFilter",urlPatterns= {"*.admin"})
public class AdminFilter extends HttpServlet implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		
		
		HttpServletRequest request = (HttpServletRequest)req;
		HttpSession session = request.getSession(false);
		
		
		
		boolean login = false;
		
		if(session !=null) {
			if(session.getAttribute("admin")!=null) {
				
				login = true;
				
			}
			
		}
		if(login) {
			chain.doFilter(req,res);
			
		}else {
			((HttpServletResponse)res).sendRedirect("go_login"); 
			
			
		}
	}
	

}

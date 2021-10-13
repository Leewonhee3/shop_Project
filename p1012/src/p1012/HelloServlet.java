package p1012;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class HelloServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;chartset=UTF-8");
		response.getWriter().print("<html><body>hello</body></html>");
		
		
	}
	
}

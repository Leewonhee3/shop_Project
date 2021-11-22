package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.StatsService;

@WebServlet("/HomeController")
public class HomeController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		StatsService statsService = new StatsService();
		Map<String, Long> map = statsService.getStatsCount();
		request.setAttribute("todayCount", map.get("todayCount"));
		request.setAttribute("totalCount", map.get("totalCount"));
		request.getRequestDispatcher("/WEB-INF/view/home.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	}

}

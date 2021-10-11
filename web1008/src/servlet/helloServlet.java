package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
//@WebServlet("/hello") //1)맵핑하여 사용해야한다. 파일이름을 원하는대로 할 수 있음 JSP파일은 파일이름 자동 매핑

public class helloServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8"); // page contentType 응답타입/응답인코딩
		PrintWriter out = response.getWriter(); // 응답할 OutputStream -> out -> html 페이지
		out.print("<!DOCTYPE html><html><head><meta charset='UTF-8'><title>Insert title here</title></head><body>");
		out.print(new Date());
		out.print("</body></html>");
		//서블릿 방식 java안에 html을 넣는 방식
		//웹브라우저 요청 -> helloServlet.class -> 응답 x -> 톰캣안에 허가도니 서블릿 자바파일만을 실행 or jsp요청은 자동으로 허용(자동맵핑)
		//jsp방식 html안에 java를 넣는 방식
		//JSP파일이 실행되는 것이 아닌 JSP파일이 Tomcat에 의해서(class hello.jsp implements Servlet{...}) 자바 클래스 파일로 변경 후 컴파일 실행
		
		
	}
	
	/*
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	 */
	
	//get or post중 사용할 방식을 오버라이딩 한다.
}

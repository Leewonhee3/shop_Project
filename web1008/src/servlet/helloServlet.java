package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
//@WebServlet("/hello") //1)�����Ͽ� ����ؾ��Ѵ�. �����̸��� ���ϴ´�� �� �� ���� JSP������ �����̸� �ڵ� ����

public class helloServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8"); // page contentType ����Ÿ��/�������ڵ�
		PrintWriter out = response.getWriter(); // ������ OutputStream -> out -> html ������
		out.print("<!DOCTYPE html><html><head><meta charset='UTF-8'><title>Insert title here</title></head><body>");
		out.print(new Date());
		out.print("</body></html>");
		//���� ��� java�ȿ� html�� �ִ� ���
		//�������� ��û -> helloServlet.class -> ���� x -> ��Ĺ�ȿ� �㰡���� ���� �ڹ����ϸ��� ���� or jsp��û�� �ڵ����� ���(�ڵ�����)
		//jsp��� html�ȿ� java�� �ִ� ���
		//JSP������ ����Ǵ� ���� �ƴ� JSP������ Tomcat�� ���ؼ�(class hello.jsp implements Servlet{...}) �ڹ� Ŭ���� ���Ϸ� ���� �� ������ ����
		
		
	}
	
	/*
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	 */
	
	//get or post�� ����� ����� �������̵� �Ѵ�.
}

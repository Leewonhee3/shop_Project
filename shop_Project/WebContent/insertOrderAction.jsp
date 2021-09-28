<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" %>
<%
	
	request.setCharacterEncoding("utf-8"); //인코딩	
	//인증 방어 코드 : 로그인 전 session.getAttribute("loginMember") == null 인 경우
	if(session.getAttribute("loginMember")==null){

		System.out.println("로그인 안됨");
		response.sendRedirect("./index.jsp"); //로그인 안되면 주문 불가능.
		return;

	}
	
	//입력값 검사
	if(request.getParameter("ebookNo")==null||request.getParameter("memberNo")==null||request.getParameter("orderPrice")==null){
		System.out.println("error - 입력값 null");
		response.sendRedirect(request.getContextPath()+"/index.jsp"); //입력값이 null인 경우
		return;
	}
	
	if(request.getParameter("ebookNo").equals("")||request.getParameter("memberNo").equals("")||request.getParameter("orderPrice").equals("")){
		System.out.println("error - 입력값 공백");
		response.sendRedirect(request.getContextPath()+"/index.jsp"); //입력값이 빈경우
		return;
	}
	
%>
<!DOCTYPE html>
<html>

	<head>
	
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
	</head>
	
	<body>
		
		<%
		
			//check
			System.out.println(request.getParameter("ebookNo")+"insertOrderAction - ebookNo");
			System.out.println(request.getParameter("memberNo")+"insertOrderAction - memberNo");
			System.out.println(request.getParameter("orderPrice")+"insertOrderAction - orderPrice");
			
			//input
			int ebookNo = Integer.parseInt(request.getParameter("ebookNo"));
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));
			int orderPrice = Integer.parseInt(request.getParameter("orderPrice"));
			
			OrderDao orderDao = new OrderDao();
			
			orderDao.insertMemberOrder(ebookNo, memberNo, orderPrice);
		
			response.sendRedirect(request.getContextPath()+"/selectOrderListByMember.jsp");
		
		%>
		
	</body>
	
</html>
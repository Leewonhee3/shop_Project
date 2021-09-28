<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" import="vo.*" import="com.oreilly.servlet.MultipartRequest" import= "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%> <!-- request 대신 사용 -->        
<%
	request.setCharacterEncoding("utf-8");
		
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("오류");
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			return;
		
	} // 세션이 null이거나 레벨이 0인경우 일반 인덱스 페이지로 이동 방어코드
	
	//Integer.parseInt(request.getParameter("ebookNo")); 멀티파트 폼데이터로 값을 넘길시 문자열로 받을 수 없으므로 사용불가함
	
	MultipartRequest mr = new MultipartRequest(request, "D:/git-shop/shop_Project/WebContent/img",1024*1024*1024,"utf-8", new DefaultFileRenamePolicy());
	
	int ebookNo = Integer.parseInt(mr.getParameter("ebookNo"));
	String ebookImg = mr.getFilesystemName("ebookImg");
	Ebook ebook = new Ebook();
	ebook.setEbookNo(ebookNo);
	ebook.setEbookImg(ebookImg);
	
	EbookDao ebookDao = new EbookDao();
	ebookDao.updateEbookImg(ebook);
	response.sendRedirect(request.getContextPath()+"/admin/selectEbookOne.jsp?ebookNo="+ebookNo);
%>
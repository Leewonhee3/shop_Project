<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" import = "dao.*"%>

<%
	request.setCharacterEncoding("utf-8");
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("오류");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
   		return;
	
	} // 세션이 null이거나 레벨이 0인경우 일반 인덱스 페이지로 이동 

	//check
	int check=0;
	
	System.out.println(request.getParameter("memberNo")+"<-------insertNoticeAction - memberNo");
	System.out.println(request.getParameter("noticeTitle")+"<-------insertNoticeAction - noticeTitle");
	System.out.println(request.getParameter("noticeContent")+"<-------insertNoticeAction - noticeContent");
	
	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.insertNoteNew(memberNo, noticeTitle, noticeContent);
	
	response.sendRedirect(request.getContextPath()+"/admin/selectNoticeList.jsp"); // 성공시	
	
%>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>

	</head>

	<body>
	
	</body>
	
</html>
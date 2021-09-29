<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" import = "dao.*" import = "java.util.*" %>

<%

	request.setCharacterEncoding("utf-8");
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("오류");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
   		return;
	
	} // 세션이 null이거나 레벨이 0인경우 일반 인덱스 페이지로 이동 
	
	System.out.println(request.getParameter("noticeTitle")+"<-----updateNoticeAction - title"); //check
	System.out.println(request.getParameter("noticeContent")+"<-----updateNoticeAction - content"); 
	System.out.println(request.getParameter("memberNo")+"<-----updateNoticeAction - memberNo"); 
	System.out.println(request.getParameter("noticeNo")+"<-----updateNoticeAction - noticeNo"); 
	
	Notice notice = new Notice();
	
	notice.setNoticeNo(Integer.parseInt(request.getParameter("noticeNo")));
	notice.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
	notice.setNoticeTitle(request.getParameter("noticeTitle"));
	notice.setNoticeContent(request.getParameter("noticeContent"));
	
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.updateNoticeByAdmin(notice);
	response.sendRedirect(request.getContextPath()+"/admin/selectNoticeList.jsp");//성공
	
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
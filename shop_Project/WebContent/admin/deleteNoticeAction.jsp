<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" import= "dao.*" import = "java.util.*" %>

<%

	request.setCharacterEncoding("utf-8");
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("오류");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
   		return;
	
	} // 세션이 null이거나 레벨이 0인경우 일반 인덱스 페이지로 이동 

	request.setCharacterEncoding("utf-8");
	Notice notice = new Notice();
	NoticeDao noticeDao = new NoticeDao();
	
	System.out.println(request.getParameter("memberNo")+"<--------deleteNoticeAcition - memberNo");//check
	System.out.println(request.getParameter("noticeNo")+"<--------deleteNoticeAcition - noticeNo");
	
	notice.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
	notice.setNoticeNo(Integer.parseInt(request.getParameter("noticeNo")));
	
	noticeDao.deleteNoticeByAdmin(notice);
	response.sendRedirect(request.getContextPath()+"/admin/selectNoticeList.jsp"); // 성공

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
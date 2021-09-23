<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" import="vo.*" %>    
<%
	
request.setCharacterEncoding("utf-8");
	
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("오류");
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			return;
	
	} // 세션이 null이거나 레벨이 0인경우 일반 인덱스 페이지로 이동 방어코드

	int ebookNo = Integer.parseInt(request.getParameter("ebookNo"));
%>    
<!DOCTYPE html>
<html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>

	</head>

	<body>
		
		<div>
				
			<!-- partial폴더에 관리자 메뉴 getContext 사용하면 오류남 이유는 추후 해결해야 할듯 9/23-->
			<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
				
		</div>
		<!-- 관리자 메뉴 인클루드 끝 -->
		<%
			
			EbookDao ebookDao = new EbookDao();
			Ebook ebook = ebookDao.selectEbookOne(ebookNo);
		
		%>
		<div>
		
			<%=ebook.getEbookNo() %>
		
		</div>
		
		<div>
		
			<img src = "<%=request.getContextPath() %>/img/<%=ebook.getEbookImg()%>">
		
		</div>
		
		<div>
		
			<a href = "">삭제</a>
			<a href = "">가격수정</a>
			<a href="<%=request.getContextPath()%>/admin/updateEbookImgForm.jsp?ebookNo=<%=ebook.getEbookNo()%>">이미지수정</a>
   		
   		</div>

		
		
		
	</body>

</html>
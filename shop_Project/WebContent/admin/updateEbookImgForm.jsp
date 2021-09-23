<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" import="vo.*" import="com.oreilly.servlet.MultipartRequest" import= "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>        
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
		<form action="<%=request.getContextPath()%>/admin/updateEbookImgAction.jsp" method="post" enctype="multipart/form-data">
			
			<!--multipart/form-data : 액션으로 기계어 코드를 넘길때 사용  -->
			<!-- application/x-www-form-urlencoded : 액션으로 문자열 넘길때 사용 -->
			<input type = "text" name="ebookNo" value="<%=ebookNo %>" readonly="readonly"> <!-- hidden 써도 됨 -->
			<input type = "file" name="ebookImg">
			<button type = "submit">이미지파일 수정</button>		
		
		
		</form>
		
	</body>
	
</html>
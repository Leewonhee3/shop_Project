<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>

<%
	request.setCharacterEncoding("utf-8");
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("오류");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
   		return;
	
	} // 세션이 null이거나 레벨이 0인경우 일반 인덱스 페이지로 이동 
%>

<!DOCTYPE html>
<html>

	<head>
	
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- jquery -->
		
	</head>

	<body class="bg-secondary text-white">
			
		<!-- start : adminmenu include -->
		
		<div>
					
			<div class="row">
				
				<div class="col"><jsp:include page="/partial/adminMenu.jsp"></jsp:include></div>
					
			</div>
					
		</div>
		
		<!-- end : adminmenu include -->
	
		<h2>공지사항 글쓰기</h2>
		
		<form method="post" action="<%=request.getContextPath() %>/admin/insertNoticeAction.jsp" id = "writeForm">
				
			<div>제목 : </div>
			<div><input type = "text" name= "noticeTitle" id = "noticeTitle"></div>
				
			<div>내용 : </div>
			
			<div>
				
				<textarea type = "text" name= "noticeContent" id = "noticeContent"></textarea>
			
			</div>
			
			<input hidden="hidden" type="text" id="memberNo" name ="memberNo" value="<%=request.getParameter("memberNo") %>">
				
			<button type= "button" id ="btn">추가</button>
			
		</form>
	
	</body>

	<script>
		
		$("#btn").click(function(){
				
			$('#writeForm').submit();
			    
		});

		
	</script>		

</html>
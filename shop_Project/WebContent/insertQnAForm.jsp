<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" %>    

<%
	
	//login check
	if(session.getAttribute("loginMember") == null) {
		
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		System.out.println("not login!");
		return;
	
	}

	//parameter check
	System.out.println(request.getParameter("memberNo")+"<------------insertQnAForm - memberNo");
	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	
%>

<!DOCTYPE html>
<html>

	<head>
		
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
			
	</head>
		
	<body>
			
		<!-- start : submenu include -->
		<div>
				
			<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
				
		</div>
		<!-- end : submenu include -->
			
			
		<h2>QnA 입력</h2>
			
		<form action="<%=request.getContextPath() %>/insertQnAAction.jsp" method="post">
				
			<!--액션으로 넘기고 안보이게-->
			<input type="text" hidden="hidden" name = "memberNo" value="<%=memberNo%>">
			
			<table border="1">
				
				<tr> 
					
					<td>
							
						제목
						
						<td width="100">
						
							<input type="text" name="QnAtitle" id="QnAtitle" size=60>
						
								카테고리
							
								<select name="QnACategory">
								
									<option value="전자책관련">전자책관련</option>
									<option value="개인정보관련">개인정보관련</option>	
									<option value="기타">기타</option>
								
								</select>
								
								<input type="checkbox" name="QnASecret" value="Y">비밀글
						
						</td>
					
				</tr>
					
				<tr>
						
					<td>내용</td>
					<td width="100" height="100"><textarea name = "QnAcontent" rows=10 cols=100 style="text-align:center;"></textarea></td>
					
				<tr>
				
			</table>
				
			<button type="submit">입력</button>
			
		</form>
			
	</body>
		
</html>
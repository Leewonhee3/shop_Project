<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" %>    

<%

	request.setCharacterEncoding("utf-8");
	Member member = null;

	//protect code - login check
	if(session.getAttribute("loginMember") == null) {
		
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		System.out.println("not login!");
		return;
	
	}else{
		
		member = new Member();
		member = (Member)session.getAttribute("loginMember");
		
	}

	//parameter check
	System.out.println(request.getParameter("memberNo")+"<------------insertQnAForm - memberNo");
	System.out.println(request.getParameter("qnaNo")+"<------------insertQnAForm - qnaNo");
	
	//implemented
	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	
	//protect code - only Writer
	if(memberNo != member.getMemberNo()){
		
		response.sendRedirect(request.getContextPath()+"/selectQnAList.jsp");
		System.out.println("No permission!");
		return;
		
	}
	
	QnADao qnaDao = new QnADao();
	QnA qna = qnaDao.selectQnAOne(qnaNo);
	
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
			
			
		<h2>QnA 수정</h2>
			
		<form action="<%=request.getContextPath() %>/updateQnAAction.jsp" method="post">
				
			<!--액션으로 넘기고 안보이게-->
			<input type="text" hidden="hidden" name = "memberNo" value="<%=memberNo%>">
			<input type="text" hidden="hidden" name = "qnaNo" value="<%=qnaNo%>">
			
			<table border="1">
				
				<tr> 
					
					<td>
							
						제목
						
						<td width="100">
						
							<input type="text" name="QnAtitle" id="QnAtitle" size=60 value="<%=qna.getQnaTitle()%>">
						
								카테고리
							
								<select name="QnACategory">
								
								<%
									
									String s1="";
									String s2="";
									String s3="";
									
									if(qna.getQnaCategory().equals("전자책관련")){
										s1 = "selected";
									}else if(qna.getQnaCategory().equals("개인정보관련")){
										s2 = "selected";
									}else{
										s3="selected";
									}
								
								%>
								
									<option value="전자책관련" <%=s1 %>>전자책관련</option>
									<option value="개인정보관련" <%=s2 %>>개인정보관련</option>	
									<option value="기타" <%=s3 %>>기타</option>
								
								</select>
								
								<%
								
									if(qna.getQnaSecret().equals("Y")){
								
								%>		
								
										<input type="checkbox" name="QnASecret" value="Y" checked="checked">비밀글	
								
								<%
										
									}else{
								%>
								
										<input type="checkbox" name="QnASecret" value="Y">비밀글
								
								<% 		
									
									}
								
								%>
						
						</td>
					
				</tr>
					
				<tr>
						
					<td>내용</td>
					<td width="100" height="100"><textarea name = "QnAcontent" rows=10 cols=100 style="text-align:center;"><%=qna.getQnaContent()%></textarea></td>
					
				<tr>
				
			</table>
				
			<button type="submit">입력</button>
			
		</form>
			
	</body>
		
</html>
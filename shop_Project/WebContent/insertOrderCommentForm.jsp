<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); //인코딩	
	//인증 방어 코드 : 로그인 전 session.getAttribute("loginMember") == null 인 경우
	if(session.getAttribute("loginMember")==null){
		System.out.println("로그인 해야됨");
		response.sendRedirect("./index.jsp"); //로그인 안되면 후기 달수 없음.
		return;
	}
	
	System.out.println(request.getParameter("orderNo")+"insertOrderCommentForm - orderNo");
	System.out.println(request.getParameter("ebookNo")+"insertOrderCommentForm - ebookNo");//check
	
	String orderNo="";
	String ebookNo="";
	
	if(request.getParameter("orderNo")!=null||request.getParameter("ebookNo")!=null){// 파라메터 값이 null이 아닌경우 저장
	
		orderNo = request.getParameter("orderNo");
		ebookNo = request.getParameter("ebookNo");
	}
	
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
		
		
		<h2>후기 입력</h2>
		
		<form action="<%=request.getContextPath() %>/insertOrderCommentAction.jsp" method="post">
			
			<!--액션으로 넘기고 안보이게-->
			<input type="text" hidden="hidden" name = "orderNo" value="<%=orderNo%>">
			<input type="text" hidden="hidden" name = "ebookNo" value="<%=ebookNo%>">
		
			<table border="1">
				
				<tr>
					
					<td>내용</td>
					<td width="100" height="100"><textarea name = "content" rows=10 cols=100 style="text-align:center;"></textarea></td>
					
				<tr>
				
				<tr>
				
					<td>별점</td>
					
					<td>
					
						<select name ="score">
							<!-- 스코어 옵션은 그림으로 입력값은 숫자로 -->
							<option value="1">★</option>
							<option value="2">★★</option>
							<option value="3">★★★</option>
							<option value="4">★★★★</option>
							<option value="5">★★★★★</option>
						
						</select>
					
					</td>
				
				</tr>
			
			</table>
			
			<button type="submit">입력</button>
		
		</form>
		
	</body>
	
</html>
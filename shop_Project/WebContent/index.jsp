<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" %>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	</head>
	
	<body>
	
		<div class="row">
		
	  		<div class="col"><jsp:include page="/partial/mainMenu.jsp"></jsp:include></div>
	  		
		</div>
	
		<!-- start : submenu include -->
		
		<!-- end : submenu include -->
		
		<br>
		<br>
		
		<div class="container row" style="float: none; margin:0 auto;"> 

			<div class="col-md-3" style="float: none; margin:0 auto;">

				<h1>쇼핑몰 메인</h1>
			
			</div>
			
		</div>


		
		<div>
		
		<%
            if(session.getAttribute("loginMember") == null) {
         %>
            	<br>
            	<br>
            	<br>
            	<br>
            	
            	<div class="container row" style="float: none; margin:0 auto;"> 

					<div class="col-md-3" style="float: none; margin:0 auto;">
               
	               		<a href="<%=request.getContextPath() %>/loginForm.jsp" class="btn btn-primary">로그인</a>
	               		<a href="<%=request.getContextPath() %>/insertMemberForm.jsp" class="btn btn-primary">회원가입</a>
               	
               		</div>
               	
               	</div>
         <%      
            }else {
               Member loginMember = (Member)session.getAttribute("loginMember");
         %>
            <br>
            <br>
            <br>
            <br>
            
            <div class="container row" style="float: none; margin:0 auto;"> 

				<div class="col-md-3" style="float: none; margin:0 auto;">
       
		            <!-- 로그인 -->
		            <div><%=loginMember.getMemberId()%>님 반갑습니다.<a href="./logout.jsp">로그아웃</a></div>
		            <!-- 관리자 페이지로 가는 링크 -->
		         <%
		               if(loginMember.getMemberLevel() > 0) {
		         %>
		                  <div><a href="<%=request.getContextPath()%>/admin/adminIndex.jsp">관리자 페이지</a></div>
		         <%
		               }
		            }
		         %>
		     
		     </div>    

		</div>
	
	</body>

</html>
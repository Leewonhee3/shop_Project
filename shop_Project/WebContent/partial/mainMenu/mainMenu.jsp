<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" import = "dao.*" import="java.util.ArrayList"%>

<%
	
	//encoding
	request.setCharacterEncoding("utf-8");

	//paging
	
	int currentPage = 1;
	int ROW_PER_PAGE = 10;
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	
	//set category button for mainmenu
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category> categoryList = categoryDao.SelectCategoryListAllByPage(beginRow, ROW_PER_PAGE);

%>

<!DOCTYPE html>
<html>

	<head>
		
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
			
	</head>
	
	<body>
		
		<nav class="navbar navbar-expand-sm bg-primary navbar-dark navbar navbar-inverse navbar-fixed-top">
	
			<ul id="nav3" class="nav justify-content-center bg-primary"> 
				
				<div class="px-5"></div>
				<div class="px-5"></div>
				<div class="px-5"></div>
				<div class="px-5"></div>
				
				<%
					for(Category c : categoryList){
					
				%>
						<li class="nav-item"> 
								
							<a class="nav-link active text-white" href="#"><%=c.getCategoryName() %></a> 
								
						</li> 
					
				<%
					
					}
					
				%>	
				
				<div class="px-5"></div>
				<div class="px-5"></div>
				<div class="px-5"></div>
				
					
				<%
					
					// Depending on the login activate different function 
					if(session.getAttribute("loginMember")!=null){
							
					//	true - login
					//  false - Unlogin
					
				%>
				
						<li class="nav-item"> 
					
							<small><a class="nav-link active text-white" href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a></small>
						
						</li>
						
						<li class="nav-item dropdown">
	    					
	    					<small>
	    					
			    				<a class="nav-link dropdown-toggle text-white" data-toggle="dropdown" href="<%=request.getContextPath()%>/loginForm.jsp">마이페이지</a>
			    						
			    					<div class="dropdown-menu">
										
										<a class="dropdown-item" href="<%=request.getContextPath()%>/myPage.jsp">마이페이지</a>
										<a class="dropdown-item" href="<%=request.getContextPath()%>/selectOrderListByMember.jsp">주문내역</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">마이리스트</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">NO포인트</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">NO머니</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">NO상품권</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">쿠폰</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">회원정보</a>
					
									</div>
							    
	  						</small>
	  						
	  					</li>
	  				
	  					<li class="nav-item"> 
					
							<small><a class="nav-link disabled text-white" href="#">카트</a></small>
						
						</li>
				
						<li class="nav-item"> 
					
							<small><a class="nav-link active text-white" href="<%=request.getContextPath()%>/selectOrderListByMember.jsp">주문/배송</a></small>
						
						</li> 
				
						<li class="nav-item"> 
					
							<small><a class="nav-link active text-white" href="<%=request.getContextPath() %>/serviceCenterIndex.jsp">고객센터</a></small>
						
						</li> 
				
				<%	
					
					}else{
				
				%>
				
						<li class="nav-item"> 
						
							<small><a class="nav-link active text-white" href="<%=request.getContextPath()%>/loginForm.jsp">로그인</a></small>
						
						</li> 
						
						<li class="nav-item"> 
							
							<small><a class="nav-link active text-white" href="<%=request.getContextPath()%>/insertMemberForm.jsp">회원가입</a></small>
							
						</li>
							
						<li class="nav-item dropdown">
		    					
		    				<small>
		    					
			    				<a class="nav-link dropdown-toggle text-white" data-toggle="dropdown" href="<%=request.getContextPath()%>/loginForm.jsp">마이페이지</a>
			    						
			    					<div class="dropdown-menu">
										
										<a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">마이페이지</a>
										<a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">주문내역</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">마이리스트</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">NO포인트</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">NO머니</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">NO상품권</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">쿠폰</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">회원정보</a>
					
									</div>
								    
		  					</small>
	  						
	  					</li>
	  				
		  				<li class="nav-item"> 
						
							<small><a class="nav-link disabled text-white" href="#">카트</a></small>
							
						</li>
					
						<li class="nav-item"> 
						
							<small><a class="nav-link active text-white" href="<%=request.getContextPath()%>/loginForm.jsp">주문/배송</a></small>
							
						</li> 
					
						<li class="nav-item"> 
						
							<small><a class="nav-link active text-white" href="<%=request.getContextPath() %>/serviceCenterIndex.jsp">고객센터</a></small>
							
						</li> 
				
				<%		
							
					}
					
				%>		
				 
			</ul>
				
		</nav>	
			
	</body>
	
	<script>
	
	    $('.dropdown').hover(
	        function() {
	            $(this).find('.dropdown-menu').stop(true, true).delay(0).fadeIn();
	        },
	        function() {
	            $(this).find('.dropdown-menu').stop(true, true).delay(0).fadeOut();
	        }
	    );
	
	    $('.dropdown-menu').hover(
	        function() {
	            $(this).stop(true, true);
	        },
	        function() {
	            $(this).stop(true, true).delay(0).fadeOut();
	        }
	    );
	    
	</script>
	
</html>
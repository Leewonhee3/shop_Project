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
					
							<small><a class="nav-link active text-white" href="<%=request.getContextPath()%>/logout.jsp">๋ก๊ทธ์์</a></small>
						
						</li>
						
						<li class="nav-item dropdown">
	    					
	    					<small>
	    					
			    				<a class="nav-link dropdown-toggle text-white" data-toggle="dropdown" href="<%=request.getContextPath()%>/loginForm.jsp">๋ง์ดํ์ด์ง</a>
			    						
			    					<div class="dropdown-menu">
										
										<a class="dropdown-item" href="<%=request.getContextPath()%>/myPage.jsp">๋ง์ดํ์ด์ง</a>
										<a class="dropdown-item" href="<%=request.getContextPath()%>/selectOrderListByMember.jsp">์ฃผ๋ฌธ๋ด์ญ</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">๋ง์ด๋ฆฌ์คํธ</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">NOํฌ์ธํธ</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">NO๋จธ๋</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">NO์ํ๊ถ</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">์ฟ?ํฐ</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">ํ์์?๋ณด</a>
					
									</div>
							    
	  						</small>
	  						
	  					</li>
	  				
	  					<li class="nav-item"> 
					
							<small><a class="nav-link disabled text-white" href="#">์นดํธ</a></small>
						
						</li>
				
						<li class="nav-item"> 
					
							<small><a class="nav-link active text-white" href="<%=request.getContextPath()%>/selectOrderListByMember.jsp">์ฃผ๋ฌธ/๋ฐฐ์ก</a></small>
						
						</li> 
				
						<li class="nav-item"> 
					
							<small><a class="nav-link active text-white" href="<%=request.getContextPath() %>/serviceCenterIndex.jsp">๊ณ?๊ฐ์ผํฐ</a></small>
						
						</li> 
				
				<%	
					
					}else{
				
				%>
				
						<li class="nav-item"> 
						
							<small><a class="nav-link active text-white" href="<%=request.getContextPath()%>/loginForm.jsp">๋ก๊ทธ์ธ</a></small>
						
						</li> 
						
						<li class="nav-item"> 
							
							<small><a class="nav-link active text-white" href="<%=request.getContextPath()%>/insertMemberForm.jsp">ํ์๊ฐ์</a></small>
							
						</li>
							
						<li class="nav-item dropdown">
		    					
		    				<small>
		    					
			    				<a class="nav-link dropdown-toggle text-white" data-toggle="dropdown" href="<%=request.getContextPath()%>/loginForm.jsp">๋ง์ดํ์ด์ง</a>
			    						
			    					<div class="dropdown-menu">
										
										<a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">๋ง์ดํ์ด์ง</a>
										<a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">์ฃผ๋ฌธ๋ด์ญ</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">๋ง์ด๋ฆฌ์คํธ</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">NOํฌ์ธํธ</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">NO๋จธ๋</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">NO์ํ๊ถ</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">์ฟ?ํฐ</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">ํ์์?๋ณด</a>
					
									</div>
								    
		  					</small>
	  						
	  					</li>
	  				
		  				<li class="nav-item"> 
						
							<small><a class="nav-link disabled text-white" href="#">์นดํธ</a></small>
							
						</li>
					
						<li class="nav-item"> 
						
							<small><a class="nav-link active text-white" href="<%=request.getContextPath()%>/loginForm.jsp">์ฃผ๋ฌธ/๋ฐฐ์ก</a></small>
							
						</li> 
					
						<li class="nav-item"> 
						
							<small><a class="nav-link active text-white" href="<%=request.getContextPath() %>/serviceCenterIndex.jsp">๊ณ?๊ฐ์ผํฐ</a></small>
							
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" import = "dao.*" import="java.util.ArrayList"%>

<%
	Member loginMember = new Member();

	if(session.getAttribute("loginMember")!=null){
		
		loginMember = (Member)session.getAttribute("loginMember");
		
	}	

	System.out.println(loginMember.getMemberLevel()+"<----- topMenu - loginMember");
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
	
		<nav class="navbar navbar-expand-sm bg-primary navbar-light border-bottom border-primary border-5 justify-content-center">
			
			<ul class="navbar-nav">
	    		
	    		<%
					for(Category c : categoryList){
					
				%>
						<li class="nav-item active text-white"> 
								
							<a class="nav-link text-white" href="<%=request.getContextPath()%>/selectEbookList.jsp?pageType=<%=c.getCategoryName()%>"><%=c.getCategoryName() %></a>
							
							<div></div>
								
						</li>
					
				<%
					
					}
					
				%>	
	    		
	    		<div class="px-5"></div>
	    		<div class="px-5"></div>
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
					
							<small><a class="nav-link active text-white" href="<%=request.getContextPath()%>/logout.jsp">????????????</a></small>
						
						</li>
						
						<li class="nav-item dropdown">
	    					
	    					<small>
	    					
			    				<a class="nav-link dropdown-toggle text-white" data-toggle="dropdown" href="<%=request.getContextPath()%>/loginForm.jsp">???????????????</a>
			    						
			    					<div class="dropdown-menu">
										
										<a class="dropdown-item" href="<%=request.getContextPath()%>/myPage.jsp">???????????????</a>
										<a class="dropdown-item" href="<%=request.getContextPath()%>/selectOrderListByMember.jsp">????????????</a>
									    <a class="dropdown-item" href="#" id="list" name="list">???????????????</a>
									    <a class="dropdown-item" href="#" id="point" name="point">NO?????????</a>
									    <a class="dropdown-item" href="#" id="nomoney" name="nomoney">NO??????</a>
									    <a class="dropdown-item" href="#" id="nogift" name="nogift">NO?????????</a>
									    <a class="dropdown-item" href="#" id="coupon" name="coupon">??????</a>
									    <a class="dropdown-item" href="#" id="memberinfo" name="memberinfo">????????????</a>
									    
									    <%
									    
									    	if(loginMember.getMemberLevel() == 1) {
									    %>	  	
									    
									    		<a class="dropdown-item" href="<%=request.getContextPath() %>/admin/adminIndex.jsp">??????????????????</a>
									    		
									    <%
									    
									    	}
									    
									    %>
					
									</div>
							    
	  						</small>
	  						
	  					</li>
	  				
	  					<li class="nav-item"> 
					
							<small><a class="nav-link active text-white" href="#" id="kart" name="kart">??????</a></small>
						
						</li>
				
						<li class="nav-item"> 
					
							<small><a class="nav-link active text-white" href="<%=request.getContextPath()%>/selectOrderListByMember.jsp">??????/??????</a></small>
						
						</li> 
				
						<li class="nav-item"> 
					
							<small><a class="nav-link active text-white" href="<%=request.getContextPath() %>/serviceCenterIndex.jsp">????????????</a></small>
						
						</li> 
				
				<%	
					
					}else{
				
				%>
				
						<li class="nav-item"> 
						
							<small><a class="nav-link active text-white" href="<%=request.getContextPath()%>/loginForm.jsp">?????????</a></small>
						
						</li> 
						
						<li class="nav-item"> 
							
							<small><a class="nav-link active text-white" href="<%=request.getContextPath()%>/insertMemberForm.jsp">????????????</a></small>
							
						</li>
							
						<li class="nav-item dropdown">
		    					
		    				<small>
		    					
			    				<a class="nav-link dropdown-toggle text-white" data-toggle="dropdown" href="<%=request.getContextPath()%>/loginForm.jsp">???????????????</a>
			    						
			    					<div class="dropdown-menu">
										
										<a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">???????????????</a>
										<a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">????????????</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">???????????????</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">NO?????????</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">NO??????</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">NO?????????</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">??????</a>
									    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginForm.jsp">????????????</a>
					
									</div>
								    
		  					</small>
	  						
	  					</li>
	  				
		  				<li class="nav-item"> 
						
							<small><a class="nav-link active text-white" href="#" id="kart" name="kart">??????</a></small>
							
						</li>
					
						<li class="nav-item"> 
						
							<small><a class="nav-link active text-white" href="<%=request.getContextPath()%>/loginForm.jsp">??????/??????</a></small>
							
						</li> 
					
						<li class="nav-item"> 
						
							<small><a class="nav-link active text-white" href="<%=request.getContextPath() %>/serviceCenterIndex.jsp">????????????</a></small>
							
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
	    
		$('#kart').click(function(){
	    
			alert("??????????????????..");
	    	
		});
		
		$('#list').click(function(){
		    
			alert("??????????????????..");
	    	
		});
	    
		$('#point').click(function(){
		    
			alert("??????????????????..");
	    	
		});
		
		$('#nogift').click(function(){
		    
			alert("??????????????????..");
	    	
		});
		
		$('#nomoney').click(function(){
		    
			alert("??????????????????..");
	    	
		});
		
		$('#coupon').click(function(){
		    
			alert("??????????????????..");
	    	
		});
		
		$('#memberinfo').click(function(){
		    
			alert("??????????????????..");
	    	
		});
		
		
	</script>
	
</html>
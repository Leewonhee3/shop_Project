<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>

<!DOCTYPE html>
<html>

	<head>
		
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
			
	</head>
	
	<body>
			
		<ul id="nav3" class="nav justify-content-center bg-primary"> 
				
			<li class="nav-item"> 
				
				<a class="nav-link active text-white" href="#">Home</a> 
				
			</li> 
				
			<li class="nav-item"> 
					
				<a class="nav-link text-white" href="#">Link1</a> 
				
			</li> 
				
			<li class="nav-item"> 
				
				<a class="nav-link text-white" href="#">Link2</a> 
					
			</li> 
				
			<li class="nav-item"> 
					
				<a class="nav-link text-white" href="#">Link3</a> 
				
			</li> 
				
			<li class="nav-item"> 
				
				<a class="nav-link text-white" href="#">Link4</a> 
					
			</li> 
				
			<li class="nav-item"> 
				
				<a class="nav-link disabled text-white" href="#">Disabled</a> 
					
			</li> 
			
			<div class="px-5"></div>
			<div class="px-5"></div>
			<div class="px-5"></div>
			
			<li class="nav-item"> 
				
				<small><a class="nav-link disabled text-white" href="#">login or logout</a></small>
					
			</li> 
			
			
			<li class="nav-item"> 
				
				<small><a class="nav-link disabled text-white" href="#">mypage</a></small>
					
			</li>
			
			<li class="nav-item"> 
				
				<small><a class="nav-link disabled text-white" href="#">장바구니</a></small>
					
			</li>
			
			<li class="nav-item"> 
				
				<small><a class="nav-link disabled text-white" href="#">주문내역</a></small>
					
			</li> 
			
			<li class="nav-item"> 
				
				<small><a class="nav-link disabled text-white" href="#">고객센터</a></small>
					
			</li> 
			 
		</ul>

		
		
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				  
				<a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">메인 페이지</a>
				    
				  <ul class="navbar-nav">
				    	
				    <li class="nav-item">
				      	
				      	<a class="nav-link" href="<%=request.getContextPath()%>/selectOrderListByMember.jsp">[주문정보]</a>
				    	
				    </li>
				    	
				    <li class="nav-item">
				      	
				      	<a class="nav-link" href="<%=request.getContextPath()%>/selectQnAList.jsp">[Q&A게시판]</a>
				   
				    </li>
				    	
				    <li class="nav-item">
				      	
				      	<a class="nav-link" href="<%=request.getContextPath()%>/selectNoticeList.jsp">[공지사항]</a>
				    	
				    </li>
				    	
				    <li class="nav-item">
				      	
				      	<a class="nav-link" href="<%=request.getContextPath()%>/admin/">[마이페이지]</a>
				    	
				    </li>
				    	
				    <li class="nav-item">
				      	
				      	<a class="nav-link" href="<%=request.getContextPath()%>/admin/">[5]</a>
				    	
				    </li>
				    	
				    <li class="nav-item">
				      	
				      	<a class="nav-link" href="<%=request.getContextPath()%>/admin/">[6]</a>
				    	
				    </li>
				    	
				  </ul>
		  	
			</nav>
		
		</div>
			
	</body>
	
</html>
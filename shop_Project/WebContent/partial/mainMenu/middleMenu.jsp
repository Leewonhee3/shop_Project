<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	
		<nav class="navbar navbar-expand-sm bg-light navbar-light border-bottom border-primary border-5 justify-content-center">
			
			<ul class="navbar-nav">
	    		
	    		<li class="nav-item active text-primary">
	      			
	      			<a class="nav-link text-primary" href="<%=request.getContextPath() %>/selectEbookList.jsp?pageType=best">베스트</a>
	    		
	    		</li>
	    		
	    		<li class="nav-item active text-primary">
	      			
	      			<a class="nav-link text-primary" href="<%=request.getContextPath() %>/selectEbookList.jsp?pageType=newest">신상품</a>
	    		
	    		</li>
	    
	    		<li class="nav-item active text-primary">
	      
	      			<a class="nav-link text-primary" href="#" id="event">이벤트</a>
	    		
	    		</li>
	    		
	    		<li class="nav-item active text-primary">
	      
	      			<a class="nav-link text-primary" href="#" id="blog">블로그</a>
	    		
	    		</li>
	    		
	    		<div class="px-5"></div>
	    		<div class="px-5"></div>
	    		<div class="px-5"></div>
	    		<div class="px-5"></div>
	    		<div class="px-5"></div>
	    		<div class="px-5"></div>
	    		<div class="px-5"></div>
	    		<div class="px-5"></div>
	    		<div class="px-5"></div>
	  		
	  		</ul>
	
		</nav>
	
	</body>
	
	<script>
		
		$("#event").click(function(){
			
			alert("준비중입니다..");
			
		});
		
		$("#blog").click(function(){
			
			alert("준비중입니다..");
			
		});
	
	</script>
	
</html>
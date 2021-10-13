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
		
		
		
		<nav class="navbar navbar-expand-sm text-dark navbar-light">
			
			<ul class="navbar-nav">
	    		
	    		<div class="px-5"></div>
	    		<div class="px-5"></div>
	    		<div class="px-5"></div>
	    		<div class="px-5"></div>
	    		
	    		<li class="nav-item active"> 
								
					<a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/img/logo.png" width="180"height="80"></a>
								
				</li>
				
				<li class="nav-item active"> 
					
					<br>
					<h4 class="font-weight-bold">&nbsp로그인</h4>			
								
				</li>
				 
			</ul>
				
		</nav>	
			
	</body>
	
	
</html>
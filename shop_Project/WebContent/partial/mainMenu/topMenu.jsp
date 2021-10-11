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
	
		<nav class="navbar navbar-expand-sm bg-primary navbar-light border-bottom border-primary border-5 justify-content-center">
			
			<ul class="navbar-nav">
	    		
	    		<%
					for(Category c : categoryList){
					
				%>
						<li class="nav-item active text-white"> 
								
							<a class="nav-link text-white" href="#"><%=c.getCategoryName() %></a>
							
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
	    		<div class="px-5"></div>
	    		<div class="px-5"></div>
	    		<div class="px-5"></div>
	    		
	    		
	  		</ul>
	
		</nav>
	
	</body>
	
</html>
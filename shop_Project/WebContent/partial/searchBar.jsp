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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
		<!-- (Optional) Latest compiled and minified JavaScript translation files -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>
		
	</head>

	<body>
		
		<div class="container mt-3">
		
			<div class="row">
	  			
	  			<div class="col-sm-3.5">
					
					<br>
					
					<a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/img/logo.png" width="180"height="80"></a>
				
				</div>
	  			
	  			<div class="col-sm-8">
					
					<br>
					<br>
					
					<div class="input-group mb-3" >
  						
  						<div class="input-group-prepend border border-primary border-5">
    						
    						<div class="pull-right">
    							
    							<h6><small></small></h6>
    							
	    						<select class="selectpicker" data-width="150px">
									
									<option selected="selected">통합검색</option>
									
									<option data-divider="true"></option>
									
								    <%
	      							
	      								for(Category c : categoryList){
	      							%>
	      								
	      									<option><%=c.getCategoryName() %></option>
	      										
	      							<%		
	      							
	      								}
	      							
	      							%>
	      							
	      							<option>리뷰</option>
	      							
	      							<option data-divider="true"></option>
	      							
	      							<option>상세검색</option>
	      							
								</select>
							
							</div>
							
							<div>
							
								<h6><small></small></h6>
								
								<input type="text" class="form-control" aria-label="Text input with dropdown button" size="40">
								
							</div>	
							
							<div class="input-group-append">
							    						
    							<img src="<%=request.getContextPath()%>/img/searchBtn.PNG" height="54" >
  								
  							</div>
									
    					</div>
  						
  					</div>
  					
				</div>
				
			</div>
			
		</div>
		
	</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" import="dao.*" import="vo.*" %>

<%

	request.setCharacterEncoding("utf-8"); //encoding
	int currentPage= 1; 
	
	if(request.getParameter("currentPage") != null){ // currentPage not null
		
		currentPage= Integer.parseInt(request.getParameter("currentPage"));
	}
	
	final int ROW_PER_PAGE = 10; // const
		
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	
	String selected = request.getParameter("slt");
	String text = request.getParameter("text");
	
	//check
	System.out.println(request.getParameter("slt")+"<----------- searchBarAction - slt");
	System.out.println(request.getParameter("text")+"<----------- searchBarAction - text");
	
	EbookDao ebookDao = new EbookDao();
	ArrayList<Ebook> ebookList = ebookDao.selectSearchEbookList(beginRow, ROW_PER_PAGE, selected, text);
	
%>

<!DOCTYPE html>
<html>

	<head>
	
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  		
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
		<!-- (Optional) Latest compiled and minified JavaScript translation files -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>
		
		<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-2520980051100595" crossorigin="anonymous"></script>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
		
	</head>
	
	<body>
		
		<!-- start : topBillBoard include -->
		<div>
					
			<jsp:include page="/partial/topBillBoard.jsp"></jsp:include>
					
		</div>
		<!-- end : topBillBoard include -->
			
		  <!-- start : mainmenu include -->
		<div>
					
			<jsp:include page="/partial/mainMenu/topMenu.jsp"></jsp:include>
					
		</div>
		<!-- end : mainmenu include -->
			
		<!-- start : searchBar include -->
		<div>
					
			<jsp:include page="/partial/searchBar.jsp"></jsp:include>
					
		</div>
		<!-- end : searchBar include -->
		  	
		<!-- start : middlemenu include -->
		<div>
					
			<jsp:include page="/partial/mainMenu/middleMenu.jsp"></jsp:include>
				
		</div>	
		<!-- end : middlemenu include -->
		
		<!-- 여기까지 메뉴바를 가지는 모든 페이지가 동일함. -->
		
		<div class="container-fluid row">
			
			<div class="col-sm-2">
			
				<nav class="nav justify-content-end">
				
					<!-- start : serviceArea include -->
					<div>
			
						<jsp:include page="/partial/categorySideBar.jsp"></jsp:include>
			
					</div>
			
					<!-- end : serviceArea include -->
				
				</nav>
				
			</div>
			
			<div class="col">

				<table class="table table-bordered">
					
					<thead>
						
						<tr>
							
							<th><center>도서이미지</center></th>
							<th><center>도서명</center></th>
							<th><center>작가</center></th>
							<th><center>출판사</center></th>
							<th><center>가격</center></th>
							
						</tr>
					
					</thead>
					
					<tbody>
					
					<%
						
						for (Ebook e : ebookList) {
					
					%>
							<tr>
						
								<td width="200" height="200">
									
									<a href="<%=request.getContextPath()%>/selectEbookOne.jsp?ebookNo=<%=e.getEbookNo()%>"><img src="<%=request.getContextPath() %>/img/<%=e.getEbookImg() %>" width="200" height="200"></a>
								
								</td>
								
								<td>
									
									<br>
									<br>
									<br>
									<br>
									
									<center><%=e.getEbookTitle() %></center>
								
								</td>
								
								<td>
									
									<br>
									<br>
									<br>
									<br>
									
									<center><%=e.getEbookAuthor() %></center>
								
								</td>
								
								<td>
									
									<br>
									<br>
									<br>
									<br>
									
									<center><%=e.getEbookCompany() %></center>
								
								</td>
								
								<td>
									
									<br>
									<br>
									<br>
									<br>
									
									<center><%=e.getEbookPrice() %></center>
								
								</td>
							
							</tr>
					
					<%		
					
					}
			
					%>	
						
					</tbody>
				
				</table>
	
			</div>
			
			<div class="col-sm-2">
			
				need left side bar
			
			</div>
			
		
		</div>

	</body>

</html>
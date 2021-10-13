<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" import="java.util.*" %>

<%

	request.setCharacterEncoding("utf-8"); //encoding
	int currentPage= 1;
	MemberDao memberDao = new MemberDao();
	String pageType = request.getParameter("pageType");
	
	if(request.getParameter("currentPage") != null){ // currentPage not null
		
		currentPage= Integer.parseInt(request.getParameter("currentPage"));
	}
	
	final int ROW_PER_PAGE = 5; // const
		
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	
	EbookDao ebookDao = new EbookDao();
	
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
		
		<div class="row">
			
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
		
			<%
							
				// 1. 인기 상품 목록 조회
				ArrayList<Ebook> popularEbokList = ebookDao.selectPopularEbookList(beginRow, ROW_PER_PAGE);
							
				// 2. 신상품 목록 조회
				ArrayList<Ebook> newEbookList = ebookDao.selectNewEbookList(beginRow, ROW_PER_PAGE);
				
				// 3. 카테고리별 목록 조회
				ArrayList<Ebook> categoryList = ebookDao.selectEbookListByCategory(beginRow, ROW_PER_PAGE, pageType);
							
			%>		
		
			<h2>category</h2>
			<%
			
				if(pageType.equals("best")){
			
			%>		
					<img src="<%=request.getContextPath()%>/img/bestseller.PNG">
					
					<table border="1">
							
						<tr>
							
							<%
							
								int pi=0;
								for(Ebook e : popularEbokList){
							
							%>
							
								<td>
								
									<div>
											
										<a href="<%=request.getContextPath()%>/selectEbookOne.jsp?ebookNo=<%=e.getEbookNo()%>">
												
											<img src="<%=request.getContextPath()%>/img/<%=e.getEbookImg() %>" width="200" height="200">
											
										</a>
										
									</div>
										
									<div><%=e.getEbookTitle()%></div>
										
									<div>₩ <%=e.getEbookPrice()%></div>
								
								</td>
							
							<%
								
								}
							
							%>
							
						</tr>
						
					</table>
					
					
			<%
			
				}else if(pageType.equals("newest")){
			
			%>
			
					<img src="<%=request.getContextPath()%>/img/newest.png">
						
					<table border="1">
							
						<tr>
							
						<%
							
							int pi=0;
							for(Ebook e : newEbookList){
							
						%>
								
								<td>
									
									<div>
											
										<a href="<%=request.getContextPath()%>/selectEbookOne.jsp?ebookNo=<%=e.getEbookNo()%>">
												
											<img src="<%=request.getContextPath()%>/img/<%=e.getEbookImg() %>" width="200" height="200">
											
										</a>
										
									</div>									

									<div><%=e.getEbookTitle()%></div>
									<div>₩ <%=e.getEbookPrice()%></div>
									
								</td>
								
						<%
								
							}
							
						%>
							
						</tr>
						
					</table>
					
				<%		
				
					}else if(pageType.equals("소설")){
				
				%>
						<h1>소설</h1>
						
						<table border="1">
								
							<tr>
								
							<%
								
								int pi=0;
								for(Ebook e : categoryList){
								
							%>
									
									<td>
										
										<div>
												
											<a href="<%=request.getContextPath()%>/selectEbookOne.jsp?ebookNo=<%=e.getEbookNo()%>">
													
												<img src="<%=request.getContextPath()%>/img/<%=e.getEbookImg() %>" width="200" height="200">
												
											</a>
											
										</div>									

										<div><%=e.getEbookTitle()%></div>
										<div>₩ <%=e.getEbookPrice()%></div>
										
									</td>
									
							<%
									
								}
								
							%>
								
							</tr>
							
						</table>
						
				<%		
						
					}else if(pageType.equals("만화")){
				
				%>
				
					<h1>만화</h1>
						
					<table border="1">
								
						<tr>
								
							<%
								
								int pi=0;
								for(Ebook e : categoryList){
								
							%>
									
								<td>
										
									<div>
												
										<a href="<%=request.getContextPath()%>/selectEbookOne.jsp?ebookNo=<%=e.getEbookNo()%>">
													
											<img src="<%=request.getContextPath()%>/img/<%=e.getEbookImg() %>" width="200" height="200">
												
										</a>
											
									</div>									

									<div><%=e.getEbookTitle()%></div>
									<div>₩ <%=e.getEbookPrice()%></div>
										
								</td>
									
							<%
									
								}
								
							%>
								
						</tr>
							
					</table>
					
				<%	
					
					}else if(pageType.equals("여행")){
				
				%>
						<h1>여행</h1>
						
						<table border="1">
									
							<tr>
									
								<%
									
									int pi=0;
									for(Ebook e : categoryList){
									
								%>
										
									<td>
											
										<div>
													
											<a href="<%=request.getContextPath()%>/selectEbookOne.jsp?ebookNo=<%=e.getEbookNo()%>">
														
												<img src="<%=request.getContextPath()%>/img/<%=e.getEbookImg() %>" width="200" height="200">
													
											</a>
												
										</div>									
	
										<div><%=e.getEbookTitle()%></div>
										<div>₩ <%=e.getEbookPrice()%></div>
											
									</td>
										
								<%
										
									}
									
								%>
									
							</tr>
								
						</table>
					
				<%		
						
					}else if(pageType.equals("경제")){
				
				%>
				
						<h1>경제</h1>
						
						<table border="1">
									
							<tr>
									
								<%
									
									int pi=0;
									for(Ebook e : categoryList){
									
								%>
										
									<td>
											
										<div>
													
											<a href="<%=request.getContextPath()%>/selectEbookOne.jsp?ebookNo=<%=e.getEbookNo()%>">
														
												<img src="<%=request.getContextPath()%>/img/<%=e.getEbookImg() %>" width="200" height="200">
													
											</a>
												
										</div>									
	
										<div><%=e.getEbookTitle()%></div>
										<div>₩ <%=e.getEbookPrice()%></div>
											
									</td>
										
								<%
										
									}
									
								%>
									
							</tr>
								
						</table>
					
				<%
					
					}else if(pageType.equals("외국어")){
				
				%>
					
						<h1>외국어</h1>
						
						<div class="col">
						
						<table border="1">
									
							<tr>
									
								<%
									
									int pi=0;
									for(Ebook e : categoryList){
									
								%>
										
									<td>
											
										<div>
													
											<a href="<%=request.getContextPath()%>/selectEbookOne.jsp?ebookNo=<%=e.getEbookNo()%>">
														
												<img src="<%=request.getContextPath()%>/img/<%=e.getEbookImg() %>" width="200" height="200">
													
											</a>
												
										</div>									
	
										<div><%=e.getEbookTitle()%></div>
										<div>₩ <%=e.getEbookPrice()%></div>
											
									</td>
										
								<%
										
									}
									
								%>
									
							</tr>
								
						</table>
				
				<%
						
					}
				
				%>
						
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
								
								for (Ebook e : categoryList) {
							
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
		
		<div class="col-sm-2">
			
			need left side bar
			
		</div>
	
	</body>

</html>
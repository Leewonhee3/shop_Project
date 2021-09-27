<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" import="java.util.*" %>
<%

	//페이지
	int currentPage= 1; 
	if(request.getParameter("currentPage") != null){
		currentPage= Integer.parseInt(request.getParameter("currentPage"));
	}
	final int ROW_PER_PAGE = 10; // 상수 const
		
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	
%>    
<!DOCTYPE html>
<html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	</head>

	<body>
	
		<!-- start : submenu include -->
		<div>
			
			<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
			
		</div>
		<!-- end : submenu include -->	
		<div>
		
		<%
            if(session.getAttribute("loginMember") == null) {
         %>
         		<br>
				<br>		
		
				<div class="container-fluid">
			  
			  		<div class="card bg-dark text-white" style="width:300px">
			    			
			    		<img class="card-img-top" src="<%=request.getContextPath()%>/img/admin.png" alt="Card image" height="350">
			    			
			    		<div class="card-body">
			      			
				      		<h4 class="card-title">비회원</h4>
				      
				    		<p class="card-text">로그인 해주세요</p>
         					
         					<div class="btn-group btn-group-sm">	
				      		
			    				<a href="<%=request.getContextPath() %>/loginForm.jsp" class="btn btn-primary">로그인</a>
			    			
			    			</div>
			    			
			    			<div class="btn-group btn-group-sm">	
				      		
			    				<a href="<%=request.getContextPath() %>/insertMemberForm.jsp" class="btn btn-primary">회원가입</a>
			    			
			    			</div>
         				
               			</div>
               		
               		</div>
               	
               	</div>
         <%      
            }else {
               Member loginMember = (Member)session.getAttribute("loginMember");
            
         %>
         	<br>
			<br>		
		
			<div class="container-fluid">
			  
			  	<div class="card bg-dark text-white" style="width:300px">
			    			
			    	<img class="card-img-top" src="<%=request.getContextPath()%>/img/admin.png" alt="Card image" height="350">
			    			
			    	<div class="card-body">
			      			
				      	<h4 class="card-title"><%=loginMember.getMemberId()%>님</h4>
				      
				    	<p class="card-text">프로필 내용 ~~~~~</p>
				      		
				    <div class="btn-group btn-group-sm">	
				      		
						<a href="#" class="btn btn-primary">회원 정보</a>
				    			
			    	</div>
			   		
			   		<div class="btn-group btn-group-sm">	
				      		
			    		<a href="<%=request.getContextPath() %>/selectOrderListByMember.jsp" class="btn btn-primary">주문 정보</a>
			    			
			    	</div>
			    			
			    	<div class="btn-group btn-group-sm">	
				      		
			    		<a href="<%=request.getContextPath()%>/logout.jsp" class="btn btn-primary">로그아웃</a>
			    			
			    	</div>
				    
				    <%
				    	if(loginMember.getMemberLevel()==1){
				    %>
				    		<br>
				    		<br>
				    		<a href="<%=request.getContextPath()%>/admin/adminIndex.jsp">관리자 페이지</a>
				    
				    <%		
				    	}
				    %>
			    			
				</div>
			  			
			</div>
			  	
		</div>
	<%
        }
	%>
	<!-- product list print -->
	<%
		//all list
		EbookDao ebookDao = new EbookDao();
		ArrayList<Ebook> ebookList = ebookDao.selectEbookList(beginRow, ROW_PER_PAGE);
		
		// populer 5 list
		ArrayList<Ebook> popularEbookList = ebookDao.selectPopularEbookList(beginRow, 5);
		
		// most recent 5 list
		ArrayList<Ebook> newEbookList = ebookDao.selectNewEbookList(beginRow, 5);
		
	%>
		<h2>신간 상품 목록</h2>
		
		<table border="1">
			
			<%
				
				for(Ebook e : newEbookList){
			
			%>
			
			<td>
				
				<div>
					
					<div><a href=""><img src ="<%=request.getContextPath() %>/img/<%=e.getEbookImg() %>" width="200" height="200"></a></div>
					
				</div>
				
				<div><a href=""><%=e.getEbookTitle() %></a></div>
				<div><%=e.getEbookPrice() %></div>
				
			</td>
			
			<%
			
				}
			
			%>
		
		</table>
	
		<h2>인기 상품 목록</h2>
		
		<table border="1">
			
			<%
				
				for(Ebook e : popularEbookList){
			
			%>
			
			<td>
				
				<div>
					
					<div><a href=""><img src ="<%=request.getContextPath() %>/img/<%=e.getEbookImg() %>" width="200" height="200"></a></div>
					
				</div>
				
				<div><a href=""><%=e.getEbookTitle() %></a></div>
				<div><%=e.getEbookPrice() %></div>
				
			</td>
			
			<%
			
				}
			
			%>
		
		</table>
	
	
	
		<h2>전체 상품 목록</h2>
	
		<table border="1">
			
			<tr>
			
			<%
				int i = 0;
				for(Ebook e : ebookList){
			%>
					
					<td>
							
						<div><a href=""><img src ="<%=request.getContextPath() %>/img/<%=e.getEbookImg() %>" width="200" height="200"></a></div>
						<div><a href=""><%=e.getEbookTitle() %></a></div>
						<div>₩<%=e.getEbookPrice() %></div>
						
					</td>
						
			<% 			
			
					i += 1;
					if(i%5 == 0){
			%>
						
						</tr><tr><!-- next line -->
						
			<% 			
					}
				}
			%>
			
			</tr>
		
		</table>
		
		<a href="<%=request.getContextPath()%>/index.jsp?currentPage=<%=currentPage-1%>">이전</a>
		<a href="<%=request.getContextPath()%>/index.jsp?currentPage=<%=currentPage+1%>">다음</a>
	
	
	</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("오류");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
   		return;
	
	} // 세션이 null이거나 레벨이 0인경우 일반 인덱스 페이지로 이동 
%>
<!DOCTYPE html>
<html>

	<head>
	
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
	</head>

	<body class="bg-secondary text-white">
	
		<!-- 관리자 메뉴 include -->
		
		<!-- start : submenu include -->
		<div>
				
			<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
				
		</div>
		<!-- end : submenu include -->
		
		<br>
		<br>		
		
		<div class="row">
			
			<div class="container-fluid col-sm-3">
		  
		  		<div class="card bg-dark text-white" style="width:300px">
		    			
		    		<img class="card-img-top" src="<%=request.getContextPath()%>/img/admin.png" alt="Card image" height="350">
		    			
		    		<div class="card-body">
		      			
			      		<h4 class="card-title"><%=loginMember.getMemberId()%>님</h4>
			      
			      		<p class="card-text">프로필 내용 ~~~~~</p>
			      		
			      		<div class="btn-group btn-group-sm">	
			      		
				      		<a href="#" class="btn btn-primary">프로필 수정</a>
			    			
		    			</div>
		    			
		    			<div class="btn-group btn-group-sm">	
			      		
		    				<a href="#" class="btn btn-primary">회원 정보</a>
		    			
		    			</div>
		    			
		    			<div class="btn-group btn-group-sm">	
				      		
			    		<a href="<%=request.getContextPath()%>/logout.jsp" class="btn btn-primary">로그아웃</a>
			    			
			    		</div>
		    			
		    		</div>
		  			
		  		</div>
		  	
		  	</div>
  		
		  	<table class="table table-dark table-hover col-sm-9" style="width:200px" height="500">
				    
				<tbody>
				    
					<tr>
					      
						<td><br><a href="<%=request.getContextPath()%>/admin/selectMemberList.jsp">회원 관리</a></td>
						<td>회원을 관리하는 기능입니다.</td>
					        
					</tr>
					      
					<tr>
					      
						<td><br><a href="<%=request.getContextPath()%>/admin/selectCategoryList.jsp">전자책 카테고리 관리</a></td>
						<td>전자책 카테고리를 관리하는 기능입니다.</td>
					        
					</tr>
					      
					<tr>
					      
						<td><br><a href="<%=request.getContextPath()%>/admin/selectEbookList.jsp">전자책 관리</a></td>
						<td>전자책을 관리하는 기능입니다.</td>
					        
					</tr>
					
					<tr>
					      
						<td><br><a href="<%=request.getContextPath()%>/admin/">주문 관리</a></td>
						<td>회원 주문을 관리하는 기능입니다.</td>
					        
					</tr>
					      
					<tr>
					      
						<td><br><a href="<%=request.getContextPath()%>/admin/">상품평 관리</a></td>
						<td>상품평을 관리하는 기능입니다.</td>
					        
					</tr>
					
					<tr>
					      
						<td><br><a href="<%=request.getContextPath()%>/admin/">공지게시판 관리</a></td>
						<td>공지게시판을 관리하는 기능입니다.</td>
					        
					</tr>
					
					<tr>
					      
						<td><br><a href="<%=request.getContextPath()%>/admin/">QnA게시판 관리</a></td>
						<td>QnA게시판을 관리하는 기능입니다.</td>
					        
					</tr>
				      
				</tbody>
				    
			</table>
			  	
		</div>
		
		<br>
		<br>
		
		<div>&nbsp<a class="btn btn-primary btn-sm" href="<%=request.getContextPath()%>/index.jsp">메인페이지로 가기</a></div>
		
	</body>
	
</html>
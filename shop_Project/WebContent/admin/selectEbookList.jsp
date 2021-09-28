<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" import="java.util.*"%>
<%@page import="java.net.URLEncoder"%>
<%

	request.setCharacterEncoding("utf-8");

	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("오류");
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			return;
	
	} // 세션이 null이거나 레벨이 0인경우 일반 인덱스 페이지로 이동 방어코드
	
	//카테고리
	String categoryName ="";
	
	if(request.getParameter("categoryName") != null){
		categoryName = request.getParameter("categoryName");
	}
	System.out.println(categoryName+"<-----------selectEbookList - categoryName");
	//페이징
	int currentPage = 1;
	
	if(request.getParameter("currentPage") != null){
		currentPage= Integer.parseInt(request.getParameter("currentPage")); 
	}
	
	final int ROW_PER_PAGE = 10; // 상수 const
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	
	//Ebook 목록 불러오기
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category> categoryList = categoryDao.SelectCategoryListAllByPage(0, 10);
	EbookDao ebookDao = new EbookDao();
	ArrayList<Ebook> ebookList = null;
	String encText = "";
	
	if(categoryName.equals("")==true){
		ebookList = ebookDao.selectEbookList(beginRow, ROW_PER_PAGE); // 카테고리 선택 안하면(전체목록) 리스트 출력
	}else{
		ebookList = ebookDao.selectEbookListByCategory(beginRow, ROW_PER_PAGE, categoryName); //카테고리 선택되면 해당하는 리스트 출력
	}
	
	int lastPage = ebookDao.CountEbookAll(ROW_PER_PAGE, categoryName);

%>

<!DOCTYPE html>
<html>

	<head>
	
		<meta charset="UTF-8">
		<title>Insert title here</title>
	
	</head>
	
	<body>
		
		<div>
			
		<!-- partial폴더에 관리자 메뉴 getContext 사용하면 오류남 이유는 추후 해결해야 할듯 9/23-->
			<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
			
		</div>
		 <!-- 관리자 메뉴 인클루드 끝 -->
   
		<h1>[전자책 관리]</h1>
   
		<form action="<%=request.getContextPath()%>/admin/selectEbookList.jsp" method="get">
	      
			<select name="categoryName">
	         
				<option value="">전체목록</option>
				
				<%
				
				for(Category c : categoryList) {
				
				%>
					
					<option value="<%=c.getCategoryName()%>"><%=c.getCategoryName()%></option>
				
				<%      
				
				}
				
				%>
	      		
			</select>
				
			<button type="submit">조회</button>
				
		</form>
		
		<div>
			
			<!-- 전자책 목록 출력 : 카테고리별 출력 -->
			<table border="1">
			
			<%	
				
				for(Ebook e : ebookList) {
			
			%>
				
					<tr>
						
						<td><%=e.getEbookNo() %></td>
						<td><%=e.getCategoryName() %></td>
						<td><a href="<%=request.getContextPath()%>/admin/selectEbookOne.jsp?ebookNo=<%=e.getEbookNo()%>"><%=e.getEbookTitle() %></a></td>
						<td><%=e.getEbookState() %></td>
					
					</tr>
			
			<%
				}
			%>
			
			</table>
				
		</div>
		
		<div>
			<%
				
				if(currentPage==1){
			
			%>
					
					<a class="btn btn-warning" href="<%=request.getContextPath()%>/admin/selectEbookList.jsp?currentPage=<%=currentPage+1%>&categoryName=<%=categoryName%>">다음</a>
			
			<%
				
				}else if(currentPage==lastPage){
			
			%>
					
					<a class="btn btn-warning" href="<%=request.getContextPath()%>/admin/selectEbookList.jsp?currentPage=<%=currentPage-1%>&categoryName=<%=categoryName%>">이전</a>
			
			<%		
				
				}else{
			
			%>		
					
					<a class="btn btn-warning" href="<%=request.getContextPath()%>/admin/selectEbookList.jsp?currentPage=<%=currentPage-1%>&categoryName=<%=categoryName%>">이전</a>
					<a class="btn btn-warning" href="<%=request.getContextPath()%>/admin/selectEbookList.jsp?currentPage=<%=currentPage+1%>&categoryName=<%=categoryName%>">다음</a>
			
			<%		
				
				}
					
				System.out.println(currentPage+"admin/selectEbookList - currentPage"); // 현재 페이지 확인
			
			%>
				
			<div>
				
				<a class="btn btn-warning" href="<%=request.getContextPath()%>/admin/adminIndex.jsp">뒤로가기</a>
			
			</div>
			
		</div>
		
	</body>
	
</html>
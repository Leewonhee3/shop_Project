<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" import= "dao.*" import = "java.util.*" %>
<%
	request.setCharacterEncoding("utf-8"); //encode
	
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("오류");
  		response.sendRedirect(request.getContextPath()+"/index.jsp");
   		return;
	
	} // 세션이 null이거나 레벨이 0인경우 일반 인덱스 페이지로 이동 방어코드
	
	//검색어
	String searchMemberId="";
	
	if(request.getParameter("searchMemberId") != null){
		searchMemberId = request.getParameter("searchMemberId");
	}
	System.out.println(searchMemberId + "<--------selectMemberList - searchMemberId");
	
	//페이지
	int currentPage= 1; 
	if(request.getParameter("currentPage") != null){
		currentPage= Integer.parseInt(request.getParameter("currentPage"));
	}
	final int ROW_PER_PAGE = 10; // 상수 const
	
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	
	//회원목록 
	
	MemberDao memberDao = new MemberDao();
	ArrayList<Member>memberList = null;
	
	if(searchMemberId.equals("") == true){ //검색내용이 없으면 리스트 출력
		memberList = memberDao.SelectMemberListAllByPage(beginRow, ROW_PER_PAGE);
	}else{
		memberList = memberDao.SelectMemberListAllBySearchMemberId(beginRow, ROW_PER_PAGE, searchMemberId); // 검색어가 있으면 해당하는 리스트 출력
		
	}
	
	
	int lastPage = memberDao.CountMemberAll(ROW_PER_PAGE,searchMemberId);
%>    
<!DOCTYPE html>
<html>
	<head>
	
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
	</head>

	<body>
	
		<div>
			<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
		</div>
		
		<h1>회원 목록</h1>
		<table border="1">
			<thead>
				
				<tr>
				
					<th>memberNo</th>
					<th>memberLevel</th>
					<th>memberName</th>
					<th>memberAge</th>
					<th>memberGender</th>
					<th>updateDate</th>
					<th>createDate</th>
					<th>회원등급</th>
					
				</tr>
				
			</thead>
			
			<tbody>
			
				<%
	
					System.out.println(memberList.size()+"<------ selectMember - list size check"); // 반환되어 저장된 값 확인
					for(Member m : memberList){
				%>
						<tr>
						
							<td><%=m.getMemberNo() %></td>
							<td><%=m.getMemberLevel() %></td>
							<td><%=m.getMemberName() %></td>
							<td><%=m.getMemberAge() %></td>
							<td><%=m.getMemberGender() %></td>
							<td><%=m.getUpdateDate() %></td>
							<td><%=m.getCreateDate() %></td>
							
							<td>
								<%
									if(m.getMemberLevel() == 0){
								%>
										<span>일반회원</span>
								<%
									}else if(m.getMemberLevel() == 1){
								%>
										<span>관리자</span>
								<%		
									}
								%>
							</td>
							
						</tr>
				<%
					}	
				%>		
				
				<div>
					
					<!-- 멤버 아이디로 검색 -->
					<form action="<%=request.getContextPath() %>/admin/selectMemberList.jsp" method="get">
					
						memberId : 
						<input type="text" name="searchMemberId">
						
						<button type="submit">검색</button>
						
					</form>
					
				</div>
				
			</tbody>
			
		</table>
		
		<div>
			<%
				if(currentPage==1){
					//검색후 페이징 하면 안됨
			%>
					<a class="btn btn-warning" href="<%=request.getContextPath()%>/admin/selectMemberList.jsp?currentPage=<%=currentPage+1%>&searchMemberId=<%=searchMemberId%>">다음</a>
			<%
				}else if(currentPage==lastPage){
			%>
					<a class="btn btn-warning" href="<%=request.getContextPath()%>/admin/selectMemberList.jsp?currentPage=<%=currentPage-1%>&searchMemberId=<%=searchMemberId%>">이전</a>
			<%		
				}else{
			%>		
					<a class="btn btn-warning" href="<%=request.getContextPath()%>/admin/selectMemberList.jsp?currentPage=<%=currentPage-1%>&searchMemberId=<%=searchMemberId%>">이전</a>
					<a class="btn btn-warning" href="<%=request.getContextPath()%>/admin/selectMemberList.jsp?currentPage=<%=currentPage+1%>&searchMemberId=<%=searchMemberId%>">다음</a>
			<%		
				}
					
				System.out.println(currentPage+"admin/selectMemberList - currentPage"); // 현재 페이지 확인
			%>
		
		
			<div><a class="btn btn-warning" href="<%=request.getContextPath()%>/admin/adminIndex.jsp">뒤로가기</a></div>
		
		</div>
		
	</body>
	
</html>
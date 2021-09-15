<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" import= "dao.*" import = "java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("오류");
  		response.sendRedirect(request.getContextPath()+"/index.jsp");
   		return;
	
	} // 세션이 null이거나 레벨이 0인경우 일반 인덱스 페이지로 이동 
	
	int currentPage= 1; 
	if(request.getParameter("currentPage") != null){
		currentPage= Integer.parseInt(request.getParameter("currentPage"));
	}
	final int ROW_PER_PAGE = 10; // 상수 const
	
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	int lastPage = 10;
	MemberDao memberDao = new MemberDao();
	ArrayList<Member>memberList = new ArrayList<Member>();
	memberList = memberDao.SelectMemberListAllByPage(beginRow, ROW_PER_PAGE);
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
					<th></th>
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
				
					if(currentPage==1){
				%>		
						<a class="btn btn-warning" href="<%=request.getContextPath()%>/admin/selectMemberList.jsp?currentPage=<%=currentPage+1%>">다음</a>
				<%
					}else if(currentPage==lastPage){
				%>
						
						<a class="btn btn-warning" href="<%=request.getContextPath()%>/admin/selectMemberList.jsp?currentPage=<%=currentPage-1%>">이전</a>
				<%		
					}else{
				%>		
						<a class="btn btn-warning" href="<%=request.getContextPath()%>/admin/selectMemberList.jsp?currentPage=<%=currentPage-1%>">이전</a>
						<a class="btn btn-warning" href="<%=request.getContextPath()%>/admin/selectMemberList.jsp?currentPage=<%=currentPage+1%>">다음</a>
				<%		
					}
				%>
				
				
				
			</tbody>
			
		</table>
		
	</body>
	
</html>
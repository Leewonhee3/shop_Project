<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" import= "dao.*" import = "java.util.*" %>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>

	</head>

	<body>
			
		<% 
			request.setCharacterEncoding("utf-8");
			Member member = new Member();
			MemberDao memberDao = new MemberDao();
			member.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
			member = memberDao.selectMemberOne(member);
			
			System.out.println(member.getMemberNo()+"<----updateMemberLevelForm - getMemberNo"); //확인
			System.out.println(member.getMemberId()+"<----updateMemberLevelForm - getMemberId");
			System.out.println(member.getMemberName()+"<----updateMemberLevelForm - getMemberName");
			System.out.println(member.getMemberLevel()+"<----updateMemberLevelForm - getMemberLevel");
			
		%>
		
		<h1>등급 수정</h1>
		
		
		<form method="post" action="./updateMemberLevelAction.jsp">
		
				<!-- 변경할 등급 입력 -->
				<div>memberLevel: </div>
				
				<%
					if(member.getMemberLevel()==0){ //일반회원인 경우
				%>
						<select name="memberLevel">
					
							<option value="0">일반회원</option>
							<option value="1">관리자</option>
						
						</select>
				<%
					}else if(member.getMemberLevel()==1){ // 관리자인경우
				%>
						<select name="memberLevel">
					
							<option value="1">관리자</option>
							<option value="0">일반회원</option>
						
						</select>
				<%		
					}
				%>
					
				<div><input type = "text" name="memberNo" readonly ="readonly" value = "<%=member.getMemberNo()%>"></div>
				<div><input type = "text" name="memberId" readonly ="readonly" value = "<%=member.getMemberId()%>"></div>
				<div><input type = "text" name="memberName" readonly ="readonly" value = "<%=member.getMemberName()%>"></div>
				
				<button type= "submit">등급수정</button>
			
			</form>	
			
	</body>
	
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8"); //인코딩	
	//인증 방어 코드 : 로그인 전 session.getAttribute("loginMember") == null 인 경우
	if(session.getAttribute("loginMember")!=null){
		System.out.println("이미 로그인 되어 있음");
		response.sendRedirect("./index.jsp"); //로그인 되면 회원가입 하면 안됨
		return;
	}
%> 
<html>

	<head>
	
		<meta charset="UTF-8">
		<title>메인화면</title>
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
		
		<h1>회원가입</h1>
		
		<%
			request.setCharacterEncoding("utf-8"); //인코딩
			String insertId ="";//체크된 아이디가 중복인 경우 공백을 id vaule에 넣는다.
			String memberIdCheck = "";
			if(request.getParameter("memberIdCheck") != null){ // 체크할 아이디가 입력된 경우
				memberIdCheck = request.getParameter("memberIdCheck"); // 실행
			}
			
			
		%>
		<%
			if(request.getParameter("idCheckResult")==null){
				insertId=request.getParameter("memberIdCheck");
		%>
				<div>id is available</div> <!-- null인경우 사용가능한 아이디 -->
		<%		
			}else{
		%>
				<div><%=request.getParameter("idCheckResult") %></div> <!-- 이미 사용중인 아이디 -->
		<% 		
			}
		
			if(insertId == null){ // null인경우 공백 입력
			
				insertId="";
				
			}
		
		%>
		
		
		
		
		
		<!-- 멤버 아이디가 사용가능한지 확인하는 폼, 사용가능한 아이디면 id에 입력 중복아이디면 공백-->
		<form action="<%=request.getContextPath() %>/selectMemberIdCheckAction.jsp" method="post">
			
			<div>
			
				memberId : 
				<input type="text" name="memberIdCheck">
				<button type = "submit">duplicate check</button>
			
			</div>
		
		</form>
		
		
		
		<!-- 회원가입 폼 -->
		
		<form method="post" action="<%=request.getContextPath() %>/insertMemberAction.jsp" id="joinForm">
		
			<!-- 아이디 -->
			<div>memberId: </div>
			<div><input type = "text" name="memberId" id="memberId" readonly="readonly" value="<%=insertId%>"></div>
			
			<!-- 패스워드 -->
			<div>memberPw: </div>
			<div><input type = "password" name="memberPw" id= "memberPw" value=""></div>
			
			<!-- 이름 -->
			<div>memberName: </div>
			<div><input type = "text" name="memberName" id="memberName" value=""></div>
				
			<!-- 나이 -->
			<div>memberAge: </div>
			<div><input type = "text" name="memberAge" id="memberAge" value=""></div>
				
			<!-- 성별 -->
			<div>memberGender: </div>
				
			<div>
				
				<input type = "radio" name="memberGender" class="memberGender" value = "남">남
				<input type = "radio" name="memberGender" class="memberGender" value = "여">여
			
			</div>
			
			<button type= "button" id="btn">회원가입</button>
			
		</form>
		
		<script>
		
			$("#btn").click(function(){
				
				if($("#memberId").val() == ''){
					alert("memberId empty");
					return;
				}
				
				if($("#memberPw").val() == ''){
					alert("memberPw empty");
					return;
				}
				
				if($("#memberName").val() == ''){
					alert("memberName empty");
					return;
				}
				
				if($("#memberAge").val() == ''){
					alert("memberAge empty");
					return;
				}
				
				let memberGedner = $('.memberGender:checked'); // . 클래스속성으로 부르면 리턴값은 배열
			    if(memberGedner.length == 0) {
			    	alert('memberGender를 선택하세요');
			        return;
			    }
			         
			    $('#joinForm').submit();
			    
			});

		
		</script>	

	</body>

</html>
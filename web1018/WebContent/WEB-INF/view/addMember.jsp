<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		
		<script>
	
			$(document).ready(function(){
				$('#addbtn').click(function(){
					
					if($('#memberId').val()==""){
						
						alert('id를 입력하세요');
						return;
						
					}else if($('#memberPw').val()==""){
							
						alert('pw를 입력하세요');
						return;
							
					}else if($('#memberName').val()==""){
						
						alert('name를 입력하세요');
						return;
						
					}else if($('#city').val()==""){
						
						alert('city를 입력하세요');
						return;
						
					}else if($('#addr').val()==""){
						
						alert('addr를 입력하세요');
						return;
						
					}
						
					$('#addForm').submit();
					
				});
				
			});
	
		</script>
		
		
	</head>

	<body>

		<h1>회원가입</h1>
	
		<form method="post" action="${pageContext.request.contextPath}/addMember" id="addForm">
	
			<div>
			
				memberId:
				<input type="text" name="memberId" id="memberId">
			
			</div>	
			
			<div>
			
				memberPw:
				<input type="password" name="memberPw" id="memberPw">
			
			</div>
			
			<div>
			
				memberName:
				<input type="text" name="memberName" id="memberName">
			
			</div>	
			
			<div>
			
				memberCity:
				<input type="text" name="city" id="city">
			
			</div>	
			
			<div>
			
				memberAddr:
				<input type="text" name="addr" id="addr">
			
			</div>	
			
			<div>
			
				<button type="button" id="addbtn">회원가입</button>
			
			</div>
		
		</form>	
		
	</body>

</html>
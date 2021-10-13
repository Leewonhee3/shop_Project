<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
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
			
		<!-- start : serviceArea include -->
		<div>
		
			<jsp:include page="/partial/serviceArea.jsp"></jsp:include>
		
		</div>
		
		<!-- end : serviceArea include -->
	
	</body>
	
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test page</h1>

	<!-- start : submenu include -->
		<div>
			
			<jsp:include page="<%=request.getContextPath() %>/partial/submenu.jsp"></jsp:include>
			
		</div>
		<!-- end : submenu include -->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" import="java.util.*" %>

<%

	MemberDao memberDao = new MemberDao();
	NoticeDao noticeDao = new NoticeDao();
	ArrayList<Notice> noticeList = noticeDao.selectNoticeNewest();

%>

<!DOCTYPE html>
<html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	</head>

	<body>
		
		<div class="container p-3 my-3 border">
			<!-- 상품 목록 -->
					
					<%
					
						// 0-3. 페이지 번호 확인
						int currentPage = 1;
						if(request.getParameter("currentPage") != null) { 
							currentPage = Integer.parseInt(request.getParameter("currentPage"));
						}
						
						// 0-4. 선택된 ebook 카테고리 확인
						String ebookCategory = "";
						if(request.getParameter("ebookCategory") != null) {
							ebookCategory = request.getParameter("ebookCategory");
						}
						
						// 1-1. 한 페이지당 보여줄 값 설정(상수)
						final int ROW_PER_PAGE = 5;
						// 1-2. 보여줄 시작 페이지 번호 설정
						int beginRow = (currentPage-1)*ROW_PER_PAGE;
						
						// 2. 전체 상품 목록 조회 메서드 실행
						EbookDao ebookDao = new EbookDao();
						ArrayList<Ebook> ebookList = ebookDao.selectEbookList(currentPage, ROW_PER_PAGE);
						
						// 3. 인기 상품 목록 조회
						ArrayList<Ebook> popularEbokList = ebookDao.selectPopularEbookList(beginRow, ROW_PER_PAGE);
						
						// 4. 신상품 목록 조회
						ArrayList<Ebook> newEbookList = ebookDao.selectNewEbookList(beginRow, ROW_PER_PAGE);
						
					%>
					
					<h2>신상품 목록</h2>
					
					<table border="1">
						
						<tr>
						
						<%
						
							int pi=0;
							for(Ebook e : newEbookList){
						
						%>
							
							<td>
							
									<div><img src="<%=request.getContextPath()%>/image/<%=e.getEbookImg() %>" width="200" height="200"></div>
									<div><%=e.getEbookTitle()%></div>
									<div>₩ <%=e.getEbookPrice()%></div>
							
							</td>
						
						<%
							
							}
						
						%>
						
						</tr>
					
					</table>
					
					<h2>인기 상품 목록</h2>
					
					<table border="1">
						
						<tr>
						
						<%
						
							pi=0;
							for(Ebook e : popularEbokList){
						
						%>
						
							<td>
							
									<div>
										
										<a href="<%=request.getContextPath()%>/selectEbookOne.jsp?ebookNo=<%=e.getEbookNo()%>">
											
											<img src="<%=request.getContextPath()%>/image/<%=e.getEbookImg() %>" width="200" height="200">
										
										</a>
									
									</div>
									
									<div><%=e.getEbookTitle()%></div>
									
									<div>₩ <%=e.getEbookPrice()%></div>
							
							</td>
						
						<%
							
							}
						
						%>
						
						</tr>
					
					</table>
					
					<h2>전체 상품 목록</h2>
					
					<table border="1">
						
						<tr>
						
						<%
							
							pi=0;
							for(Ebook e : ebookList){
						
						%>
							
							<td>
									<div><img src="<%=request.getContextPath()%>/image/<%=e.getEbookImg() %>" width="200" height="200"></div>
									<div><%=e.getEbookTitle()%></div>
									<div>₩ <%=e.getEbookPrice()%></div>
							</td>
							
						<%
						
								pi+=1;
								if(pi%5 == 0){
						
						%>
						
									<tr></tr><!-- 줄바꿈 -->
						
						<%
						
								}
							}
						
						%>
						
						</tr>
						
					</table>
					
					<%
					
					// 6-1. 총 ebook의 수
					int totalCount = ebookDao.totalEbookCount(ebookCategory);
					System.out.println(" [Debug] totalCount : \""+totalCount +"\" | index.jsp | RETRUNED BY ebookDao.totalEbookCount()");
					
					// 6-2. 마지막 페이지 수
					int lastPage = totalCount / ROW_PER_PAGE;
					if(totalCount % ROW_PER_PAGE != 0) {
						lastPage+=1;
					}
					System.out.println(" [Debug] lastPage : \""+lastPage +"\" | index.jsp");
					
					// 6-3. 화면에 보여질 페이지 번호의 갯수
					int displayPage = 10;
					
					// 6-4. 화면에 보여질 시작 페이지 번호
					int startPage = ((currentPage - 1) / displayPage) * displayPage + 1;
					System.out.println(" [Debug] startPage : \""+startPage +"\" | index.jsp");
					
					// 6-5. 화면에 보여질 마지막 페이지 번호
					int endPage = startPage + displayPage - 1;
					System.out.println(" [Debug] endPage : \""+endPage +"\" | index.jsp");
					
					
					// 6-6. 이전 버튼 출력
					if(startPage > displayPage){
					%>
						<a href="<%=request.getContextPath()%>/index.jsp?currentPage=<%=startPage-displayPage%>">이전</a>
					<%
					}
				
					// 6-7. 페이지 번호 버튼
					for(int i=startPage; i<=endPage; i++) {
						
						if(i<lastPage){
					
						%>
					
							<a href="<%=request.getContextPath()%>/index.jsp?currentPage=<%=i%>"><%=i%></a>
					
						<%
						
						}else if(endPage>lastPage){
						
							%>
							
								<a href="<%=request.getContextPath()%>/index.jsp?currentPage=<%=i%>"><%=i%></a>
					
							<%	
					
								break;
					
							}
					
						}
					
						// 6-8. 다음 버튼
						if(endPage < lastPage){
					
						%>
							
							<a href="<%=request.getContextPath()%>/index.jsp?currentPage=<%=startPage+displayPage%>">다음</a>
					
						<%
					
						}
					
						%>
					
				</div>
				
				<h2>공지사항</h2>
				
				<table border="1">
					
					<thead>
							
						<tr>
							
							<th>게시번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
								
						</tr>
						
					</thead>
						
					<tbody>
							
						<%
								
							for(Notice n : noticeList){
							
						%>
							
								<tr>
									
									<td><%=n.getNoticeNo() %></td>
									<td width ="500"><a href="<%=request.getContextPath() %>/selectNoticeOne.jsp?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a></td>
									<td><%=memberDao.selectMemberConvertName(n.getMemberNo()) %></td>
									<td><%=n.getCreateDate() %></td>
									
								</tr>
							
						<% 
									
							}
						%>
							
					</tbody>
					
				</table>
			
		</div>
		
	</body>
	
</html>
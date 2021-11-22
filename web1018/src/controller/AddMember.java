package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commons.DBUtil;
import dao.MemberDao;
import service.MemberService;
import vo.Member;

@WebServlet("/addMember")
public class AddMember extends HttpServlet {
	
	//get으로 요청이 들어오면 실행, 입력용
	@Override   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/WEB-INF/view/addMember.jsp").forward(request, response);

	}
	
	//post으로 요청이 들어오면 실행, 입력액션용
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("AddMember.doPost()실행");
		request.setCharacterEncoding("utf-8");
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		String memberName = request.getParameter("memberName");
		String city = request.getParameter("city");
		String addr = request.getParameter("addr");
		
		Member member = new Member();
		
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		member.setMemberName(memberName);
		member.setCity(city);
		member.setAddr(addr);
		
		System.out.println(member);
		
		MemberService memberService = new MemberService();
		
		memberService.addMember(member);
		
		// 새로운 요청
		response.sendRedirect(request.getContextPath()+"/login");
		
	}

}

//모델2(MVC)
//c -> sendRedirect 모델1
//c+v
//c+m -> sendRedirect
// c+m+v

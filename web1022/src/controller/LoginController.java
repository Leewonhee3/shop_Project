package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;
import vo.Member;

@WebServlet("/Login")
public class LoginController extends HttpServlet {
	
	private MemberService memberService;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		//login 权其捞瘤
		request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//login 咀记
		memberService = new MemberService();
		//Member member = new Member();
		//memberService.login(null);
		System.out.println("AddMember.doPost()角青");
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
		
		memberService.login(member);

		request.setAttribute("loginId","");
		
		response.sendRedirect(request.getContextPath()+"/login");
		
		
		
	}

}

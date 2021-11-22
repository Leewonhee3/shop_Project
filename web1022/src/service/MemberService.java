package service;

import java.sql.Connection;
import java.sql.SQLException;

import commons.DBUtil;
import dao.*;
import vo.*;

public class MemberService {
	
	private MemberDao memberDao;
	
	public Member login(Member member) {
		Member loginMember = null;
		Connection conn = null;
		
		try {
			
			conn = DBUtil.getConnection("jdbc:mariadb://127.0.0.1:3306/todo", "root", "java1004");
			memberDao = new MemberDao();
			loginMember = memberDao.login(conn, member);
				
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}finally {
			
			try {
				
				conn.close();
			
			}catch(SQLException e) {
			
					e.printStackTrace();
				
			}
			
		}
		
		return loginMember;
		
	}
	
}

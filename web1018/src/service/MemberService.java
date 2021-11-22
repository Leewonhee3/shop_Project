package service;

import java.sql.Connection;
import java.sql.SQLException;

import commons.DBUtil;
import dao.MemberDao;
import vo.Member;

public class MemberService {

	public void addMember(Member member) {
		
		MemberDao memberDao = new MemberDao();
		
		//트랜잭션 처리 필요함.
		
		//서블릿의 역할은 단순하게 요청받고 새로운 요청하는 역할 
		// 컨트롤러는 요청을 전처리하여 요청처리 로직을 호출하고 뷰를 포워딩 or 다른 요청(리다이렉트)을 호출하는 역할
		// -> 컨트롤러에 커넥션 핸들링 로직이 구현됨 -> 이 로직을 제거해야함 -> 모델패키지가 해야 할일
		
		Connection conn = null;
		
		try {
			
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			
			//트랜젝션1
			memberDao.insertMember(conn,member);
			
			//트랜젝션2
			memberDao.insertAddress(conn,member);

			conn.commit();
			
		}catch(Exception e) {
			
			try {
				
				conn.rollback();
				e.printStackTrace();
				
			}catch(SQLException e1) {
				
				e1.printStackTrace();
				
			}
			
		}finally {
			
			try {
				
				conn.close();
				
			}catch(SQLException e) {
				
				e.printStackTrace();
			}
		
		}
		
	}
	
}

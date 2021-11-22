package service;

import java.sql.Connection;
import java.sql.SQLException;

import commons.DBUtil;
import dao.MemberDao;
import vo.Member;

public class MemberService {

	public void addMember(Member member) {
		
		MemberDao memberDao = new MemberDao();
		
		//Ʈ����� ó�� �ʿ���.
		
		//������ ������ �ܼ��ϰ� ��û�ް� ���ο� ��û�ϴ� ���� 
		// ��Ʈ�ѷ��� ��û�� ��ó���Ͽ� ��ûó�� ������ ȣ���ϰ� �並 ������ or �ٸ� ��û(�����̷�Ʈ)�� ȣ���ϴ� ����
		// -> ��Ʈ�ѷ��� Ŀ�ؼ� �ڵ鸵 ������ ������ -> �� ������ �����ؾ��� -> ����Ű���� �ؾ� ����
		
		Connection conn = null;
		
		try {
			
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			
			//Ʈ������1
			memberDao.insertMember(conn,member);
			
			//Ʈ������2
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

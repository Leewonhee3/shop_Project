package dao;

import java.sql.*;

import commons.DBUtil;
import vo.Member;


public class MemberDao {
	
	public void insertMember(Connection conn, Member member) throws SQLException {
		
		PreparedStatement stmt = null;
		
		try {
			
			//Ʈ������ó��
			// 1)������ Ŀ�ؼ� ���
			
			// 2) ����Ŀ��  false
			
			stmt = conn.prepareStatement("insert into member(member_id,member_pw,member_name) values(?,?,?)");
			stmt.setString(1, member.getMemberId());
			stmt.setString(2, member.getMemberPw());
			stmt.setString(3, member.getMemberName());
			stmt.executeUpdate();
			System.out.println("member �Է¼���");
			//conn.commit();// setAuto�� true�϶��� �ʿ� ���� �ڵ�. �ΰ��� ��� Ŀ���Ҳ��ϱ� �ѹ���.
			
			// 3) �ΰ��� ����� �Ϸ�Ǹ� Ŀ��
			
			//conn.commit();// stmt, stmt2�� ���� �߻��ϸ� Ŀ�Ա��� ���� �ʰ� ����Ǵ� ���⿡ ���� ���� �ȵ�
			
			// �ϳ��� �޼ҵ尡 �������� �䱸������ ó�� -> Ʈ�������� �����ϸ鼭 �޼ҵ带 �и�
			
		}finally {
			
			try {
				stmt.close();
				
			}catch(SQLException e){
				
				e.printStackTrace();
				
			}
		}
		
	}
	
	public void insertAddress(Connection conn, Member member) throws SQLException {
		
		PreparedStatement stmt = null;
		
		try {
		
			stmt = conn.prepareStatement("insert into address(member_id,city,addr) values(?,?,?)");
			stmt.setString(1, member.getMemberId());
			stmt.setString(2, member.getCity());
			stmt.setString(3, member.getAddr());
			stmt.executeUpdate();
		
		}finally {
			
			try {
				stmt.close();
				
			}catch(SQLException e){
				
				e.printStackTrace();
				
			}
		}
		
	}
	
}

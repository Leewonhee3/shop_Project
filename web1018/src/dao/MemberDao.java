package dao;

import java.sql.*;

import commons.DBUtil;
import vo.Member;


public class MemberDao {
	
	public void insertMember(Connection conn, Member member) throws SQLException {
		
		PreparedStatement stmt = null;
		
		try {
			
			//트랜젝션처리
			// 1)동일한 커넥션 사용
			
			// 2) 오토커밋  false
			
			stmt = conn.prepareStatement("insert into member(member_id,member_pw,member_name) values(?,?,?)");
			stmt.setString(1, member.getMemberId());
			stmt.setString(2, member.getMemberPw());
			stmt.setString(3, member.getMemberName());
			stmt.executeUpdate();
			System.out.println("member 입력성공");
			//conn.commit();// setAuto가 true일때는 필요 없는 코드. 두개를 묶어서 커밋할꺼니까 한번만.
			
			// 3) 두개의 명령이 완료되면 커밋
			
			//conn.commit();// stmt, stmt2가 예외 발생하면 커밋까지 오지 않고 종료되니 여기에 쓰면 실행 안됨
			
			// 하나의 메소드가 여러개의 요구사항을 처리 -> 트랜젝션을 유지하면서 메소드를 분리
			
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

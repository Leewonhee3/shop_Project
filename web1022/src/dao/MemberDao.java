package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.*;

public class MemberDao {
	
	public Member login(Connection conn, Member paramMember) throws SQLException {
		
		Member returnMember = null;
		String sql="SELECT member_id memberId FROM member WHERE member_id = ? AND member_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);//dao는 stmt만 사용하고 conn은 관여하지 않는다.
		
		stmt.setString(1, paramMember.getMemberId());
		stmt.setString(2, paramMember.getMemberPw());
		
		ResultSet rs = stmt.executeQuery();
		
		
		if(rs.next()) {
			
			Member loginMember = new Member();
			loginMember.setMemberId(rs.getString("memberId"));
			
		}
		
		return returnMember;
	
	}
	
}

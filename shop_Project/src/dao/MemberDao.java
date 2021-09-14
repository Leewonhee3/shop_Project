package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import commons.DBUtil;
import vo.Member;

public class MemberDao {
	
	public void insertMember(Member member) throws SQLException, ClassNotFoundException {
		DBUtil dbutil = new DBUtil();
		int check = 0; //실행성공 여부 확인 
		System.out.println(member.getMemberId()+"<------dao.insertMember - memberId");
		System.out.println(member.getMemberPw()+"<------dao.insertMember - memberPw");
		System.out.println(member.getMemberName()+"<------dao.insertMember - memberName");
		System.out.println(member.getMemberAge()+"<------dao.insertMember - memberAge");
		System.out.println(member.getMemberGender()+"<------dao.insertMember - memberGender");
		//파라미터 확인
		Connection conn = dbutil.getConnection();
		String sql ="INSERT INTO member(member_id, member_pw, member_level, member_name, member_age, member_gender, update_date, creat_date) VALUES(?,PASSWORD(?),0,?,?,?,NOW(),NOW())";
		//DB컬럼명 creat_date e 하나 빼먹음
		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setString(1,member.getMemberId()); // 아이디
		stmt.setString(2,member.getMemberPw()); // 비밀번호
		stmt.setString(3,member.getMemberName()); // 이름
		stmt.setInt(4, member.getMemberAge()); // 나이
		stmt.setString(5, member.getMemberGender()); //성별		
		
		System.out.println(stmt+"<------dao.insertMember - stmt"); //쿼리 및 파라미터 확인
		check = stmt.executeUpdate(); // 확인용
		if(check == 1) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		stmt.close();
		conn.close();
		
		return;
		
		/*INSERT INTO member
		 * member_id, 
		 * member_pw, 
		 * member_level, 
		 * member_name, 
		 * member_age, 
		 * member_gender, 
		 * update_date, 
		 * create_date
		 * )VALUES(
		 * ?, PASSWORD(?), 0, ?, ?,,?, NOW(), NOW()
		 * )
		 */
		
		
	}
	
	public Member login(Member member) throws SQLException, ClassNotFoundException {
		Member returnMember = null;
		DBUtil dbUtil = new DBUtil();
		System.out.println(member.getMemberId()+"<--- dao.login  - memberId");
		System.out.println(member.getMemberPw()+"<--- dao.login  - memberPw");
		//파라미터 확인
		Connection conn = dbUtil.getConnection();
		String sql ="SELECT member_no memberNo, member_id memberId,member_name memberName, member_level memberLevel FROM member WHERE member_id=? AND member_pw=PASSWORD(?);";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId()); //아이디
		stmt.setString(2, member.getMemberPw()); //패스워드

		System.out.println(stmt+"<--- dao.login - stmt"); //쿼리 및 파라미터 확인

		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			returnMember = new Member();
			returnMember.setMemberNo(rs.getInt("memberNo")); //넘버 int
			returnMember.setMemberId(rs.getString("memberId")); //아이디 String
			returnMember.setMemberName(rs.getString("memberName")); // 이름 String
			returnMember.setMemberLevel(rs.getInt("memberNo")); // 레벨 int
			System.out.println("login ok");
			rs.close();
			stmt.close();
			conn.close();
			
			return returnMember; // 로그인 성공시 아이디 이름 레벨 반환 실패시 null
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return returnMember; // 로그인 성공시 아이디 이름 레벨 반환 실패시 null
		
		
		/*SELECT member_no memberNo, 
		 * member_id memberId, 
		 * member_level memberLevel
		 * FROM
		 * member
		 * WHERE member_id=? AND member_pw=?
		 * */
		
	}

}

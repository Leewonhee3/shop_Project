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
		int check = 0; //���༺�� ���� Ȯ�� 
		System.out.println(member.getMemberId()+"<------dao.insertMember - memberId");
		System.out.println(member.getMemberPw()+"<------dao.insertMember - memberPw");
		System.out.println(member.getMemberName()+"<------dao.insertMember - memberName");
		System.out.println(member.getMemberAge()+"<------dao.insertMember - memberAge");
		System.out.println(member.getMemberGender()+"<------dao.insertMember - memberGender");
		//�Ķ���� Ȯ��
		Connection conn = dbutil.getConnection();
		String sql ="INSERT INTO member(member_id, member_pw, member_level, member_name, member_age, member_gender, update_date, creat_date) VALUES(?,PASSWORD(?),0,?,?,?,NOW(),NOW())";
		//DB�÷��� creat_date e �ϳ� ������
		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setString(1,member.getMemberId()); // ���̵�
		stmt.setString(2,member.getMemberPw()); // ��й�ȣ
		stmt.setString(3,member.getMemberName()); // �̸�
		stmt.setInt(4, member.getMemberAge()); // ����
		stmt.setString(5, member.getMemberGender()); //����		
		
		System.out.println(stmt+"<------dao.insertMember - stmt"); //���� �� �Ķ���� Ȯ��
		check = stmt.executeUpdate(); // Ȯ�ο�
		if(check == 1) {
			System.out.println("����");
		}else {
			System.out.println("����");
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
		//�Ķ���� Ȯ��
		Connection conn = dbUtil.getConnection();
		String sql ="SELECT member_no memberNo, member_id memberId,member_name memberName, member_level memberLevel FROM member WHERE member_id=? AND member_pw=PASSWORD(?);";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId()); //���̵�
		stmt.setString(2, member.getMemberPw()); //�н�����

		System.out.println(stmt+"<--- dao.login - stmt"); //���� �� �Ķ���� Ȯ��

		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			returnMember = new Member();
			returnMember.setMemberNo(rs.getInt("memberNo")); //�ѹ� int
			returnMember.setMemberId(rs.getString("memberId")); //���̵� String
			returnMember.setMemberName(rs.getString("memberName")); // �̸� String
			returnMember.setMemberLevel(rs.getInt("memberNo")); // ���� int
			System.out.println("login ok");
			rs.close();
			stmt.close();
			conn.close();
			
			return returnMember; // �α��� ������ ���̵� �̸� ���� ��ȯ ���н� null
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return returnMember; // �α��� ������ ���̵� �̸� ���� ��ȯ ���н� null
		
		
		/*SELECT member_no memberNo, 
		 * member_id memberId, 
		 * member_level memberLevel
		 * FROM
		 * member
		 * WHERE member_id=? AND member_pw=?
		 * */
		
	}

}

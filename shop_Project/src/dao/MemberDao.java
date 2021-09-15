package dao;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import commons.DBUtil;
import vo.Member;

public class MemberDao {
	
	//[������] rowPerPage�� �Ķ���ͷ� �ް� DB������ ī��Ʈ �� ������ ������ ��ȯ
	
	public int CountMemberAll(int ROW_PER_PAGE) throws ClassNotFoundException, SQLException {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="SELECT COUNT(*) from member";
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(stmt+"<-------Dao.CountMemberAll - stmt");
		ResultSet rs = stmt.executeQuery();
		int totalRowCount = 0;
		if(rs.next()) {
			totalRowCount = rs.getInt("COUNT(*)");
		}
		
		int lastPage = totalRowCount / ROW_PER_PAGE;
		
		if(totalRowCount % ROW_PER_PAGE != 0){
			lastPage++;
		}
		
		System.out.println(lastPage+"<----- Dao.CountMemberAll - lastPage");
		
		return lastPage;
		
	}
	
	//[������] ȸ����� ���
	public ArrayList<Member> SelectMemberListAllByPage(int beginRow, int rowPerPage) throws SQLException, ClassNotFoundException {
		ArrayList<Member> list = new ArrayList<Member>();
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="SELECT member_no, member_id, member_level, member_name, member_age, member_gender, update_date, create_date FROM member"
				+" ORDER BY create_date ASC LIMIT ?,?"; // ù��° ���ο� ���� ���� ���� ��¥�� ��������
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow); // ���� ������
		stmt.setInt(2, rowPerPage); // ǥ���� ��� ����
		System.out.println(stmt+"<----------Dao.SelectMemberListAllByPage - stmt");
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Member member = new Member();
			member.setMemberNo(rs.getInt("member_No")); //�ѹ� int
			member.setMemberId(rs.getString("member_Id")); //���̵� String
			member.setMemberName(rs.getString("member_Name")); // �̸� String
			member.setMemberLevel(rs.getInt("member_Level")); // ���� int
			member.setMemberAge(rs.getInt("member_age")); // ���� int
			member.setMemberGender(rs.getString("member_gender")); // ���� String
			member.setUpdateDate(rs.getString("update_date")); // ������Ʈ ��¥ String
			member.setCreateDate(rs.getString("create_date")); // ���� ��¥ String
			list.add(member);
			
		}
		System.out.println(list.size()+"Dao.SelectMemberListAllByPage - retrun list size check"); //�Է� Ȯ��
		rs.close();
		stmt.close();
		conn.close();
		//SELECT member_no, member_id, member_level, member_name, member_age, member_gender, update_date, create_date FROM member
		//ORDER BY create_date DESC LIMIT ?,?

		return list; // �����̸� ����Ʈ ��ȯ ���������� null ��ȯ
	}
	
	
	//[ȸ������] ȸ������ �Է�
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
		String sql ="INSERT INTO member(member_id, member_pw, member_level, member_name, member_age, member_gender, update_date, create_date) VALUES(?,PASSWORD(?),0,?,?,?,NOW(),NOW())";
		//DB�÷��� create_date ���� 9.15
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
	//[�α���] �α��� ����
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
			returnMember.setMemberLevel(rs.getInt("memberLevel")); // ���� int
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

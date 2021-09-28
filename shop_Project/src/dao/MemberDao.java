package dao;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import commons.DBUtil;
import vo.Member;

public class MemberDao {
	
<<<<<<< HEAD
=======
	//[회원] 회원가입시 아이디 중복검사 메소드
	public String selectMemberId(String memberIdCheck) throws ClassNotFoundException, SQLException{
		String memberId = null;
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="SELECT member_id memberId FROM member WHERE member_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,memberIdCheck);
		System.out.println(stmt+"<-------- dao.selectMemberId - stmt");
		ResultSet rs = stmt.executeQuery();
		if(rs.next()){
			memberId= rs.getString("memberId");
		}
		
		rs.close();
		stmt.close();
		conn.close();
	
		return memberId; // null -> 사용가능한ID, 아니면 이미 사용중인 ID
	}
	
	
	
	
	
	//회원 정보를 반환하는 메소드
>>>>>>> ce854bba22e3187dcb03732f5cf4982cbaf57825
	public Member selectMemberOne(Member member) throws ClassNotFoundException, SQLException{
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		Member returnMember = null;
		String sql="SELECT member_no, member_id, member_level, member_name, member_age, member_gender, update_date, create_date FROM member WHERE member_no=? ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,member.getMemberNo());
		System.out.println(stmt+"<------ dao.selectMemberOne - stmt");
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			returnMember = new Member();
			returnMember.setMemberNo(rs.getInt("member_no")); //넘버 int
			returnMember.setMemberId(rs.getString("member_id")); //아이디 String
			returnMember.setMemberName(rs.getString("member_name")); // 이름 String
			returnMember.setMemberLevel(rs.getInt("member_level")); // 레벨 int
			System.out.println("select ok");
			rs.close();
			stmt.close();
			conn.close();
			
			return returnMember; //성공시 반환 실패시 null
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return returnMember;
	}
	
	//[관리자]회원 등급수정 - MemberNo와 수정될 Level를 받아서 update
	public void updateMemberLevelByAdmin(Member member,String pw) throws ClassNotFoundException, SQLException {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="UPDATE member SET member_level=? WHERE member_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,member.getMemberLevel());
		stmt.setInt(2,member.getMemberNo());
	
		System.out.println(stmt+"<------dao.updateMemberLevelByAdmin - stmt"); //쿼리 및 파라미터 확인
		int check = stmt.executeUpdate(); // 확인용
		
		if(check == 1) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		stmt.close();
		conn.close();
		
		return;
	
	
	}
	
	//[관리자]회원 비밀번호 수정 - MemberNo와 수정될 Pw를 받아서 update
	public void updateMemberPwByAdmin(Member member) throws ClassNotFoundException, SQLException {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="UPDATE member SET member_pw=PASSWORD(?) WHERE member_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,member.getMemberPw());
		stmt.setInt(2,member.getMemberNo());
	
		System.out.println(stmt+"<------dao.updateMemberPwByAdmin - stmt"); //쿼리 및 파라미터 확인
		int check = stmt.executeUpdate(); // 확인용
		
		if(check == 1) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		stmt.close();
		conn.close();
		
		return;
	}
	
	//[관리자]회원 강제탈퇴 - MemberNo를 받아서 delete
	public void deleteMemberByAdmin(int memberNo) throws ClassNotFoundException, SQLException {
		
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="DELETE FROM member WHERE member_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,memberNo);
		System.out.println(stmt+"<------dao.updateMemberPwByAdmin - stmt"); //쿼리 및 파라미터 확인
		int check = stmt.executeUpdate(); // 확인용
		
		if(check == 1) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		stmt.close();
		conn.close();
		
		return;
		
	}
	
	//[관리자]회원 아이디 검색
	
	public ArrayList<Member> SelectMemberListAllBySearchMemberId(int beginRow, int rowPerPage, String searchMemberId) throws SQLException, ClassNotFoundException {
		ArrayList<Member> list = new ArrayList<Member>();
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="SELECT member_no, member_id, member_level, member_name, member_age, member_gender, update_date, create_date FROM member"
				+" WHERE member_id LIKE ?"
				+" ORDER BY create_date ASC LIMIT ?,?"; // 첫번째 라인에 제일 빠른 생성 날짜가 나오도록
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%"+searchMemberId+"%");
		stmt.setInt(2, beginRow); // 현재 페이지
		stmt.setInt(3, rowPerPage); // 표시할 목록 개수
		System.out.println(stmt+"<----------Dao.SelectMemberListAllBySearchMemberId - stmt");
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) { //쿼리 첫줄을 실행하고 bool값을 리턴하는 함수 여러번 실행하면 문제 생김. 디버깅 코드가 필요할시 rs자체를 출력하거나 while or if문 안에서 체크하는 코드 필요함
			Member member = new Member();
			member.setMemberNo(rs.getInt("member_No")); //넘버 int
			member.setMemberId(rs.getString("member_Id")); //아이디 String
			member.setMemberName(rs.getString("member_Name")); // 이름 String
			member.setMemberLevel(rs.getInt("member_Level")); // 레벨 int
			member.setMemberAge(rs.getInt("member_age")); // 나이 int
			member.setMemberGender(rs.getString("member_gender")); // 성별 String
			member.setUpdateDate(rs.getString("update_date")); // 업데이트 날짜 String
			member.setCreateDate(rs.getString("create_date")); // 생성 날짜 String
			list.add(member);
			
		}
		System.out.println(list.size()+"Dao.SelectMemberListAllBySearchMemberId - retrun list size check"); //입력 확인
		rs.close();
		stmt.close();
		conn.close();
		//SELECT member_no, member_id, member_level, member_name, member_age, member_gender, update_date, create_date FROM member
		//ORDER BY create_date DESC LIMIT ?,?

		return list; // 정상이면 리스트 반환 문제있으면 null 반환
	}
	
	//[관리자] rowPerPage를 파라미터로 받고 DB데이터 카운트 후 마지막 페이지 반환
	
	public int CountMemberAll(int ROW_PER_PAGE, String searchMemberId) throws ClassNotFoundException, SQLException {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql;
		if(searchMemberId.equals("") == true) { //공백인경우 전체 값 검색어 있을경우 검색결과 값
			sql = "SELECT COUNT(*) from member";
		} else {
			sql = "SELECT COUNT(*) from member WHERE member_id LIKE "+"'%"+searchMemberId+"%'";
		}
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(stmt+"<-------Dao.CountMemberAll - stmt");//디버깅
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
		
		rs.close(); //DB 해제하는거 잊지말자 2021.09.15
		stmt.close();
		conn.close();
		return lastPage;
		
	}
	
	//[관리자] 회원목록 출력
	public ArrayList<Member> SelectMemberListAllByPage(int beginRow, int rowPerPage) throws SQLException, ClassNotFoundException {
		ArrayList<Member> list = new ArrayList<Member>();
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="SELECT member_no, member_id, member_level, member_name, member_age, member_gender, update_date, create_date FROM member"
				+" ORDER BY create_date ASC LIMIT ?,?"; // 첫번째 라인에 제일 빠른 생성 날짜가 나오도록
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow); // 현재 페이지
		stmt.setInt(2, rowPerPage); // 표시할 목록 개수
		System.out.println(stmt+"<----------Dao.SelectMemberListAllByPage - stmt");
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Member member = new Member();
			member.setMemberNo(rs.getInt("member_no")); //넘버 int
			member.setMemberId(rs.getString("member_id")); //아이디 String
			member.setMemberName(rs.getString("member_name")); // 이름 String
			member.setMemberLevel(rs.getInt("member_level")); // 레벨 int
			member.setMemberAge(rs.getInt("member_age")); // 나이 int
			member.setMemberGender(rs.getString("member_gender")); // 성별 String
			member.setUpdateDate(rs.getString("update_date")); // 업데이트 날짜 String
			member.setCreateDate(rs.getString("create_date")); // 생성 날짜 String
			list.add(member);
			
		}
		System.out.println(list.size()+"Dao.SelectMemberListAllByPage - retrun list size check"); //입력 확인
		rs.close();
		stmt.close();
		conn.close();
		//SELECT member_no, member_id, member_level, member_name, member_age, member_gender, update_date, create_date FROM member
		//ORDER BY create_date DESC LIMIT ?,?

		return list; // 정상이면 리스트 반환 문제있으면 null 반환
	}
	
	
	//[회원가입] 회원정보 입력
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
		String sql ="INSERT INTO member(member_id, member_pw, member_level, member_name, member_age, member_gender, update_date, create_date) VALUES(?,PASSWORD(?),0,?,?,?,NOW(),NOW())";
		//DB컬럼명 create_date 수정 9.15
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
	//[로그인] 로그인 세션
	public Member login(Member member) throws SQLException, ClassNotFoundException {
		Member returnMember = null;
		DBUtil dbUtil = new DBUtil();
		System.out.println(member.getMemberId()+"<--- dao.login  - memberId");
		System.out.println(member.getMemberPw()+"<--- dao.login  - memberPw");
		//파라미터 확인
		Connection conn = dbUtil.getConnection();
		String sql ="SELECT member_no memberNo, member_id memberId,member_name memberName, member_level memberLevel,member_pw memberPw FROM member WHERE member_id=? AND member_pw=password(?);";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId()); //아이디
		stmt.setString(2, member.getMemberPw()); //패스워드

		System.out.println(stmt+"<--- dao.login - stmt"); //쿼리 및 파라미터 확인

		ResultSet rs = stmt.executeQuery();
		System.out.println(rs+"<-------- dao.login - rs");
		//System.out.println(rs.next()+"<-------- dao.login - rs.next"); //이거 함부로 하면 안뎌
		//System.out.println(rs.getFetchSize());
		if(rs.next()) {
			returnMember = new Member();
			returnMember.setMemberNo(rs.getInt("memberNo")); //넘버 int
			returnMember.setMemberId(rs.getString("memberId")); //아이디 String
			returnMember.setMemberName(rs.getString("memberName")); // 이름 String
			returnMember.setMemberLevel(rs.getInt("memberLevel")); // 레벨 int
			returnMember.setMemberPw(rs.getString("memberPw")); // 패스워드 String
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

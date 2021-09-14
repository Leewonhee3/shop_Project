package dao;

import vo.Member;

public class MemberDao {
	
	public void insertMember(Member member) {
		
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
		 * ?, PASSWORD(?), 0, ?, ?, NOW(), NOW()
		 * )
		 */
		
		
	}
	
	public Member login(Member member) {
		Member returnMember = null;
		
		/*SELECT member_no memberNo, 
		 * member_id memberId, 
		 * member_level memberLevel
		 * FROM
		 * member
		 * WHERE member_id=? AND member_pw=?
		 * */
		
		return member;
	}

}

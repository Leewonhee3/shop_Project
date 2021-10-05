package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import vo.*;
import commons.*;

public class QnADao {
	
	//qna ¸®½ºÆ®
	public ArrayList<QnA> selectQnAListAll(int beginRow, int ROW_PER_PAGE) throws ClassNotFoundException, SQLException {
		
		QnA qna = null;
		ArrayList<QnA> list = new ArrayList<QnA>();
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="SELECT qna_no, qna_category, qna_title, member_no, qna_secret, create_date, update_date FROM qna ORDER BY create_date DESC LIMIT ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, ROW_PER_PAGE);
		System.out.println(stmt+"<----- dao.selectQnAListAll - stmt"); //check
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			
			qna = new QnA();
			
			qna.setQnaNo(rs.getInt("qna_no"));
			qna.setQnaCategory(rs.getString("qna_category"));
			qna.setQnaTitle(rs.getString("qna_title"));
			qna.setMemberNo(rs.getInt("member_no"));
			qna.setQnaSecret(rs.getString("qna_secret"));
			qna.setCreateDate(rs.getString("create_date"));
			qna.setUpdateDate(rs.getString("update_date"));
			
			list.add(qna);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return list;
		
	}
	
	// qna one
	
	public QnA selectQnAOne(int qnaNo) throws ClassNotFoundException, SQLException {
		
		QnA qna = new QnA();
		DBUtil dbutil = new DBUtil();
		
		Connection conn = dbutil.getConnection();
		String sql="SELECT qna_no, qna_category, qna_title, qna_content, qna_secret, member_no, create_date, update_date FROM qna WHERE qna_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, qnaNo);
		System.out.println(stmt+"<-----dao.selectQnAOne - stmt");//check
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			
			qna.setQnaNo(rs.getInt("qna_no"));
			qna.setQnaCategory(rs.getString("qna_category"));
			qna.setQnaTitle(rs.getString("qna_title"));
			qna.setQnaContent(rs.getString("qna_content"));
			qna.setQnaSecret(rs.getString("qna_secret"));
			qna.setMemberNo(rs.getInt("member_no"));
			qna.setCreateDate(rs.getString("create_date"));
			qna.setUpdateDate(rs.getString("update_date"));
		
		}
		
		return qna;
	}
	
	// qna insert
	
	public void insertQnAByMember(QnA qna)throws ClassNotFoundException, SQLException {
	
		int check = 0; // success check;
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="INSERT INTO qna(qna_category, qna_title, qna_content, qna_secret, member_no, create_date, update_date) VALUES(?,?,?,?,?,NOW(),NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, qna.getQnaCategory());
		stmt.setString(2, qna.getQnaTitle());
		stmt.setString(3, qna.getQnaContent());
		stmt.setString(4, qna.getQnaSecret());
		stmt.setInt(5, qna.getMemberNo());
		
		System.out.println(stmt+"<----dao.insertQnAByMember - stmt");//check;
		check = stmt.executeUpdate();
		
		if(check == 0) {
			
			System.out.println("error by insertQnAByMember");
		
		}else {

			System.out.println("success by insertQnAByMember");
		}
		
		stmt.close();
		conn.close();
		
		return;
	
	}
	
	
	// qna delete
	
	public void deleteQnAByMember(QnA qna) throws ClassNotFoundException, SQLException {
		
		int check = 0; //success check
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="DELETE FROM qna WHERE member_no=? AND qna_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, qna.getMemberNo());
		stmt.setInt(2, qna.getQnaNo());
		System.out.println(stmt+"<----- dao.deleteQnAByMember - stmt"); //check
		check = stmt.executeUpdate();
		
		if(check==0) {
			
			System.out.println("--------------------error by deleteQnAByMember--------------------");
			
		}else {
			
			System.out.println("--------------------success by deleteQnAByMember--------------------");
			
		}
		
		stmt.close();
		conn.close();
		
		return;
	}
	
	// qna update
	
	public void updateQnAByMember(QnA qna) throws ClassNotFoundException, SQLException {
		
		int check=0; //success check
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="UPDATE qna SET qna_category=?, qna_title=?, qna_content=?, qna_secret=?, update_date=NOW() WHERE member_no=? AND qna_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, qna.getQnaCategory());
		stmt.setString(2, qna.getQnaTitle());
		stmt.setString(3, qna.getQnaContent());
		stmt.setString(4, qna.getQnaSecret());
		stmt.setInt(5, qna.getMemberNo());
		stmt.setInt(6, qna.getQnaNo());
		
		System.out.println(stmt+"<----- dao.updateQnAByMember - stmt"); //check
		check = stmt.executeUpdate();
		
		if(check==0) {
			
			System.out.println("<---- error by updateQnAByMember");
			
		}else {
			
			System.out.println("<---- success by updateQnAByMember");
			
		}
		
		stmt.close();
		conn.close();
		
		return;
		
	}
	
	// qna Waiting select
	
	public ArrayList<QnA> selectWaitingQnAList() {
		
		ArrayList<QnA> list = new ArrayList<QnA>();
		
		
		return list;
	}
	
	// qna count, qna category count
	
	public void QnACount() {
		
	}
}

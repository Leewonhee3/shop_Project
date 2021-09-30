package dao;

import java.sql.*;
import java.util.ArrayList;

import vo.*;

import commons.DBUtil;

public class NoticeDao {
	
	//[admin] update note
	public void updateNoticeByAdmin(Notice notice) throws ClassNotFoundException, SQLException {
		
		int check=0; //success check
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="UPDATE notice SET notice_title=?, notice_content=?,update_date=NOW()  WHERE member_no=? AND notice_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
		stmt.setInt(3, notice.getMemberNo());
		stmt.setInt(4, notice.getNoticeNo());
		System.out.println(stmt+"<----- dao.updateNoticeByAdmin - stmt"); //check
		check = stmt.executeUpdate();
		
		if(check==0) {
			
			System.out.println("<---- error by updateNoticeByAdmin");
			
		}else {
			
			System.out.println("<---- success by updateNoticeByAdmin");
			
		}
		
		stmt.close();
		conn.close();
		
		return;
		
	}
	
	
	//[admin] delete note
	public void deleteNoticeByAdmin(Notice notice) throws ClassNotFoundException, SQLException {
		
		int check=0; //success check
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="DELETE FROM notice WHERE member_no=? AND notice_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, notice.getMemberNo());
		stmt.setInt(2, notice.getNoticeNo());
		System.out.println(stmt+"<----- dao.deleteNoticeByAdmin - stmt"); //check
		check = stmt.executeUpdate();
		
		if(check==0) {
			
			System.out.println("<---- error by deleteNoticeByAdmin");
			
		}else {
			
			System.out.println("<---- success by deleteNoticeByAdmin");
			
		}
		
		stmt.close();
		conn.close();
		
		return;
	}
	
		
	public ArrayList<Notice> selectNoticeNewest() throws ClassNotFoundException, SQLException{
		
		ArrayList<Notice> list = new ArrayList<Notice>();
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		Notice notice = null;
		String sql="SELECT notice_no, notice_title, member_no, create_date, update_date FROM notice ORDER BY create_date DESC LIMIT ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, 0);
		stmt.setInt(2, 5);
		System.out.println(stmt+"<----- dao.selectNoticeNewest - stmt"); //check
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			
			notice = new Notice();
			
			notice.setNoticeNo(rs.getInt("notice_no"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			notice.setMemberNo(rs.getInt("member_no"));
			notice.setCreateDate(rs.getString("create_date"));
			notice.setUpdateDate(rs.getString("update_date"));
			
			list.add(notice);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return list;
		
	}
	
	
	//[all] show NoticeList
	public ArrayList<Notice> selectNoticeListAll(int beginRow, int ROW_PER_PAGE) throws ClassNotFoundException, SQLException{
		
		ArrayList<Notice> list = new ArrayList<Notice>();
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		Notice notice = null;
		String sql="SELECT notice_no, notice_title, member_no, create_date, update_date FROM notice ORDER BY create_date DESC LIMIT ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, ROW_PER_PAGE);
		System.out.println(stmt+"<----- dao.selectNoticeListAll - stmt"); //check
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			
			notice = new Notice();
			
			notice.setNoticeNo(rs.getInt("notice_no"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			notice.setMemberNo(rs.getInt("member_no"));
			notice.setCreateDate(rs.getString("create_date"));
			notice.setUpdateDate(rs.getString("update_date"));
			
			list.add(notice);
		}
		
		System.out.println(list.get(0).getNoticeNo() +"\t and \t"+ list.get(1).getNoticeNo()+"<-------------------Notice list.getNoticeNo()");
		
		rs.close();
		stmt.close();
		conn.close();
		
		return list;
		
	}
	
	//[all] show Notice
	public Notice selectNoticeOne(int noticeNo) throws ClassNotFoundException, SQLException {
		Notice notice = new Notice();
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="SELECT notice_no, notice_title, notice_content, member_no, create_date, update_date FROM notice WHERE notice_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeNo);
		System.out.println(stmt+"<-----dao.selectNoticeOne - stmt");//check
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			notice.setNoticeNo(rs.getInt("notice_no"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			notice.setNoticeContent(rs.getString("notice_content"));
			notice.setMemberNo(rs.getInt("member_no"));
			notice.setCreateDate(rs.getString("create_date"));
			notice.setUpdateDate(rs.getString("update_date"));
		}
		
		return notice;
		
	}
	
	public void insertNoteNew(int memberNo, String noticeTitle, String noticeContent) throws ClassNotFoundException, SQLException {
		int check = 0; // success check;
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="INSERT INTO notice(notice_title, notice_content, member_no, create_date, update_date) VALUES(?,?,?,NOW(),NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, noticeTitle);
		stmt.setString(2, noticeContent);
		stmt.setInt(3, memberNo);
		System.out.println(stmt+"<----dao.insertNoteNew - stmt");//check;
		check = stmt.executeUpdate();
		if(check == 0) {
			
			System.out.println("error by insertNoteNew");
		
		}else {

			System.out.println("success by insertNoteNew");
		}
		
		stmt.close();
		conn.close();
		
		return;
	}
	
	
}

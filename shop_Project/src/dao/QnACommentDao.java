package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import commons.DBUtil;
import vo.QnA;
import vo.QnAComment;

public class QnACommentDao {
	//insert QnAComment
	
	public void insertQnAComment(QnAComment qnaComment)throws ClassNotFoundException, SQLException {
		
		int check = 0; // success check;
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="INSERT INTO qna_comment(qna_no, qna_comment_content, member_no, create_date, update_date) VALUES(?,?,?,NOW(),NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, qnaComment.getQnaNo());
		stmt.setString(2, qnaComment.getQnaCommentContent());
		stmt.setInt(3, qnaComment.getMemberNo());
		
		System.out.println(stmt+"<----dao.insertQnAComment - stmt");//check;
		check = stmt.executeUpdate();
		
		if(check == 0) {
			
			System.out.println("error by insertQnAComment");
		
		}else {

			System.out.println("success by insertQnAComment");
		}
		
		stmt.close();
		conn.close();
		
		return;
	
	}
	
	// update comment..
	
	public void updateQnAComment(QnAComment qnaComment)throws ClassNotFoundException, SQLException {
		
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		
	}
	
	// select comment
	
	public QnAComment selectQnACommentOne(int qnaNo)throws ClassNotFoundException, SQLException {
		
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		QnAComment qnaComment = new QnAComment();
		
		String sql="SELECT qna_no, qna_comment_content, member_no, create_date, update_date FROM qna_comment WHERE qna_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, qnaNo);
		System.out.println(stmt+"<-----dao.selectQnACommentOne - stmt");//check
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			
			qnaComment.setQnaNo(rs.getInt("qna_no"));
			qnaComment.setQnaCommentContent(rs.getString("qna_comment_content"));
			qnaComment.setMemberNo(rs.getInt("member_no"));
			qnaComment.setCreateDate(rs.getString("create_date"));
			qnaComment.setUpdateDate(rs.getString("update_date"));
		
		}
		
		return qnaComment;
		
	}
}
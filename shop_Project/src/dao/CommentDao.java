package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import commons.DBUtil;
import vo.*;
import dao.*;

public class CommentDao {
	
	//[all] book score print
	public double selectOrderScoreAvg(int ebookNo) throws ClassNotFoundException, SQLException {
		
		double avgScore=0;
		DBUtil dbutil = new DBUtil();
		String sql = "select avg(order_score) av from order_comment where ebook_no=?";
		Connection conn = dbutil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, ebookNo);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			avgScore= rs.getDouble("av");
		}
		rs.close();
		stmt.close();
		conn.close();
		
		return avgScore;
	}
	
	//[all] book review list print
	public ArrayList<Comment> selectOrderReviewByPage(int ebookNo, int beginRow, int ROW_PER_PAGE) throws SQLException, ClassNotFoundException {
		
		ArrayList<Comment> list = new ArrayList<Comment>();
		Comment comment = null;//입력이상시 null
		DBUtil dbutil = new DBUtil();
		String sql = "select order_comment_content,order_score,create_date from order_comment where ebook_no=? limit ?,?";
		Connection conn = dbutil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, ebookNo);
		stmt.setInt(2, beginRow);
		stmt.setInt(3, ROW_PER_PAGE);
		System.out.println(stmt+"<-----dao.selectOrderReviewByPage - stmt"); //check
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			comment = new Comment();
			comment.setOrderCommentContent(rs.getString("order_comment_content"));
			comment.setOrderScore(rs.getInt("order_score"));
			comment.setCreateDate(rs.getString("create_date"));
			list.add(comment);
			System.out.println(list+"<--list");
		}
		rs.close();
		stmt.close();
		conn.close();
		
		return list;
		
	}
	
	
	//[all] 
	public void insertOrderCommentReview(Comment comment)throws SQLException, ClassNotFoundException {
		
		DBUtil dbutil = new DBUtil();
		int check = 0; //실행성공 여부 확인 
		System.out.println(comment.getOrderNo()+"<------dao.insertOrderCommentReview - getOrderNo");
		System.out.println(comment.getEbookNo()+"<------dao.insertOrderCommentReview - getEbookNo");
		System.out.println(comment.getOrderScore()+"<------dao.insertOrderCommentReview - getOrderScore");
		System.out.println(comment.getOrderCommentContent()+"<------dao.insertOrderCommentReview - getOrderCommentContent");
		//파라미터 확인
		Connection conn = dbutil.getConnection();
		String sql ="INSERT INTO order_comment(order_no, ebook_no, order_score, order_comment_content, create_date, update_date) VALUES(?,?,?,?,NOW(),NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setInt(1,comment.getOrderNo());
		stmt.setInt(2, comment.getEbookNo());
		stmt.setInt(3, comment.getOrderScore());
		stmt.setString(4, comment.getOrderCommentContent());
		System.out.println(stmt+"<------dao.insertOrderCommentReview - stmt"); //쿼리 및 파라미터 확인
		check = stmt.executeUpdate(); // 확인용
		if(check == 1) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		stmt.close();
		conn.close();
		
		return;
		
	}
		//[all] comment check method
		public int selectCheckCommentReview(int orderNo, int ebookNo)throws SQLException, ClassNotFoundException {
		
		DBUtil dbutil = new DBUtil();
		int check = 0; //데이터 유무 확인.
		System.out.println(orderNo+"<------dao.selectCheckCommentReview - orderNo");
		System.out.println(ebookNo+"<------dao.selectCheckCommentReview - ebookNo");
		//파라미터 확인
		Connection conn = dbutil.getConnection();
		String sql ="SELECT order_no, ebook_no FROM order_comment WHERE order_no=? AND ebook_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setInt(1,orderNo);
		stmt.setInt(2, ebookNo);
		System.out.println(stmt+"<------dao.selectCheckCommentReview - stmt"); //쿼리 및 파라미터 확인
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			check=1;
		}
		stmt.close();
		conn.close();
		
		return check;
		
	}
}

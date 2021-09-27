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

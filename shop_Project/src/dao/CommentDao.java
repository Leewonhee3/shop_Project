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
		int check = 0; //���༺�� ���� Ȯ�� 
		System.out.println(comment.getOrderNo()+"<------dao.insertOrderCommentReview - getOrderNo");
		System.out.println(comment.getEbookNo()+"<------dao.insertOrderCommentReview - getEbookNo");
		System.out.println(comment.getOrderScore()+"<------dao.insertOrderCommentReview - getOrderScore");
		System.out.println(comment.getOrderCommentContent()+"<------dao.insertOrderCommentReview - getOrderCommentContent");
		//�Ķ���� Ȯ��
		Connection conn = dbutil.getConnection();
		String sql ="INSERT INTO order_comment(order_no, ebook_no, order_score, order_comment_content, create_date, update_date) VALUES(?,?,?,?,NOW(),NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setInt(1,comment.getOrderNo());
		stmt.setInt(2, comment.getEbookNo());
		stmt.setInt(3, comment.getOrderScore());
		stmt.setString(4, comment.getOrderCommentContent());
		System.out.println(stmt+"<------dao.insertOrderCommentReview - stmt"); //���� �� �Ķ���� Ȯ��
		check = stmt.executeUpdate(); // Ȯ�ο�
		if(check == 1) {
			System.out.println("����");
		}else {
			System.out.println("����");
		}
		stmt.close();
		conn.close();
		
		return;
		
	}
		//[all] comment check method
		public int selectCheckCommentReview(int orderNo, int ebookNo)throws SQLException, ClassNotFoundException {
		
		DBUtil dbutil = new DBUtil();
		int check = 0; //������ ���� Ȯ��.
		System.out.println(orderNo+"<------dao.selectCheckCommentReview - orderNo");
		System.out.println(ebookNo+"<------dao.selectCheckCommentReview - ebookNo");
		//�Ķ���� Ȯ��
		Connection conn = dbutil.getConnection();
		String sql ="SELECT order_no, ebook_no FROM order_comment WHERE order_no=? AND ebook_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setInt(1,orderNo);
		stmt.setInt(2, ebookNo);
		System.out.println(stmt+"<------dao.selectCheckCommentReview - stmt"); //���� �� �Ķ���� Ȯ��
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			check=1;
		}
		stmt.close();
		conn.close();
		
		return check;
		
	}
}

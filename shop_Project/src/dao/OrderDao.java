package dao;

import java.util.ArrayList;

import java.sql.*;

import vo.*;
import commons.*;
//[admin/all] order method 
public class OrderDao {

	//[all] Personal order list	
	public ArrayList<OrderEbookMember> selectMemberOrderList(int beginRow, int rowPerPage, int memberNo) throws ClassNotFoundException, SQLException{
		
		ArrayList<OrderEbookMember> list = new  ArrayList<OrderEbookMember>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT o.order_no, e.ebook_no, e.ebook_title, m.member_no, m.member_id, o.order_price, o.order_date FROM orders o INNER JOIN ebook e INNER join member m ON o.ebook_no = e.ebook_no and o.member_no = m.member_no\r\n"
				+ "WHERE m.member_no=? ORDER BY o.order_date desc LIMIT ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, memberNo);
		stmt.setInt(2, beginRow);
		stmt.setInt(3, rowPerPage);
		System.out.println(stmt+"<---- dao.OrderDao - selectMemberOrderList"); // 荑쇰━ �솗�씤
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			
			OrderEbookMember oem = new OrderEbookMember();
			Order o = new Order();
			Ebook e = new Ebook();
			Member m = new Member();
			
			o.setOrderNo(rs.getInt("order_no"));
			o.setOrderPrice(rs.getInt("order_price"));
			o.setOrderDate(rs.getString("order_date"));
			e.setEbookNo(rs.getInt("ebook_no"));
			e.setEbookTitle(rs.getString("ebook_title"));
			m.setMemberNo(rs.getInt("member_no"));
			m.setMemberId(rs.getString("member_id"));
			
			oem.setOrder(o);
			oem.setEbook(e);
			oem.setMember(m);
			
			list.add(oem);
		}
		
		rs.close(); //�빐�젣 �엸吏�留먯옄
		stmt.close();
		conn.close();
		
		return list;
	}
	
	
	//[admin] all order list 
	public ArrayList<OrderEbookMember> selectOrderList(int beginRow, int rowPerPage) throws ClassNotFoundException, SQLException{
		
		ArrayList<OrderEbookMember> list = new  ArrayList<OrderEbookMember>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT o.order_no, e.ebook_no, e.ebook_title, m.member_no, m.member_id, o.order_price, o.order_date "
				+ "FROM orders o INNER JOIN ebook e INNER join member m "
				+ "ON o.ebook_no = e.ebook_no and o.member_no = m.member_no "
				+ "ORDER BY o.order_date desc LIMIT ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		System.out.println(stmt+"<---- dao.OrderDao - selectOrderList"); // 荑쇰━ �솗�씤
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			
			OrderEbookMember oem = new OrderEbookMember();
			Order o = new Order();
			Ebook e = new Ebook();
			Member m = new Member();
			
			o.setOrderNo(rs.getInt("order_no"));
			o.setOrderPrice(rs.getInt("order_price"));
			o.setOrderDate(rs.getString("order_date"));
			e.setEbookNo(rs.getInt("ebook_no"));
			e.setEbookTitle(rs.getString("ebook_title"));
			m.setMemberNo(rs.getInt("member_no"));
			m.setMemberId(rs.getString("member_id"));
			
			oem.setOrder(o);
			oem.setEbook(e);
			oem.setMember(m);
			
			list.add(oem);
		}
		
		rs.close(); //�빐�젣 �엸吏�留먯옄
		stmt.close();
		conn.close();
		
		return list;
	}
	
	
}

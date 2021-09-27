package dao;

import java.util.ArrayList;

import java.sql.*;

import vo.*;
import commons.*;
//[관리자] 주문관리 - 주문 리스트를 출력한다.
public class OrderDao {
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
		System.out.println(stmt+"<---- dao.OrderDao - selectOrderList"); // 쿼리 확인
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
		
		rs.close(); //해제 잊지말자
		stmt.close();
		conn.close();
		
		return list;
	}
	
	
}

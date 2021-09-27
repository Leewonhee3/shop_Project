package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import commons.DBUtil;
import vo.*;

public class EbookDao {
	
	
	//[������]å �̹��� ����
	public void updateEbookImg(Ebook ebook) throws ClassNotFoundException, SQLException {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="UPDATE ebook SET ebook_img=? WHERE ebook_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ebook.getEbookImg());
		stmt.setInt(2, ebook.getEbookNo());
		stmt.executeUpdate();
		stmt.close();
		conn.close();
		
	}
	
	public Ebook selectEbookOne(int ebookNo) throws ClassNotFoundException, SQLException {
		Ebook ebook = null;
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="SELECT ebook_no, ebook_img FROM ebook WHERE ebook_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, ebookNo);
		System.out.println(); //����� stmt
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			ebook = new Ebook();
			ebook.setEbookNo(rs.getInt("ebook_no"));
			ebook.setEbookImg(rs.getString("ebook_img"));
		}
		return  ebook;
		
	}
	
	
	//[������] ebook ��ü ��ȸ
	public ArrayList<Ebook> selectEbookList(int beginRow, int ROW_PER_PAGE) throws ClassNotFoundException, SQLException{
		ArrayList<Ebook> list = new ArrayList<Ebook>();
		/*
		 * SELECT ebook_no, category_name, ebook_title, ebook_state FROM ebook ORDER BY create_date DESC LIMIT ?,?
		 */
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		Ebook ebook = null;
		String sql="SELECT ebook_no, category_name, ebook_title, ebook_state, ebook_img, ebook_price FROM ebook"
				+" ORDER BY create_date ASC LIMIT ?,?"; // ù��° ���ο� ���� ���� ���� ��¥�� ��������
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow); // ���� ������
		stmt.setInt(2, ROW_PER_PAGE); // ǥ���� ��� ����
		System.out.println(stmt+"<------ dao.selectEbookList - stmt"); //���� �� �Ķ���� Ȯ�� 
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			ebook = new Ebook();
			ebook.setEbookNo(rs.getInt("ebook_no")); //��ȣ int
			ebook.setCategoryName(rs.getString("category_name")); //ī�װ��� String
			ebook.setEbookTitle(rs.getString("ebook_title")); // �̸� String
			ebook.setEbookState(rs.getString("ebook_state")); // �ǸŻ��� String
			ebook.setEbookImg(rs.getString("ebook_img"));
			ebook.setEbookPrice(rs.getInt("ebook_price"));
			list.add(ebook);
			
		}
		
		System.out.println("select ok from ebook");
		rs.close(); //DB �����ϴ°� �������� 
		stmt.close();
		conn.close();
			
		return list;
		
	}
	//[������] ebook ī�װ��� ��ȸ  [admin/guest] ebook list print
	public ArrayList<Ebook> selectEbookListByCategory(int beginRow, int ROW_PER_PAGE, String categoryName) throws ClassNotFoundException, SQLException{
		ArrayList<Ebook> list = new ArrayList<Ebook>();
		
		/*
		 * SELECT ebook_no, category_name, ebook_title, ebook_state FROM ebook WHERE category_name=? ORDER BY create_date DESC LIMIT ?,?
		 */
		
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		Ebook ebook = null;
		String sql="SELECT ebook_no, category_name, ebook_title, ebook_state, ebook_img, ebook_price FROM ebook WHERE category_name=?"
				+" ORDER BY create_date ASC LIMIT ?,?"; // ù��° ���ο� ���� ���� ���� ��¥�� ��������
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, categoryName);
		stmt.setInt(2, beginRow); // ���� ������
		stmt.setInt(3, ROW_PER_PAGE); // ǥ���� ��� ����
		System.out.println(stmt+"<------ dao.selectEbookListByCategory - stmt"); //���� �� �Ķ���� Ȯ��
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			ebook = new Ebook();
			ebook.setEbookNo(rs.getInt("ebook_no")); //��ȣ int
			ebook.setCategoryName(rs.getString("category_name")); //ī�װ��� String
			ebook.setEbookTitle(rs.getString("ebook_title")); // �̸� String
			ebook.setEbookState(rs.getString("ebook_state")); // �ǸŻ��� String
			ebook.setEbookImg(rs.getString("ebook_img"));
			ebook.setEbookPrice(rs.getInt("ebook_price"));
			list.add(ebook);
			
		}
		
		System.out.println("select ok from ebook");
		rs.close(); //DB �����ϴ°� �������� 
		stmt.close();
		conn.close();
			
		return list;
	}
	//[������] ebook ��ü ī��Ʈ, ī�װ� ī��Ʈ
	public int CountEbookAll(int ROW_PER_PAGE, String categoryName) throws ClassNotFoundException, SQLException {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql;
		if(categoryName.equals("") == true) { //�����ΰ�� ��ü �� �˻��� ������� �˻���� ��
			sql = "SELECT COUNT(*) from Ebook";
		} else {
			sql = "SELECT COUNT(*) from Ebook WHERE category_name LIKE "+"'%"+categoryName+"%'";
		}
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(stmt+"<-------Dao.CountEbookAll - stmt"); //���� Ȯ��
		ResultSet rs = stmt.executeQuery();
		int totalRowCount = 0;
		if(rs.next()) {
			totalRowCount = rs.getInt("COUNT(*)");
		}
		
		int lastPage = totalRowCount / ROW_PER_PAGE;
		
		if(totalRowCount % ROW_PER_PAGE != 0){
			lastPage++;
		}
		
		System.out.println(lastPage+"<----- Dao.CountEbookAll - lastPage");
		
		rs.close(); //DB �����ϴ°� �������� 
		stmt.close();
		conn.close();
		return lastPage;
		
	}
	
}


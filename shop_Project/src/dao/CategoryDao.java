package dao;
import vo.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import commons.*;

public class CategoryDao {
	
	//[������] ī�װ� �˻���� ���
	public ArrayList<Category> SelectCategoryListAllBySearchCategoryName(int beginRow, int ROW_PER_PAGE, String searchCategoryName) {
		
		ArrayList<Category> returnCategoryList = new ArrayList<Category>();
		Category category = new Category();
		
		return returnCategoryList;
		/*ī�װ� �˻�� �ִ� ��� ī�װ��� �޾Ƽ� select*/
	}
	
	
	//[������]ī�װ� ���
	public ArrayList<Category> SelectCategoryListAllByPage(int beginRow, int ROW_PER_PAGE) throws ClassNotFoundException, SQLException {
	
		ArrayList<Category> returnCategoryList = new ArrayList<Category>();
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		Category category = null;
		String sql="SELECT category_name, category_state, update_date, create_date FROM category"
				+" ORDER BY create_date ASC LIMIT ?,?"; // ù��° ���ο� ���� ���� ���� ��¥�� ��������
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow); // ���� ������
		stmt.setInt(2, ROW_PER_PAGE); // ǥ���� ��� ����
		System.out.println(stmt+"<------ dao.SelectCategoryListAllByPage - stmt");
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			category = new Category();
			category.setCategoryName(rs.getString("category_name")); //�̸� String
			category.setCategoryState(rs.getString("category_state")); //���� String
			category.setUpdateDate(rs.getString("update_date")); // ������Ʈ ��¥ String
			category.setCreateDate(rs.getString("create_date")); // ���� ��¥ String
			returnCategoryList.add(category);
			
		}
			System.out.println("select ok from Category");
			rs.close();
			stmt.close();
			conn.close();
			
			return returnCategoryList; // ������ ī�װ� �̸� ���� ������Ʈ��¥, ������¥ ��ȯ ���н� null
	}
		/*ī�װ� �˻�� ���� ��� ��ü ������ select*/
	
	//[������]ī�װ� ���¼��� - ī�װ��� �Ķ���ͷ� �޾Ƽ� �̸��� �ش��ϴ� ī�װ��� ���¸� ������Ʈ �Ѵ�.
	public void updateCategoryState(Category category) throws ClassNotFoundException, SQLException {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		int check = 0; //������� üũ ����
		String sql="UPDATE category SET category_state=? WHERE category_name=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.getCategoryState());
		stmt.setString(2, category.getCategoryName());
		System.out.println(stmt+"<------ dao.updateCategoryState - stmt");//���� �� �Ķ���� Ȯ��
		check = stmt.executeUpdate(); //������� �Ǹ� 1�� �����
		if(check == 1) { // üũ���� 1�� ���
			System.out.println("ī�װ� ������Ʈ ����");
		}else {
			System.out.println("ī�װ� ������Ʈ ����");
		}
	}
	//[������]ī�װ� �߰� - ī�װ��� �Ķ���ͷ� �޾� category ���̺� insert�Ѵ�.
	public void insertCategory(Category category) throws ClassNotFoundException, SQLException {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		int check = 0; //������� üũ ����
		String sql="INSERT INTO category(category_name, category_state, update_date, create_date) VALUES(?,?,NOW(),NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.getCategoryName());
		stmt.setString(2, category.getCategoryState());
		System.out.println(stmt+"<------ dao.insertCategory - stmt");//���� �� �Ķ���� Ȯ��
		check = stmt.executeUpdate(); //������� �Ǹ� 1�� �����
		if(check == 1) { // üũ���� 1�� ���
			System.out.println("ī�װ� �߰� ����");
		}else {
			System.out.println("ī�װ� �߰� ����");
		}
		
	}
		
}


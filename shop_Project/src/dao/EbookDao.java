package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import commons.DBUtil;
import vo.*;

public class EbookDao {
	
	//[all] category data count
	public int totalEbookCount(String ebookCategory) throws ClassNotFoundException, SQLException {
		
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="SELECT COUNT(*) FROM ebook WHERE category_name=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ebookCategory);
		System.out.println(stmt+"<----- dao.totalEbookCount - stmt"); //check
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			System.out.println("dao.totalEbookCount - OK!");
			return rs.getInt("COUNT(*)");
		}
	
		return 0;
	}
	
	
	
	//[all] most recent book list print
	public ArrayList<Ebook> selectNewEbookList(int beginRow, int ROW_PER_PAGE) throws ClassNotFoundException, SQLException {
		ArrayList<Ebook> list = new ArrayList<Ebook>();
		/*
		 * SELECT * FROM ebook ORDER BY create_date DESC LIMIT 0, 5
		 */
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		Ebook ebook = null;
		String sql="SELECT ebook_no, ebook_title, ebook_img, ebook_price FROM ebook ORDER BY create_date DESC LIMIT ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow); // 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
		stmt.setInt(2, ROW_PER_PAGE); // 표占쏙옙占쏙옙 占쏙옙占� 占쏙옙占쏙옙
		System.out.println(stmt+"<------ dao.selectNewEbookList - stmt"); //占쏙옙占쏙옙 占쏙옙 占식띰옙占쏙옙占� 확占쏙옙 
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			ebook = new Ebook();
			ebook.setEbookNo(rs.getInt("ebook_no")); //占쏙옙호 int
			ebook.setEbookTitle(rs.getString("ebook_title")); // 占싱몌옙 String
			ebook.setEbookImg(rs.getString("ebook_img"));
			ebook.setEbookPrice(rs.getInt("ebook_price"));
			list.add(ebook);
			
		}
		
		System.out.println("select ok from ebook");
		rs.close(); //DB 占쏙옙占쏙옙占싹는곤옙 占쏙옙占쏙옙占쏙옙占쏙옙 
		stmt.close();
		conn.close();
			
		return list;
	}
	
	//[all] most popular book list print 
	public ArrayList<Ebook> selectPopularEbookList(int beginRow, int ROW_PER_PAGE) throws ClassNotFoundException, SQLException {
		ArrayList<Ebook> list = new ArrayList<Ebook>();
		/*
		 * SELECT t.ebook_no, e.ebook_title, e.eboook_img, e.ebook_price FROM ebook e INNER JOIN (SELECT ebook_no, COUNT(ebook_no) cnt 
		 * FROM orders GROUP BY ebook_no ORDER BY COUNT(ebook_no) DESC LIMIT 0, 5) t 
		 * ON e.ebook_no = t.ebook_no
		 */
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		Ebook ebook = null;
		String sql="SELECT t.ebook_no, e.ebook_title, e.ebook_img, e.ebook_price FROM ebook e INNER JOIN (SELECT ebook_no, COUNT(ebook_no) cnt"
				+" FROM orders GROUP BY ebook_no ORDER BY COUNT(ebook_no) DESC LIMIT ?, ?) t"
				+" ON e.ebook_no = t.ebook_no"; // 첫占쏙옙째 占쏙옙占싸울옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙짜占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow); // 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
		stmt.setInt(2, ROW_PER_PAGE); // 표占쏙옙占쏙옙 占쏙옙占� 占쏙옙占쏙옙
		System.out.println(stmt+"<------ dao.selectPopularEbookList - stmt"); //占쏙옙占쏙옙 占쏙옙 占식띰옙占쏙옙占� 확占쏙옙 
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			ebook = new Ebook();
			ebook.setEbookNo(rs.getInt("ebook_no")); //占쏙옙호 int
			ebook.setEbookTitle(rs.getString("ebook_title")); // 占싱몌옙 String
			ebook.setEbookImg(rs.getString("ebook_img"));
			ebook.setEbookPrice(rs.getInt("ebook_price"));
			list.add(ebook);
			
		}
		
		System.out.println("select ok from ebook");
		rs.close(); //DB 占쏙옙占쏙옙占싹는곤옙 占쏙옙占쏙옙占쏙옙占쏙옙 
		stmt.close();
		conn.close();
			
		return list;
	}
	
	
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
	//[admin/all] load book info
	public Ebook selectEbookOne(int ebookNo) throws ClassNotFoundException, SQLException {
		Ebook ebook = null;
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="SELECT ebook_no, ebook_title, ebook_author, ebook_company, ebook_page_count, ebook_summary, ebook_state, ebook_isbn, ebook_img, ebook_price FROM ebook WHERE ebook_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, ebookNo);
		System.out.println(stmt+"<----dao.selectEbookOne - stmt"); //check stmt
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			ebook = new Ebook();
			ebook.setEbookNo(rs.getInt("ebook_no"));
			ebook.setEbookImg(rs.getString("ebook_img"));
			ebook.setEbookPrice(rs.getInt("ebook_price"));
			ebook.setEbookAuthor(rs.getString("ebook_author"));
			ebook.setEbookTitle(rs.getString("ebook_title"));
			ebook.setEbookSummary(rs.getString("ebook_summary"));
			ebook.setEbookISBN(rs.getString("ebook_isbn"));
			ebook.setEbookState(rs.getString("ebook_state"));
			ebook.setEbookPageCount(rs.getInt("ebook_page_count"));
			ebook.setEbookCompany(rs.getString("ebook_company"));
		}
		return  ebook;
		
	}
	
	//[admin/user/all] select search option for ebook
	public ArrayList<Ebook> selectSearchEbookList(int beginRow, int ROW_PER_PAGE, String option, String searchText) throws ClassNotFoundException, SQLException{
		ArrayList<Ebook> list = new ArrayList<Ebook>();
		/*
		 * SELECT ebook_no, category_name, ebook_title, ebook_state FROM ebook ORDER BY create_date DESC LIMIT ?,?
		 */
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		Ebook ebook = null;
		String sql="";
		PreparedStatement stmt = null;
		if(option.equals("통합검색")) {
			
			sql="SELECT ebook_no, category_name, ebook_title, ebook_author, ebook_state, ebook_img, ebook_price FROM ebook "
					+ "WHERE category_name LIKE ? OR ebook_title LIKE ? OR ebook_author LIKE ? "
					+ "ORDER BY create_date ASC LIMIT ?,?";

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%"+searchText+"%");
			stmt.setString(2, "%"+searchText+"%");
			stmt.setString(3, "%"+searchText+"%");
			stmt.setInt(4, beginRow); 
			stmt.setInt(5, ROW_PER_PAGE); 
			
		}else{
			
			sql="SELECT ebook_no, category_name, ebook_title, ebook_author, ebook_state, ebook_img, ebook_price FROM ebook "
					+ "WHERE category_name = ? AND (ebook_title LIKE ? OR ebook_author LIKE ?)"
					+ " ORDER BY create_date ASC LIMIT ?,?";
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, option);
			stmt.setString(2, "%"+searchText+"%");
			stmt.setString(3, "%"+searchText+"%");
			stmt.setInt(4, beginRow); 
			stmt.setInt(5, ROW_PER_PAGE); 
			
		}
		
		System.out.println(stmt+"<------ dao.selectSearchEbookList - stmt"); 
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			ebook = new Ebook();
			ebook.setEbookNo(rs.getInt("ebook_no")); 
			ebook.setCategoryName(rs.getString("category_name")); 
			ebook.setEbookTitle(rs.getString("ebook_title")); 
			ebook.setEbookAuthor(rs.getString("ebook_author"));
			ebook.setEbookState(rs.getString("ebook_state")); 
			ebook.setEbookImg(rs.getString("ebook_img"));
			ebook.setEbookPrice(rs.getInt("ebook_price"));
			list.add(ebook);
			
		}
		
		System.out.println("select ok from ebook");
		rs.close(); 
		stmt.close();
		conn.close();
			
		return list;
		
	}
	
	//[admin/user/all] select all ebook 
	public ArrayList<Ebook> selectEbookList(int beginRow, int ROW_PER_PAGE) throws ClassNotFoundException, SQLException{
		ArrayList<Ebook> list = new ArrayList<Ebook>();
		/*
		 * SELECT ebook_no, category_name, ebook_title, ebook_state FROM ebook ORDER BY create_date DESC LIMIT ?,?
		 */
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		Ebook ebook = null;
		String sql="SELECT ebook_no, category_name, ebook_title, ebook_state, ebook_img, ebook_price FROM ebook"
				+" ORDER BY create_date ASC LIMIT ?,?"; // 첫占쏙옙째 占쏙옙占싸울옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙짜占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow); // 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
		stmt.setInt(2, ROW_PER_PAGE); // 표占쏙옙占쏙옙 占쏙옙占� 占쏙옙占쏙옙
		System.out.println(stmt+"<------ dao.selectEbookList - stmt"); //占쏙옙占쏙옙 占쏙옙 占식띰옙占쏙옙占� 확占쏙옙 
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			ebook = new Ebook();
			ebook.setEbookNo(rs.getInt("ebook_no")); //占쏙옙호 int
			ebook.setCategoryName(rs.getString("category_name")); //카占쌓곤옙占쏙옙 String
			ebook.setEbookTitle(rs.getString("ebook_title")); // 占싱몌옙 String
			ebook.setEbookState(rs.getString("ebook_state")); // 占실매삼옙占쏙옙 String
			ebook.setEbookImg(rs.getString("ebook_img"));
			ebook.setEbookPrice(rs.getInt("ebook_price"));
			list.add(ebook);
			
		}
		
		System.out.println("select ok from ebook");
		rs.close(); //DB 占쏙옙占쏙옙占싹는곤옙 占쏙옙占쏙옙占쏙옙占쏙옙 
		stmt.close();
		conn.close();
			
		return list;
		
	}
	//[admin/guest] ebook list print
	public ArrayList<Ebook> selectEbookListByCategory(int beginRow, int ROW_PER_PAGE, String categoryName) throws ClassNotFoundException, SQLException{
		ArrayList<Ebook> list = new ArrayList<Ebook>();
		
		/*
		 * SELECT ebook_no, category_name, ebook_title, ebook_state FROM ebook WHERE category_name=? ORDER BY create_date DESC LIMIT ?,?
		 */
		
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		Ebook ebook = null;
		String sql="SELECT ebook_no, category_name, ebook_title, ebook_author, ebook_company, ebook_state, ebook_img, ebook_price FROM ebook WHERE category_name=?"
				+" ORDER BY create_date ASC LIMIT ?,?"; 
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, categoryName);
		stmt.setInt(2, beginRow); 
		stmt.setInt(3, ROW_PER_PAGE);
		System.out.println(stmt+"<------ dao.selectEbookListByCategory - stmt"); 
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			ebook = new Ebook();
			ebook.setEbookNo(rs.getInt("ebook_no")); // int
			ebook.setCategoryName(rs.getString("category_name"));  //String
			ebook.setEbookTitle(rs.getString("ebook_title")); //  String
			ebook.setEbookState(rs.getString("ebook_state")); //  String
			ebook.setEbookImg(rs.getString("ebook_img"));
			ebook.setEbookPrice(rs.getInt("ebook_price"));
			ebook.setEbookCompany(rs.getString("ebook_company"));
			ebook.setEbookAuthor(rs.getString("ebook_author"));
			list.add(ebook);
			
		}
		
		System.out.println("select ok from ebook");
		rs.close(); //DB 占쏙옙占쏙옙占싹는곤옙 占쏙옙占쏙옙占쏙옙占쏙옙 
		stmt.close();
		conn.close();
			
		return list;
	}
	//[占쏙옙占쏙옙占쏙옙] ebook 占쏙옙체 카占쏙옙트, 카占쌓곤옙 카占쏙옙트
	public int CountEbookAll(int ROW_PER_PAGE, String categoryName) throws ClassNotFoundException, SQLException {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql;
		if(categoryName.equals("") == true) { //占쏙옙占쏙옙占싸곤옙占� 占쏙옙체 占쏙옙 占싯삼옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占싯삼옙占쏙옙占� 占쏙옙
			sql = "SELECT COUNT(*) from Ebook";
		} else {
			sql = "SELECT COUNT(*) from Ebook WHERE category_name LIKE "+"'%"+categoryName+"%'";
		}
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(stmt+"<-------Dao.CountEbookAll - stmt"); //占쏙옙占쏙옙 확占쏙옙
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
		
		rs.close(); //DB 占쏙옙占쏙옙占싹는곤옙 占쏙옙占쏙옙占쏙옙占쏙옙 
		stmt.close();
		conn.close();
		return lastPage;
		
	}
	
}


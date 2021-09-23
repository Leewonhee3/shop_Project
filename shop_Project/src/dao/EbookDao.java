package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import commons.DBUtil;
import vo.*;

public class EbookDao {
	
	//[관리자] ebook 전체 조회
	public ArrayList<Ebook> selectEbookList(int beginRow, int ROW_PER_PAGE) throws ClassNotFoundException, SQLException{
		ArrayList<Ebook> list = new ArrayList<Ebook>();
		/*
		 * SELECT ebook_no, category_name, ebook_title, ebook_state FROM ebook ORDER BY create_date DESC LIMIT ?,?
		 */
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		Ebook ebook = null;
		String sql="SELECT ebook_no, category_name, ebook_title, ebook_state FROM ebook"
				+" ORDER BY ebook_createdate ASC LIMIT ?,?"; // 첫번째 라인에 제일 빠른 생성 날짜가 나오도록
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow); // 현재 페이지
		stmt.setInt(2, ROW_PER_PAGE); // 표시할 목록 개수
		System.out.println(stmt+"<------ dao.selectEbookList - stmt");
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			ebook = new Ebook();
			ebook.setEbookNo(rs.getInt("ebook_no")); //번호 int
			ebook.setCategoryName(rs.getString("category_name")); //카테고리명 String
			ebook.setEbookTitle(rs.getString("ebook_title")); // 이름 String
			ebook.setEbookState(rs.getString("ebook_state")); // 판매상태 String
			list.add(ebook);
			
		}
		
		System.out.println("select ok from ebook");
		rs.close(); //DB 해제하는거 잊지말자 
		stmt.close();
		conn.close();
			
		return list;
		
	}
	//[관리자] ebook 카테고리별 조회
	public ArrayList<Ebook> selectEbookListByCategory(int beginRow, int ROW_PER_PAGE, String categoryName) throws ClassNotFoundException, SQLException{
		ArrayList<Ebook> list = new ArrayList<Ebook>();
		
		/*
		 * SELECT ebook_no, category_name, ebook_title, ebook_state FROM ebook WHERE category_name=? ORDER BY create_date DESC LIMIT ?,?
		 */
		
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		Ebook ebook = null;
		String sql="SELECT ebook_no, category_name, ebook_title, ebook_state FROM ebook WHERE category_name=?"
				+" ORDER BY ebook_createdate ASC LIMIT ?,?"; // 첫번째 라인에 제일 빠른 생성 날짜가 나오도록
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, categoryName);
		stmt.setInt(2, beginRow); // 현재 페이지
		stmt.setInt(3, ROW_PER_PAGE); // 표시할 목록 개수
		System.out.println(stmt+"<------ dao.selectEbookListByCategory - stmt");
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			ebook = new Ebook();
			ebook.setEbookNo(rs.getInt("ebook_no")); //번호 int
			ebook.setCategoryName(rs.getString("category_name")); //카테고리명 String
			ebook.setEbookTitle(rs.getString("ebook_title")); // 이름 String
			ebook.setEbookState(rs.getString("ebook_state")); // 판매상태 String
			list.add(ebook);
			
		}
		
		System.out.println("select ok from ebook");
		rs.close(); //DB 해제하는거 잊지말자 
		stmt.close();
		conn.close();
			
		return list;
	}
	//[관리자] ebook 전체 카운트, 카테고리 카운트
	public int CountEbookAll(int ROW_PER_PAGE, String categoryName) throws ClassNotFoundException, SQLException {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql;
		if(categoryName.equals("") == true) { //공백인경우 전체 값 검색어 있을경우 검색결과 값
			sql = "SELECT COUNT(*) from Ebook";
		} else {
			sql = "SELECT COUNT(*) from Ebook WHERE category_name LIKE "+"'%"+categoryName+"%'";
		}
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(stmt+"<-------Dao.CountEbookAll - stmt");//디버깅
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
		
		rs.close(); //DB 해제하는거 잊지말자 
		stmt.close();
		conn.close();
		return lastPage;
		
	}
}


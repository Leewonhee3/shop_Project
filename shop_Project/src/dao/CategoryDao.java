package dao;
import vo.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import commons.*;

public class CategoryDao {
	
	//[관리자] 카테고리 검색결과 출력
	public ArrayList<Category> SelectCategoryListAllBySearchCategoryName(int beginRow, int ROW_PER_PAGE, String searchCategoryName) {
		
		ArrayList<Category> returnCategoryList = new ArrayList<Category>();
		Category category = new Category();
		
		return returnCategoryList;
		/*카테고리 검색어가 있는 경우 카테고리명 받아서 select*/
	}
	
	
	//[관리자]카테고리 출력
	public ArrayList<Category> SelectCategoryListAllByPage(int beginRow, int ROW_PER_PAGE) throws ClassNotFoundException, SQLException {
	
		ArrayList<Category> returnCategoryList = new ArrayList<Category>();
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		Category category = null;
		String sql="SELECT category_name, category_state, update_date, create_date FROM category"
				+" ORDER BY create_date ASC LIMIT ?,?"; // 첫번째 라인에 제일 빠른 생성 날짜가 나오도록
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow); // 현재 페이지
		stmt.setInt(2, ROW_PER_PAGE); // 표시할 목록 개수
		System.out.println(stmt+"<------ dao.SelectCategoryListAllByPage - stmt");
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			category = new Category();
			category.setCategoryName(rs.getString("category_name")); //이름 String
			category.setCategoryState(rs.getString("category_state")); //상태 String
			category.setUpdateDate(rs.getString("update_date")); // 업데이트 날짜 String
			category.setCreateDate(rs.getString("create_date")); // 생성 날짜 String
			returnCategoryList.add(category);
			
		}
			System.out.println("select ok from Category");
			rs.close();
			stmt.close();
			conn.close();
			
			return returnCategoryList; // 성공시 카테고리 이름 상태 업데이트날짜, 생성날짜 반환 실패시 null
	}
		/*카테고리 검색어가 없는 경우 전체 데이터 select*/
	
	//[관리자]카테고리 상태수정 - 카테고리를 파라메터로 받아서 이름에 해당하는 카테고리의 상태를 업데이트 한다.
	public void updateCategoryState(Category category) throws ClassNotFoundException, SQLException {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		int check = 0; //정상실행 체크 변수
		String sql="UPDATE category SET category_state=? WHERE category_name=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.getCategoryState());
		stmt.setString(2, category.getCategoryName());
		System.out.println(stmt+"<------ dao.updateCategoryState - stmt");//쿼리 및 파라메터 확인
		check = stmt.executeUpdate(); //정상실행 되면 1이 저장됨
		if(check == 1) { // 체크값이 1인 경우
			System.out.println("카테고리 업데이트 성공");
		}else {
			System.out.println("카테고리 업데이트 실패");
		}
	}
	//[관리자]카테고리 추가 - 카테고리를 파라메터로 받아 category 테이블에 insert한다.
	public void insertCategory(Category category) throws ClassNotFoundException, SQLException {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		int check = 0; //정상실행 체크 변수
		String sql="INSERT INTO category(category_name, category_state, update_date, create_date) VALUES(?,?,NOW(),NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.getCategoryName());
		stmt.setString(2, category.getCategoryState());
		System.out.println(stmt+"<------ dao.insertCategory - stmt");//쿼리 및 파라메터 확인
		check = stmt.executeUpdate(); //정상실행 되면 1이 저장됨
		if(check == 1) { // 체크값이 1인 경우
			System.out.println("카테고리 추가 성공");
		}else {
			System.out.println("카테고리 추가 실패");
		}
		
	}
		
}


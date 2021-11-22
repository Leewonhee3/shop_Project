package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.SimpleFormatter;

import commons.DBUtil;
import dao.StatsDao;

public class StatsService {
	
	// 오늘 카운트와 전체 카운트를 호출
	public Map<String,Long> getStatsCount() {
		
		Map<String,Long> map = new HashMap<String,Long>();
		
		long todayCount=0;
		long totalCount=0;
		
		StatsDao statsDao = new StatsDao();
		Connection conn = null;
		
		SimpleDateFormat fomatter = new SimpleDateFormat("yyyy-MM-dd");
		Date d = new Date();
		String today = fomatter.format(d);// c날짜를 fomatter객체의 포맷방식으로 문자열 변경
		System.out.println(today+"<--StatsService.editStats");
		
		try {
			conn=DBUtil.getConnection();
			//conn.setAutoCommit(false);트랜젝션 관련
			todayCount=statsDao.selectTodayCount(conn, today);
			totalCount=statsDao.selectTotalCount(conn);
			map.put("todayCount",todayCount);
			map.put("totalCount", totalCount);
			//conn.commit();트랜젝션 관련
		}catch(Exception e) {
			/*
			try {
				
				conn.rollback();
				
			}catch(SQLException e1) {
			
				e1.printStackTrace(); 
				
			}
			트랜젝션 관련*/
			e.printStackTrace();
			
		}
		
		return map;
		
		
	}
	
	// 새로운 count값을 입력하거나 수정
	
	public void editStats() {
		
		StatsDao statsDao = new StatsDao();
		Connection conn = null;
		try {
			
			conn=DBUtil.getConnection();
			//conn.setAutoCommit(false); 트랜젝션 안하면 필요없음.
			
			SimpleDateFormat fomatter = new SimpleDateFormat("yyyy-MM-dd");
			Date d = new Date();
			String today = fomatter.format(d);// d날짜를 fomatter객체의 포맷방식으로 문자열 변경
			System.out.println(today+"<--StatsService.editStats");
			
			//캘린더 타입을 사용하는 경우
			//Calendar c = Calendar.getInstance();
			//String today = fomatter.format(c.getTime());
			
			long todayCount = statsDao.selectTodayCount(conn, today);
			
			//오늘 날짜 값이 없으면
			if(todayCount ==0) {
				
				statsDao.insertStats(conn, today);
				
			}else {
				
				statsDao.updateStatsByDay(conn, today);
				
			}
			
			conn.commit();
			
		}catch(Exception e){
			
			/*
			try {
			
				conn.rollback();
			
			}catch(SQLException e1) {
			
				e1.printStackTrace();
			
			}
			트랜젝션 관련*/
			e.printStackTrace();
			
		}finally {
			
			try {
				conn.close();
			}catch(SQLException e) {
				
				e.printStackTrace();
			}
			
		}
		
	}
		
}
	


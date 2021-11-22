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
	
	// ���� ī��Ʈ�� ��ü ī��Ʈ�� ȣ��
	public Map<String,Long> getStatsCount() {
		
		Map<String,Long> map = new HashMap<String,Long>();
		
		long todayCount=0;
		long totalCount=0;
		
		StatsDao statsDao = new StatsDao();
		Connection conn = null;
		
		SimpleDateFormat fomatter = new SimpleDateFormat("yyyy-MM-dd");
		Date d = new Date();
		String today = fomatter.format(d);// c��¥�� fomatter��ü�� ���˹������ ���ڿ� ����
		System.out.println(today+"<--StatsService.editStats");
		
		try {
			conn=DBUtil.getConnection();
			//conn.setAutoCommit(false);Ʈ������ ����
			todayCount=statsDao.selectTodayCount(conn, today);
			totalCount=statsDao.selectTotalCount(conn);
			map.put("todayCount",todayCount);
			map.put("totalCount", totalCount);
			//conn.commit();Ʈ������ ����
		}catch(Exception e) {
			/*
			try {
				
				conn.rollback();
				
			}catch(SQLException e1) {
			
				e1.printStackTrace(); 
				
			}
			Ʈ������ ����*/
			e.printStackTrace();
			
		}
		
		return map;
		
		
	}
	
	// ���ο� count���� �Է��ϰų� ����
	
	public void editStats() {
		
		StatsDao statsDao = new StatsDao();
		Connection conn = null;
		try {
			
			conn=DBUtil.getConnection();
			//conn.setAutoCommit(false); Ʈ������ ���ϸ� �ʿ����.
			
			SimpleDateFormat fomatter = new SimpleDateFormat("yyyy-MM-dd");
			Date d = new Date();
			String today = fomatter.format(d);// d��¥�� fomatter��ü�� ���˹������ ���ڿ� ����
			System.out.println(today+"<--StatsService.editStats");
			
			//Ķ���� Ÿ���� ����ϴ� ���
			//Calendar c = Calendar.getInstance();
			//String today = fomatter.format(c.getTime());
			
			long todayCount = statsDao.selectTodayCount(conn, today);
			
			//���� ��¥ ���� ������
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
			Ʈ������ ����*/
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
	


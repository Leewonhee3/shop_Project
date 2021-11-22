package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import commons.DBUtil;
import dao.StatsDao;

public class StatsService {
	public void editStats() {
		StatsDao statsDao = new StatsDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			// 날짜를 특정 포맷의 글자타입으로
			SimpleDateFormat fomatter = new SimpleDateFormat("yyyy-MM-dd");
			Date d = new Date();
			String today = fomatter.format(d); // d날짜를 fomatter객체의 포맷방식으로 문자열변경
			System.out.println(today + " <-- StatsService.editStats()");
			// Calendar타입을 사용했을 경우
			// Calendar c = Calendar.getInstance();
			// String today = fomatter.format(c.getTime());
			
			long todayCount = statsDao.selectTodayCount(conn, today);
			// 오늘 날짜값이 없으면
			if(todayCount == 0) {
				statsDao.insertStats(conn, today);
			} else {
				statsDao.updateStatsByDay(conn, today);
			}
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}

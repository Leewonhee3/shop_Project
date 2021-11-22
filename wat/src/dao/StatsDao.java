package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StatsDao {
	// 1) 날짜가 존재하지 않는 경우 카운팅 -> count=1 insert
	public void insertStats(Connection conn, String today) throws SQLException {
		String sql ="INSERT INTO stats(day,count) VALUES(?,1)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, today);
		stmt.executeUpdate();
		stmt.close();
	}
	// 2) 날짜 존재하는 경우 카운팅 -> count+1 update
	public void updateStatsByDay(Connection conn, String today) throws SQLException {
		String sql = "UPDATE stats SET count = count+1 WHERE day=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, today);
		stmt.executeUpdate();
		stmt.close();
	}
	// 3) 오늘 접속자수 where select
	public long selectTodayCount(Connection conn, String today) throws SQLException {
		long todayCount = 0;
		String sql = "SELECT count FROM stats WHERE day = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, today);;
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			todayCount = rs.getLong("count");
		}
		rs.close();
		stmt.close();
		return todayCount; // 0이면 오늘날짜의 카운터가 없다
	}
	
	// 4) 총 접속자수 sum() select
	public long selectTotalCount(Connection conn) throws SQLException {
		long totalCount = 0;
		String sql = "SELECT COUNT(count) tcnt FROM stats";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			totalCount = rs.getLong("tcnt");
		}
		rs.close();
		stmt.close();
		return totalCount;
	}
}

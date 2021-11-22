package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StatsDao {
	
	// ��¥�� �������� ���� ��� ī���� ->insert
	
	public void insertStats(Connection conn, String today)throws SQLException{
		
		String sql = "INSERT INTO stats(day,count) VALUES(?,1)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, today);
		stmt.executeUpdate();
		stmt.close();
	}
	
	//��¥ �����ϴ� ��� ī���� -> count+1 update
	
	public void updateStatsByDay(Connection conn, String today)throws SQLException {
		
		String sql = "UPDATE stats SET count = count+1 WHERE day=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, today);
		stmt.executeUpdate();
		stmt.close();
		
	}
	
	
	//ī���� �� ���� ��¥ �������� -> where select
	
	//���� �����ڼ� where select
	
	public long selectTodayCount(Connection conn, String today) throws SQLException {
		
		long todayCount=0;
		String sql = "SELECT count FROM stats WHERE day =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, today);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			
			todayCount=rs.getLong("count");
			
		}
		
		rs.close();
		stmt.close();
		
		return todayCount;
		 // 0�̸� ���� ��¥�� ī���Ͱ� ����.
	}
	
	
	//�� �����ڼ� sum() select
	
	public long selectTotalCount(Connection conn) throws SQLException {
		
		long totalCount=0;
		String sql = "SELECT SUM(count) tcnt FROM stats";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			
			totalCount=rs.getLong("tcnt");
			
		}
		
		rs.close();
		stmt.close();
		
		return totalCount;
		
	}
}

package commons;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	
	public static Connection getConnection() {
		
		Connection conn = null;
		
		try {
			
			conn= DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/mvc", "root", "java1004");
			
		}catch(Exception e){
			
			e.printStackTrace();
			
		}
		
		return conn;
		
		
	}
	
}

package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class DBListener implements ServletContextListener {

    // 서버 종료시
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

    // 서버 시작시 
    public void contextInitialized(ServletContextEvent sce)  { 

    	try {
    		
    		Class.forName("org.mariadb.jdbc.Driver");
    		
    	}catch(ClassNotFoundException e) {
    		
    		e.printStackTrace();
    		
    	}
    }
	
}

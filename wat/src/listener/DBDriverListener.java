package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class DBDriverListener implements ServletContextListener {

    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }
    
    // 톰켓이 부팅될때 org.mariadb.jdbc.Driver를 메모리에 로딩
    public void contextInitialized(ServletContextEvent sce)  { 
         try {
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("org.mariadb.jdbc.Driver로딩 성공! <-- DBDriverListener.contextInitialized()");
		} catch (ClassNotFoundException e) {
			System.out.println("org.mariadb.jdbc.Driver로딩 실패! <-- DBDriverListener.contextInitialized()");
			e.printStackTrace();
		}
    }
}
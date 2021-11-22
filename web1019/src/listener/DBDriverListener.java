package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class DBDriverListener implements ServletContextListener {

	//톰캣이 시작할때 마리아db 드라이버를 메모리에 로딩한다.
	public void contextInitialized(ServletContextEvent sce)  { 
        
		try {
			
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("db드라이버 로딩 성공 <------ DBDriverListener");
			
        }catch(ClassNotFoundException e) {
        	
        	System.out.println("db드라이버 로딩 실패 <------ DBDriverListener");
        	e.printStackTrace();
        	
        }
		
    }
	
    public void contextDestroyed(ServletContextEvent sce)  { 
         
    	
    	
    }
	
}

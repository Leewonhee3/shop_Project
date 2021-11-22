package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class DBDriverListener implements ServletContextListener {

	//��Ĺ�� �����Ҷ� ������db ����̹��� �޸𸮿� �ε��Ѵ�.
	public void contextInitialized(ServletContextEvent sce)  { 
        
		try {
			
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("db����̹� �ε� ���� <------ DBDriverListener");
			
        }catch(ClassNotFoundException e) {
        	
        	System.out.println("db����̹� �ε� ���� <------ DBDriverListener");
        	e.printStackTrace();
        	
        }
		
    }
	
    public void contextDestroyed(ServletContextEvent sce)  { 
         
    	
    	
    }
	
}

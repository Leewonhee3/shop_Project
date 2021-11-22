package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class DriveListener
 *
 */
@WebListener
public class DriveListener implements ServletContextListener {

	// ��Ĺ�� �����Ҷ�
    
    public void contextInitialized(ServletContextEvent sce)  { 
        
    	try {

        	Class.forName("org.mariadb.jdbc.Driver");
        	System.out.println("��Ĺ ����� ������db ����̹� �ε�");
    		
    	}catch(ClassNotFoundException e){
    		
    		e.printStackTrace();
    		
    	}
    	
   }

	
	//��Ĺ�� ����ɶ�
    
	public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }	
}

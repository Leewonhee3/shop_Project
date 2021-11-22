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

	// ÅèÄ¹ÀÌ ½ÃÀÛÇÒ¶§
    
    public void contextInitialized(ServletContextEvent sce)  { 
        
    	try {

        	Class.forName("org.mariadb.jdbc.Driver");
        	System.out.println("ÅèÄ¹ ½ÇÇà½Ã ¸¶¸®¾Ædb µå¶óÀÌ¹ö ·Îµù");
    		
    	}catch(ClassNotFoundException e){
    		
    		e.printStackTrace();
    		
    	}
    	
   }

	
	//ÅèÄ¹ÀÌ Á¹·áµÉ¶§
    
	public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }	
}

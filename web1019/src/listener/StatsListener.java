package listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import service.StatsService;


@WebListener
public class StatsListener implements HttpSessionListener {

   //���� ������ ����Ǵ� �޼ҵ�
    public void sessionCreated(HttpSessionEvent se)  { 
         
    	System.out.println("���ο� ������ �����Ǿ����ϴ�.");
         StatsService statsService = new StatsService();
         statsService.editStats();
    
    }
   //���� �Ҹ�� ����Ǵ� �޼ҵ�
    public void sessionDestroyed(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    }
	
}

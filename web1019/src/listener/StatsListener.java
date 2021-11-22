package listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import service.StatsService;


@WebListener
public class StatsListener implements HttpSessionListener {

   //세션 생성시 실행되는 메소드
    public void sessionCreated(HttpSessionEvent se)  { 
         
    	System.out.println("새로운 세션이 생성되었습니다.");
         StatsService statsService = new StatsService();
         statsService.editStats();
    
    }
   //세션 소멸시 실행되는 메소드
    public void sessionDestroyed(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    }
	
}

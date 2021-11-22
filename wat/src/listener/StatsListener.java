package listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import service.StatsService;

@WebListener
public class StatsListener implements HttpSessionListener {
	// session이 새로 생성시 실행되는 메서드
    public void sessionCreated(HttpSessionEvent se)  { 
        System.out.println("새로운 세션이 생성 되었습니다.");
        StatsService statsService = new StatsService();
        statsService.editStats();   
    }
    // session이 소멸될때 실행되는 메서드
    public void sessionDestroyed(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    }
}

package p1005;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class MyFrame extends JFrame {
   
   private JPanel jpanel;
   private JLabel jlabel;
   private JButton jbutton;
   
   public MyFrame() {
	   
      super(); // JFrame()
      jpanel = new JPanel(new FlowLayout()); // 패널을 생성하면서 레이아웃 설정
      add(jpanel);
      
      jlabel = new JLabel("버턴 클릭");
      jpanel.add(this.jlabel);
      
      //버튼 클릭 이벤트 처리 - 다형성 문법
      jbutton = new JButton("확인");
      ActionListener l = null;
      
      //ActionListener l = new ActionListener(); // 추상클래스나 인터페이스는 객체를 만들수 없다. 추상메소드가 있으므로..
      //ActionListener의 구현체가 있어야한다.
      l = new MyListener(); //인터페이스 변수가 인터페이스 구현클래스의 객체를 참조 -> 다형성
      
      ActionListener l2 = new ActionListener() { //익명 클래스(익명 객체)
		
		@Override
		public void actionPerformed(ActionEvent e) {

			System.out.println("hello2");
			
		}
		
	};
      
      
      jbutton.addActionListener(l2);
      jpanel.add(this.jbutton);
   
   }
   
   public static void main(String[] args) {
	   
	   MyFrame f = new MyFrame();
	   f.setTitle("버튼 테스트");
	   f.setVisible(true);
	   f.setSize(400,400);
	   f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	   
   }
   
}

class MyListener implements ActionListener{
	
	@Override
	public void actionPerformed(ActionEvent e) {
		System.out.println("hello");
		
	}
}



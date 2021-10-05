package p1001;

import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class MyFrame extends JFrame{

	private JPanel jpanel;
	private JLabel jlabel;
	private JButton jbutton;
	
	public MyFrame(){
		
		super(); //JFrame()
		jpanel = new JPanel(new FlowLayout());
		add(jpanel);
		
		jlabel = new JLabel("버튼 클릭");
		add(jlabel);
		
		jbutton = new JButton("확인");
		add(jbutton);
		
}
	
	//상속으로 기존 클래스를 재활용하여 코드를 줄였음.
	
	/*
	   public MyFrame() {
	      super(); // JFrame()
	      this.jpanel = new JPanel(new FlowLayout()); // 패널을 생성하면서 레이아웃 설정
	      this.add(this.jpanel);
	      this.jlabel = new JLabel("버턴 클릭");
	      this.add(this.jlabel);
	      this.jbutton = new JButton("확인");
	      this.jpanel.add(this.jbutton);
	   } 디스 포함
	    */

}

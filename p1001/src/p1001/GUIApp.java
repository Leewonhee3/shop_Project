package p1001;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JFrame;// java swing
import javax.swing.JLabel;
import javax.swing.JPanel;

public class GUIApp {

	public static void main(String[] args) {
		
		// 창(window) - Frame
		JFrame f = new JFrame();
		f.setSize(400,400);
		f.setTitle("GUIApp Test");

		//JFrame클래스 안에 public static EXIT_OM_CLOSE =3;
		//디폴트 클로즈 메소드안에 상수 3을 넣으면 종료되지만 가독성이 좋지 않다.
		//EXIT_ON_CLOSE == final 3
		
		JPanel jpanel = new JPanel(new FlowLayout()); //패널을 생성하면서 레이아웃 설정
		f.add(jpanel);
		
		JLabel jlabel = new JLabel("확인 버튼을 클릭하세요");
		jpanel.add(jlabel);
		
		JButton jbutton = new JButton("확인");
		jpanel.add(jbutton);
	
		f.setVisible(true);
		f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
	}

}

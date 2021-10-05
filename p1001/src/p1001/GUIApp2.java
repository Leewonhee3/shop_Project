package p1001;

import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class GUIApp2 {

public static void main(String[] args) {
		
		MyFrame f = new MyFrame();
		f.setTitle("프레임 상속 테스트");
		f.setVisible(true);
		f.setSize(400,400);
		f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	
	}
	
}

package p1001;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JFrame;// java swing
import javax.swing.JLabel;
import javax.swing.JPanel;

public class GUIApp {

	public static void main(String[] args) {
		
		// â(window) - Frame
		JFrame f = new JFrame();
		f.setSize(400,400);
		f.setTitle("GUIApp Test");

		//JFrameŬ���� �ȿ� public static EXIT_OM_CLOSE =3;
		//����Ʈ Ŭ���� �޼ҵ�ȿ� ��� 3�� ������ ��������� �������� ���� �ʴ�.
		//EXIT_ON_CLOSE == final 3
		
		JPanel jpanel = new JPanel(new FlowLayout()); //�г��� �����ϸ鼭 ���̾ƿ� ����
		f.add(jpanel);
		
		JLabel jlabel = new JLabel("Ȯ�� ��ư�� Ŭ���ϼ���");
		jpanel.add(jlabel);
		
		JButton jbutton = new JButton("Ȯ��");
		jpanel.add(jbutton);
	
		f.setVisible(true);
		f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
	}

}

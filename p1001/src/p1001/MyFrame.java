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
		
		jlabel = new JLabel("��ư Ŭ��");
		add(jlabel);
		
		jbutton = new JButton("Ȯ��");
		add(jbutton);
		
}
	
	//������� ���� Ŭ������ ��Ȱ���Ͽ� �ڵ带 �ٿ���.
	
	/*
	   public MyFrame() {
	      super(); // JFrame()
	      this.jpanel = new JPanel(new FlowLayout()); // �г��� �����ϸ鼭 ���̾ƿ� ����
	      this.add(this.jpanel);
	      this.jlabel = new JLabel("���� Ŭ��");
	      this.add(this.jlabel);
	      this.jbutton = new JButton("Ȯ��");
	      this.jpanel.add(this.jbutton);
	   } �� ����
	    */

}

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
      jpanel = new JPanel(new FlowLayout()); // �г��� �����ϸ鼭 ���̾ƿ� ����
      add(jpanel);
      
      jlabel = new JLabel("���� Ŭ��");
      jpanel.add(this.jlabel);
      
      //��ư Ŭ�� �̺�Ʈ ó�� - ������ ����
      jbutton = new JButton("Ȯ��");
      ActionListener l = null;
      
      //ActionListener l = new ActionListener(); // �߻�Ŭ������ �������̽��� ��ü�� ����� ����. �߻�޼ҵ尡 �����Ƿ�..
      //ActionListener�� ����ü�� �־���Ѵ�.
      l = new MyListener(); //�������̽� ������ �������̽� ����Ŭ������ ��ü�� ���� -> ������
      
      ActionListener l2 = new ActionListener() { //�͸� Ŭ����(�͸� ��ü)
		
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
	   f.setTitle("��ư �׽�Ʈ");
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



package p1001;

public class Phone {

	public boolean power;
	public int number;
	
	public void power() {
		
		this.power = !this.power;
	
	}
	
	public void send() {
		
		if(this.power) {
			
			System.out.println("��ȭ�ɱ�");
			
		}
	}

	public void receive() {
		
		if(this.power) {
			System.out.println("��ȭ�ޱ�");
		}
	}
	
	//�׽�Ʈ �ڵ�
	// �׽�Ʈ �ڵ� > ����� �ڵ� .�׽�Ʈ �ڵ�ȿ� ����� �ڵ� �������� ���� ���� �ٸ� ������
	
	public static void main(String args[]) {
		
		Phone p = new Phone();
		p.power();
		// power() �޼ҵ���� this�� p ���ε�
		
		/*
		Phone p2 = new Phone();
		p2.power();
		
		// power() �޼ҵ���� this�� p2 ���ε�
		*/
		
		p.send();
		
	}
}

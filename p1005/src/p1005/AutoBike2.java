package p1005;

public class AutoBike2 extends Bike2{

	public boolean power;
	
	public AutoBike2() {
	
		//����Ʈ �����ڸ� �����°��� ����.
		
	}
	
	/*
	 * ��ӹ޴� �θ� Ŭ������ �Ű������� ���� ����Ʈ �����ڰ� ��� ������ �߻��Ѵ�.
	public AutoBike2() {
		super(); // Bike2�� ������
	}
	*/
	
	public AutoBike2(int wheel) { //�Ű������� ���� �����ڸ� ���ָ� ��
		
		super(wheel);
	
	}
	
	public void power() {
		
		power = !power; //true
		
		if(power) {
			
			System.out.println("������ �������ϴ�.");
		
		}else {
			
			System.out.println("������ �������ϴ�.");
			
		}
		
	}
	
	public static void main(String[] args) {
		
		AutoBike2 ab1 = new AutoBike2(2);
		
		ab1.power(); // ab1.power -> true
		ab1.drive();
		System.out.println("����"+ab1.wheel+"���� ��������.");
		ab1.stop();
		
		Bike2 b = null;
		b = ab1; //������
		//b.power(); //�θ�Ÿ���� ���������̱� ������ ȣ�� �Ұ���. �ٸ� ����ȯ�Ͽ� ��� ���� ((AutoBike2)b).power();
	
		b.drive(); // �θ�Ÿ������ ȣ�������� ���� ��ü�� drive ȣ��
		
		AutoBike2 ab2 = null;
		ab2 = (AutoBike2)b;
		ab2.power();
		ab2.drive();
		ab2.stop();
		
	}

}

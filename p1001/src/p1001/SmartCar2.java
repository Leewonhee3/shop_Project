package p1001;

// �䱸����
// ���������� ������ ����Ʈ �ڵ��� �ʿ�
// ���������̶�� �Ѱ��� ��ɿܴ� Car�� ��ġ
// ���� CarŬ������ ��Ȱ�� �غ���
// 2) ���� (has a ����)
// �����ϴ� ����� "���� ������ ī�Ǻ����� ������ �Ұ����ϴ�" �������� �ذ�

public class SmartCar2 {
	
	// CarŸ���� �ʵ�� ����
	public Car car;
	
	// ���� �߰��� �κ�
	public void selfDrive() {
		
		System.out.println("���� ����");
		
	}
	
	//���θ޼ҵ带 �߰��Ͽ� �ڵ� �׽�Ʈ
		public static void main(String[] args) {
			
			SmartCar2 sm2 = new SmartCar2();
			sm2.car = new Car(); //car ��ü���� �ʿ�
			sm2.car.name = "�׷���"; 
			sm2.car.color = "black";
			sm2.car.cc = 3000; // SmartCar2 Ŭ������ ���� ���� Car�� �߰��� �ʵ尡 ��밡��
			System.out.println(sm2.car.cc);//3000
			
		}

}

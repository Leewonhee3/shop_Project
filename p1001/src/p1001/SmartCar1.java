package p1001;

//�䱸����
//���������� ������ ����Ʈ �ڵ��� �ʿ�
//���������̶�� �Ѱ��� ��ɿܴ� Car�� ��ġ
//���� CarŬ������ ��Ȱ�� �غ���
//1) ����
//������ : ���� ������ ī�Ǻ����� ������ �Ұ����ϴ� -> ���� ��� x

public class SmartCar1 {
	
	// Car�� ������ �κ�
	public String name;
	public String color;
	public int cc; // ������ cc�ʵ尡 �߰��Ǹ� ���纻�� cc�ʵ� �߰��� �ʿ�
	
	public void drive() {
		
		System.out.println("����");
	
	}
	
	//���� �߰��� �κ�
	public void selfDrive() {
	
		System.out.println("���� ����");
	
	}
	
	// ���θ޼��带 �߰��Ͽ� �ڵ� �׽�Ʈ
	public static void main(String[] args) {
		
		SmartCar1 sm1 = new SmartCar1();
		sm1.name = "�׷���";
		sm1.color = "black";
		// sm1.cc = 3000; // ���纻�� cc�ʵ尡 �߰��� �ʿ�
			
	}

}


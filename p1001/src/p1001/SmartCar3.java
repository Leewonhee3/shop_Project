package p1001;

// �䱸����
// ���������� ������ ����Ʈ �ڵ��� �ʿ�
// ���������̶�� �Ѱ��� ��ɿܴ� Car�� ��ġ
// ���� CarŬ������ ��Ȱ�� �غ���
// 3) (is a ����) - ��ü���⿡�� ���� ������� ��ü���⹮������ ��밡��(ex:�������̵�)

public class SmartCar3 extends Car {
	
	//���� �߰��� �κ�
	public void selfDrive() {
		
		System.out.println("���� ����");
		
	}
	
	public static void main(String[] args) {
		
		SmartCar3 sm3 = new SmartCar3();
		sm3.name = "�׷���";
		sm3.color = "black";
		sm3.cc = 3000; // SmartCar3 Ŭ������ ���� ���� Car�� �߰��� �ʵ尡 ��밡��
		System.out.println(sm3.cc);//3000
		
	}
}

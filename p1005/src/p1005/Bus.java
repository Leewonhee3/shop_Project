package p1005;

public class Bus extends Car{
	
	/*
	 * 1. �ʵ� ���忡�� ����� ����
	 * �θ� ���� �ʵ带 �״�� ���� �޴´�.
	 * 
	 * 2. �޼ҵ� ���忡�� ����� ����
	 * 1)�θ� ���� �޼ҵ带 �״�� �����޴´�.
	 * 2)�θ� ���� �޼ҵ带 ������ �� �� �ִ�. -> �޼ҵ��� �������̵�
	 * */
	public void move() {
		
		System.out.println("������ �����δ�.");
		
	}
	
	public static void main(String[] args) {
	
		Bus bus = new Bus();
		bus.name = "500��";
		bus.move();
		
		Car car = new Car();
		car.move();
		
	}
	
}

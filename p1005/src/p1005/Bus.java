package p1005;

public class Bus extends Car{
	
	/*
	 * 1. 필드 입장에서 상속을 설명
	 * 부모가 가진 필드를 그대로 물려 받는다.
	 * 
	 * 2. 메소드 입장에서 상속을 설명
	 * 1)부모가 가진 메소드를 그대로 물려받는다.
	 * 2)부모가 가진 메소드를 재정의 할 수 있다. -> 메소드의 오버라이딩
	 * */
	public void move() {
		
		System.out.println("경유로 움직인다.");
		
	}
	
	public static void main(String[] args) {
	
		Bus bus = new Bus();
		bus.name = "500번";
		bus.move();
		
		Car car = new Car();
		car.move();
		
	}
	
}

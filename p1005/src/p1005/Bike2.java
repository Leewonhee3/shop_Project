package p1005;

public class Bike2 {

	public int wheel;
	
	public Bike2() {
		
		//디폴트 생성자를 가지는게 좋다.
		
	}
	
	public Bike2(int wheel) {

		this.wheel = wheel;
	
	}
	
	public void drive() {
		
		System.out.println("움직인다.");
		
	}
	
	
	public void stop() {
		
		System.out.println("멈춘다.");
		
	}
	
}

package p1005;

public class AutoBike2 extends Bike2{

	public boolean power;
	
	public AutoBike2() {
	
		//디폴트 생성자를 가지는것이 좋다.
		
	}
	
	/*
	 * 상속받는 부모 클래스에 매개변수가 없는 디폴트 생성자가 없어서 오류가 발생한다.
	public AutoBike2() {
		super(); // Bike2의 생성자
	}
	*/
	
	public AutoBike2(int wheel) { //매개변수를 갖는 생성자를 써주면 됨
		
		super(wheel);
	
	}
	
	public void power() {
		
		power = !power; //true
		
		if(power) {
			
			System.out.println("전원이 켜졌습니다.");
		
		}else {
			
			System.out.println("전원이 꺼졌습니다.");
			
		}
		
	}
	
	public static void main(String[] args) {
		
		AutoBike2 ab1 = new AutoBike2(2);
		
		ab1.power(); // ab1.power -> true
		ab1.drive();
		System.out.println("바퀴"+ab1.wheel+"개가 굴러간다.");
		ab1.stop();
		
		Bike2 b = null;
		b = ab1; //다형성
		//b.power(); //부모타입의 참조변수이기 때문에 호출 불가함. 다만 형변환하여 사용 가능 ((AutoBike2)b).power();
	
		b.drive(); // 부모타입으로 호출했으나 실제 객체의 drive 호출
		
		AutoBike2 ab2 = null;
		ab2 = (AutoBike2)b;
		ab2.power();
		ab2.drive();
		ab2.stop();
		
	}

}

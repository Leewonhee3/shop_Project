package p1005;

public abstract class Unit {
	
	//추상 클래스는 구현부가 없는 추상메소드 사용할 수 있고 일반 메소드도 사용 가능함 다만 추상클래스는 객체 사용 불가능
	
	// 구현부가 없는 메소드 -> 추상메소드
	public abstract void attack();

	public void test() {
		
		System.out.println("test");
		
	}
	
	
	/*
	public void attack() {
		
		System.out.println("공격");
	
	}
	*/
	
}

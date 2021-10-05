package p1005;

//클래스 앞에 final이 붙으면 클래스를 상속할 수 없다.(자식 클래스를 만들 수 없다.)
public final class Ex1 {

	// 1) 변수 앞에 final이 붙으면 값을 수정할 수 없다.
	public final int MAX_NUM = 100; // 수정할 수 없는 상수(const)
	
	/*
	public void test(int num) {
		
		this.MAX_NUM = num; // 불가능
		
	}
	*/
	
	// 2) 메소드 앞에 final이 붙으면 메소드를 오버라이딩 할 수 없다.
	
	public final void play() {
		
		System.out.println("play~");
		
	}
	
/*
 * 
 * 다형성
 * 추상메소드(구현부가 없는 미완성 메소드)
 * 추상클래스(타입)
 * 인터페이스(타입)
 * final
 * 
 * 매개변수의 다형성 -> 익명클래스
 * */	
	
}

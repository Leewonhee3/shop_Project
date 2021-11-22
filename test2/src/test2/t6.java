package test2;

public class t6 {
	
/*
 *  에러가 발생한다.
 *  
 *  test메소드의 파라미터는 Testable 타입으로 받아야 하는데
 *  29줄에서 Ship 클래스는 Testable 인터페이스를 상속받지 않았기 때문에
 *  17줄 r.test(s)에서 에러가 발생하였다. 
 *  
 *  29줄에 implements Testable{}을 추가하면 정상적으로 실행된다.
 * 
 *  instanceof는 객체가 어떤 타입인지 확인 할 수 있는 내장함수로 어떤 클래스인지 또는 어떤 클래스를 상속받았는지 참,거짓으로 나타낸다.
 *  
 *  실행결과
 *  
 *  test하다
	test하다
	test하다
 *  
 * 
 * */
	public static void main(String[] args) {
		Car c = new Car();
		Ship s = new Ship();
		Robot r = new Robot(); 
		r.test(c);
		r.test(s);
		r.test(r);
	}
}
	class Elect{ 
		int value;
	}
	
	interface Testable{}
	
	class Car extends Elect implements Testable{}
	
	class Ship extends Elect implements Testable{} // implements Testable{} 추가
	
	class Robot extends Elect implements Testable{
		void test(Testable t){
			if(t instanceof Elect){ // t가 Elect클래스에 해당하면 참 아니면 거짓
				System.out.println("test하다");
			}
		}
	}


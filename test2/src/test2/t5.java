package test2;

public class t5 {
/*
 * 출력결과
 * 
 * first
   second
   third
 * 
 * 에러가 발생하지는 않았다.
 * 
 * 추상클래스는 추상 메소드와 일반 메소드를 사용할 수 있으며 new하여 생성할 수 없다.
 * 예제에서는 Test 클래스가 Template을 상속받고 Template의 추상메소드인 first()와 second()를 오버라이딩하여 구현하였다.
 * third()는 일반메소드로 final로 선언하였기 때문에 Test에서 오버라이딩 할 수 없다. 이렇게 공통된 요소는 추상클래스에 보존하고
 * 변경이 필요한 메소드만 자식클래스에서 구현하는 것을 템플릿 메소드 패턴이라고 한다. 상속받는 자식클래스들의 오버라이드 중복을 최소화 할 수 있다.
 * 
 * 
 * */
	
	public static void main(String[] args){
		Template t = new Testa(); //Template을 상속받는 자식 클래스들을 담을 수 있다. 다형성
		t.play();		
	}
}

abstract class Template{
	void play(){
	first();
	second();
	third();
	}
	
	abstract void first(); // 추상 메소드
	abstract void second(); 
	final void third(){System.out.println("third");} // 탬플릿 메소드 
}

class Testa extends Template{
	
	@Override
	void first() {System.out.println("first");}
	@Override
	void second() {System.out.println("second");}
	
}


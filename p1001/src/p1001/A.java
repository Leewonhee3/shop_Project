package p1001;

//기본적으로 클래스 코드를 만들면 자동으로 추가되는 코드중 일부 중요한 4가지

import java.lang.*; // 4)java.lang 패키지 클래스는 자주 사용되기 때문

public class A extends Object{ // 1) extends Object
	
	public A() { // 2) 디폴트 생성자
		
		super(); // 3) 부모생성자를 호출하는 코드, 이코드에서 super()---> Object()
		
	}
	
}

package test2;

import java.io.*;
public class t8 {
	
	/*
	 * 1번에서 에러가 발생한다.
	 * 
	 * 자식메소드에서 오버라이드 할때 부모 메소드와 반환 자료형, 메소드명, 매개 변수 자료형이 모두 일치해야 한다.
		접근 제한자를 변경할 경우 부모가 가진 원조 메소드보다 더 큰 범위로만 변경할 수 있다.
		예외 처리 시 (try catch) 부모 메소드 보다 예외의 갯수가 더 많으면 안된다.
		
	 * 
	 * 
	 * */
	/*
	class Parent {
		protected void test(int x) throws Exception{}
	}
	
	class Child extends Parent{
		@Override
		void test(int x) throws Exception{} 
		//부모클래스의 메소드 접근제한자가 protected인데 그보다 더 위인 default 접근자로 오버라이딩 하여 에러가 발생한다.
		//public이나 protected 사용해야한다.
	}
	
	class Parent {
		 protected void test(int x) throws Exception{}
		}
		class Child extends Parent{
		 @Override
		 public void test(int x) throws Exception{}// 접근제한자가 protected보다 낮은 public으로 변경하여 오버라이딩 되었다.
		}

		
		import java.io.*;
		class Parent {
		 protected void test(int x) throws Exception{}
		}

		class Child extends Parent{ // 접근제한자가 동일하고 예외에 대한 변경은 하지 않아 오버라이딩 되었다.
		 @Override
		 protected void test(int x){}
		}

		
		class Parent {
		 protected void test(int x) throws Exception{}
		}

		class Child extends Parent{
		 @Override
		 protected void test(int x) throws IOException{} // 접근제한자가 동일하고 Exception의 하위 예외이므로 오버라이딩 되었다.
		}
}
*/
}

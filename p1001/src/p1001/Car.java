package p1001;

public class Car {
	
	public String name;
	public String color;
	
	public void drive() {
		System.out.println("주행");
	}
	
	// 나중에 추가된 부분
	public int cc; // 문제점 : 원본 수정시 카피본들의 수정이 불가피하다 -> 절대 사용 x
	
}

// 요구사항
// 자율주행이 가능한 스마트 자동차 필요
// 자율주행이라는 한가지 기능외는 Car와 일치
// 기존 Car클래스를 재활용 해보자
// 1) 복사 -> 원본 수정시 카피본들의 수정이 불가피하다.
// 2) 포함(객체지향언어가 아니라도 사용 가능 : 객체지향언어가 나오기 전부터 사용)
// 3) 상속(객체지향언어가 나오면서 사용 가능)
// 자바상속
// - extends 키워드 사용
// - 단일상속만 가능 : class A extends b,c 이런 다중상속 불가
// - 모든 클래스는 Object클래스를 상속 : class A extends Object
// - 객체생성시 new 연산자 사용, new 연산자 새로운 메모리공간에 객체를 만들때 부모 클래스 객체를 먼저 만든다.

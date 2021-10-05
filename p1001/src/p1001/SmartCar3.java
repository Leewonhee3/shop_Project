package p1001;

// 요구사항
// 자율주행이 가능한 스마트 자동차 필요
// 자율주행이라는 한가지 기능외는 Car와 일치
// 기존 Car클래스를 재활용 해보자
// 3) (is a 관계) - 객체지향에서 나온 방법으로 객체지향문법들을 사용가능(ex:오버라이딩)

public class SmartCar3 extends Car {
	
	//새로 추가한 부분
	public void selfDrive() {
		
		System.out.println("자율 주행");
		
	}
	
	public static void main(String[] args) {
		
		SmartCar3 sm3 = new SmartCar3();
		sm3.name = "그랜즈";
		sm3.color = "black";
		sm3.cc = 3000; // SmartCar3 클래스의 수정 없이 Car에 추가된 필드가 사용가능
		System.out.println(sm3.cc);//3000
		
	}
}

package p1001;

// 요구사항
// 자율주행이 가능한 스마트 자동차 필요
// 자율주행이라는 한가지 기능외는 Car와 일치
// 기존 Car클래스를 재활용 해보자
// 2) 포함 (has a 관계)
// 복사하는 방법의 "원본 수정시 카피본들의 수정이 불가피하다" 문제점을 해결

public class SmartCar2 {
	
	// Car타입을 필드로 포함
	public Car car;
	
	// 새로 추가한 부분
	public void selfDrive() {
		
		System.out.println("자율 주행");
		
	}
	
	//메인메소드를 추가하여 코드 테스트
		public static void main(String[] args) {
			
			SmartCar2 sm2 = new SmartCar2();
			sm2.car = new Car(); //car 객체생성 필요
			sm2.car.name = "그랜즈"; 
			sm2.car.color = "black";
			sm2.car.cc = 3000; // SmartCar2 클래스의 수정 없이 Car에 추가된 필드가 사용가능
			System.out.println(sm2.car.cc);//3000
			
		}

}

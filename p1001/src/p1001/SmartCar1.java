package p1001;

//요구사항
//자율주행이 가능한 스마트 자동차 필요
//자율주행이라는 한가지 기능외는 Car와 일치
//기존 Car클래스를 재활용 해보자
//1) 복사
//문제점 : 원본 수정시 카피본들의 수정이 불가피하다 -> 절대 사용 x

public class SmartCar1 {
	
	// Car를 복사한 부분
	public String name;
	public String color;
	public int cc; // 원본에 cc필드가 추가되면 복사본도 cc필드 추가가 필요
	
	public void drive() {
		
		System.out.println("주행");
	
	}
	
	//새로 추가한 부분
	public void selfDrive() {
	
		System.out.println("자율 주행");
	
	}
	
	// 메인메서드를 추가하여 코드 테스트
	public static void main(String[] args) {
		
		SmartCar1 sm1 = new SmartCar1();
		sm1.name = "그랜즈";
		sm1.color = "black";
		// sm1.cc = 3000; // 복사본도 cc필드가 추가가 필요
			
	}

}


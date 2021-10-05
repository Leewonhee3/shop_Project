package p1001;

public class Phone {

	public boolean power;
	public int number;
	
	public void power() {
		
		this.power = !this.power;
	
	}
	
	public void send() {
		
		if(this.power) {
			
			System.out.println("전화걸기");
			
		}
	}

	public void receive() {
		
		if(this.power) {
			System.out.println("전화받기");
		}
	}
	
	//테스트 코드
	// 테스트 코드 > 디버깅 코드 .테스트 코드안에 디버깅 코드 없을수도 있음 서로 다른 개념임
	
	public static void main(String args[]) {
		
		Phone p = new Phone();
		p.power();
		// power() 메소드안의 this에 p 바인딩
		
		/*
		Phone p2 = new Phone();
		p2.power();
		
		// power() 메소드안의 this에 p2 바인딩
		*/
		
		p.send();
		
	}
}

package p1001;

public class SmartPhone extends Phone {

	public void setApp(String name) {
		if(this.power) {
			// this에는 setAapp 메서드를 호출하는 객체가 바인딩
		
			System.out.println(name+"<---설치중");
			
		}
			
	}
	
	public static void main(String args[]) {
		SmartPhone sm= new SmartPhone();
		sm.power(); // this.power = !this.power;
		sm.setApp("구디");
	}
}

package p1001;

public class SmartPhone extends Phone {

	public void setApp(String name) {
		if(this.power) {
			// this���� setAapp �޼��带 ȣ���ϴ� ��ü�� ���ε�
		
			System.out.println(name+"<---��ġ��");
			
		}
			
	}
	
	public static void main(String args[]) {
		SmartPhone sm= new SmartPhone();
		sm.power(); // this.power = !this.power;
		sm.setApp("����");
	}
}

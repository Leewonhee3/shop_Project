package p1005;

public class Firebat extends Unit {
	
	@Override
	public void attack() {

		System.out.println("ȭ������ ����");
		
	}
	
	public static void main(String[] args) {
		
		Firebat f = new Firebat();
		f.attack();
		
	}

}

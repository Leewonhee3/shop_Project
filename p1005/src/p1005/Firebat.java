package p1005;

public class Firebat extends Unit {
	
	@Override
	public void attack() {

		System.out.println("화염방사기 공격");
		
	}
	
	public static void main(String[] args) {
		
		Firebat f = new Firebat();
		f.attack();
		
	}

}

package p1005;

import java.util.ArrayList;

public class Main {

	public static void main(String[] args) {

		Tank t = new Tank();
		t.attack();
		
		Marine m = new Marine();
		m.attack();
		
		/*다형성 : 부모 타입으로 자식객체를 참조
		 *ex)
		 * 경찰을 사람이라 부를 수 있다. o
		 * 학생을 사람이라 부를 수 있다. o
		 * 사람을 경찰이라 부를 수 있다? x
		 * 
		 * 
		*/
		
		Unit u1 = new Tank();
		u1.attack();
		//u1.changeMode(); <- 형변환 후 사용은 가능하다.
		//((Tank)u1).changeMode();
		Unit u2 = new Marine();
		u2.attack();
		
		// 다른 타입의 유닛을 이용하여 하나의 그룹으로 지정 가능하다.
		//오버라이딩한 자식 메소드를 부모 타입으로 참조할 수 있다.
		ArrayList<Unit> list = new ArrayList<Unit>();
		list.add(new Tank()); //다형성
		list.add(new Marine()); //다형성
		list.add(new Tank()); //다형성
		
		for(Unit u :list) {
			
			u.attack();
			
		}
		
		
	}

}

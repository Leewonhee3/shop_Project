package p1005;

import java.util.ArrayList;

public class Main {

	public static void main(String[] args) {

		Tank t = new Tank();
		t.attack();
		
		Marine m = new Marine();
		m.attack();
		
		/*������ : �θ� Ÿ������ �ڽİ�ü�� ����
		 *ex)
		 * ������ ����̶� �θ� �� �ִ�. o
		 * �л��� ����̶� �θ� �� �ִ�. o
		 * ����� �����̶� �θ� �� �ִ�? x
		 * 
		 * 
		*/
		
		Unit u1 = new Tank();
		u1.attack();
		//u1.changeMode(); <- ����ȯ �� ����� �����ϴ�.
		//((Tank)u1).changeMode();
		Unit u2 = new Marine();
		u2.attack();
		
		// �ٸ� Ÿ���� ������ �̿��Ͽ� �ϳ��� �׷����� ���� �����ϴ�.
		//�������̵��� �ڽ� �޼ҵ带 �θ� Ÿ������ ������ �� �ִ�.
		ArrayList<Unit> list = new ArrayList<Unit>();
		list.add(new Tank()); //������
		list.add(new Marine()); //������
		list.add(new Tank()); //������
		
		for(Unit u :list) {
			
			u.attack();
			
		}
		
		
	}

}

package test2;

public class t6 {
	
/*
 *  ������ �߻��Ѵ�.
 *  
 *  test�޼ҵ��� �Ķ���ʹ� Testable Ÿ������ �޾ƾ� �ϴµ�
 *  29�ٿ��� Ship Ŭ������ Testable �������̽��� ��ӹ��� �ʾұ� ������
 *  17�� r.test(s)���� ������ �߻��Ͽ���. 
 *  
 *  29�ٿ� implements Testable{}�� �߰��ϸ� ���������� ����ȴ�.
 * 
 *  instanceof�� ��ü�� � Ÿ������ Ȯ�� �� �� �ִ� �����Լ��� � Ŭ�������� �Ǵ� � Ŭ������ ��ӹ޾Ҵ��� ��,�������� ��Ÿ����.
 *  
 *  ������
 *  
 *  test�ϴ�
	test�ϴ�
	test�ϴ�
 *  
 * 
 * */
	public static void main(String[] args) {
		Car c = new Car();
		Ship s = new Ship();
		Robot r = new Robot(); 
		r.test(c);
		r.test(s);
		r.test(r);
	}
}
	class Elect{ 
		int value;
	}
	
	interface Testable{}
	
	class Car extends Elect implements Testable{}
	
	class Ship extends Elect implements Testable{} // implements Testable{} �߰�
	
	class Robot extends Elect implements Testable{
		void test(Testable t){
			if(t instanceof Elect){ // t�� ElectŬ������ �ش��ϸ� �� �ƴϸ� ����
				System.out.println("test�ϴ�");
			}
		}
	}


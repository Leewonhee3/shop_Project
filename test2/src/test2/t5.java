package test2;

public class t5 {
/*
 * ��°��
 * 
 * first
   second
   third
 * 
 * ������ �߻������� �ʾҴ�.
 * 
 * �߻�Ŭ������ �߻� �޼ҵ�� �Ϲ� �޼ҵ带 ����� �� ������ new�Ͽ� ������ �� ����.
 * ���������� Test Ŭ������ Template�� ��ӹް� Template�� �߻�޼ҵ��� first()�� second()�� �������̵��Ͽ� �����Ͽ���.
 * third()�� �Ϲݸ޼ҵ�� final�� �����Ͽ��� ������ Test���� �������̵� �� �� ����. �̷��� ����� ��Ҵ� �߻�Ŭ������ �����ϰ�
 * ������ �ʿ��� �޼ҵ常 �ڽ�Ŭ�������� �����ϴ� ���� ���ø� �޼ҵ� �����̶�� �Ѵ�. ��ӹ޴� �ڽ�Ŭ�������� �������̵� �ߺ��� �ּ�ȭ �� �� �ִ�.
 * 
 * 
 * */
	
	public static void main(String[] args){
		Template t = new Testa(); //Template�� ��ӹ޴� �ڽ� Ŭ�������� ���� �� �ִ�. ������
		t.play();		
	}
}

abstract class Template{
	void play(){
	first();
	second();
	third();
	}
	
	abstract void first(); // �߻� �޼ҵ�
	abstract void second(); 
	final void third(){System.out.println("third");} // ���ø� �޼ҵ� 
}

class Testa extends Template{
	
	@Override
	void first() {System.out.println("first");}
	@Override
	void second() {System.out.println("second");}
	
}


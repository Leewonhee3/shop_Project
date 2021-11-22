package test2;

public class t4 {
	/*
	 * ��� ���
	 * 10
	 * 10
	 * 
	 * ������ �߻������� �ʾҴ� 
	 * 
	 * t1,t2�� new�� �ν��Ͻ��� �����Ͽ� �������� �ʰ� getInstance�޼ҵ带 ����Ͽ� ���� t�� �����Ͽ���.
	 * t1 = Test.getInstance()�� t�� null�̹Ƿ� new�Ͽ� t�� ��ȯ�Ͽ���
	 * t2 = Test.getInstance()������ null�� �ƴϹǷ� �������� �ʰ� ���� t�� ��ȯ�Ͽ���.
	 * 
	 * print�� Ȯ���غ��� t1, t2�� ���� t ��ü�� �ּҰ� ����Ǿ��ִ�. 
	 * test2.Test@4926097b
	 * test2.Test@4926097b
	 * 
	 * ���� t1���� setX(5) �� t.x=5�� �Ͽ��� t2���� x�� 10���� �����߱� ������ ����� �Ȱ��� ���� ���̴�.
	 * ���� ����Ʈ �������� ���������ڸ� private�� ����Ͽ� new�� ������ �Ұ��� �ϱ� ������ �� ������ Test�� ��ü�� �ϳ��� �����ϴ� �̱��� �����̴�.
	 * 
	 * */
	public static void main(String[] args){
		Test t1 = Test.getInstance();
		Test t2 = Test.getInstance();
		t1.setX(5);
		t2.setX(10);
		System.out.println(t1.getX());
		System.out.println(t2.getX());
		
	}
}

class Test{
	private static Test t;
	private int x;
	private Test(){}
	public static Test getInstance(){
		if(t == null){ // t�� null�� ��� �����ϹǷ� �ѹ��� ���� �ѹ��� ����ȴ�.
			t = new Test();
		}
		return t;
	}
	
	public int getX() {
		return x;
	}
	
	public void setX(int x) {
		this.x = x;
	}
}
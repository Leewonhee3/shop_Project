package p1001;

public class Child extends Parent{
	
	public int x;
	public Child() {
		super();
		this.x=20;
	}
	
	public void test() {

		System.out.println("�θ� x"+(super.x));
		System.out.println("�ڽ� x"+(this.x));
		System.out.println("�θ� x�� �ڽ� x�� ��"+(super.x + this.x));
	
	}

	public static void main(String[] args) {
		
		Child c = new Child();
		c.test(); //30
		
	}
}

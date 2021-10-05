package p1001;

public class Child extends Parent{
	
	public int x;
	public Child() {
		super();
		this.x=20;
	}
	
	public void test() {

		System.out.println("부모 x"+(super.x));
		System.out.println("자식 x"+(this.x));
		System.out.println("부모 x와 자식 x의 합"+(super.x + this.x));
	
	}

	public static void main(String[] args) {
		
		Child c = new Child();
		c.test(); //30
		
	}
}

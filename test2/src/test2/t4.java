package test2;

public class t4 {
	/*
	 * 출력 결과
	 * 10
	 * 10
	 * 
	 * 에러가 발생하지는 않았다 
	 * 
	 * t1,t2에 new로 인스턴스를 생성하여 저장하지 않고 getInstance메소드를 사용하여 같은 t를 저장하였다.
	 * t1 = Test.getInstance()시 t는 null이므로 new하여 t를 반환하였고
	 * t2 = Test.getInstance()에서는 null이 아니므로 생성하지 않고 같은 t를 반환하였다.
	 * 
	 * print로 확인해보면 t1, t2는 같은 t 객체의 주소가 저장되어있다. 
	 * test2.Test@4926097b
	 * test2.Test@4926097b
	 * 
	 * 따라서 t1에서 setX(5) 즉 t.x=5를 하여도 t2에서 x를 10으로 저장했기 때문에 결과가 똑같이 나온 것이다.
	 * 또한 디폴트 생성자의 접근제한자를 private로 사용하여 new로 생성이 불가능 하기 때문에 이 예제는 Test의 객체가 하나만 존재하는 싱글톤 패턴이다.
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
		if(t == null){ // t가 null인 경우 생성하므로 한번만 최초 한번만 실행된다.
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
package p1001;

public class Member {
	private String id;
	private String pw;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}

	public String toString() {
		
		
		return this.id + "," + this.pw; // Object�� toString ����� Member@7637f22

	
	}
	
	public static void main(String[] args) {
		
		Member member = new Member();
		
		member.setId("admin");
		member.setPw("1234");
		
		//String str = member.toString(); Objcet toString()�޼ҵ�
		//System.out.println(str);
		System.out.println(member);
	
	}

}

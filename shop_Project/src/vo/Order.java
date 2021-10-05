package vo;

public class Order {
	// private Ebook ebook; FM�씠吏�留� �떎臾댁뿉�꽌 �븞�벝�닔�룄 �엳�쓬.
	private int orderNo;
	private int ebookNo;
	private int memberNo;
	private int orderPrice;
	private String orderDate;
	private String updateDate;
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getEbookNo() {
		return ebookNo;
	}
	public void setEbookNo(int ebookNo) {
		this.ebookNo = ebookNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	
	public String toString() {
		
		return "orderNo : " + orderNo +"\n"+
			   "ebookNo : " + ebookNo +"\n"+
			   "memberNo : " + memberNo +"\n"+
			   "memberNo : " + memberNo +"\n"+
			   "orderPrice : " + orderPrice+"\n"+ 
			   "createDate : " + orderDate +"\n"+
			   "updateDate : " + updateDate +"\n";
	
	}
	
}

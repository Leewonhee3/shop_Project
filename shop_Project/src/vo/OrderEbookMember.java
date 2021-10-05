package vo;

// join�쓣 �쐞�빐 遺��뱷�씠�븯寃� 留뚮뱺 �겢�옒�뒪�엫.
public class OrderEbookMember {
	private Order order;
	private Ebook ebook;
	private Member member;
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Ebook getEbook() {
		return ebook;
	}
	public void setEbook(Ebook ebook) {
		this.ebook = ebook;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	
	public String toString() {
		
		return "┌-------------------------------┐\n"+
			   "|             Order             |\n"+
			   "└-------------------------------┘\n"+
			   order.toString() +"\n"+
			   "┌-------------------------------┐\n"+
			   "|             Ebook             |\n"+
			   "└-------------------------------┘\n"+
			   ebook.toString() +"\n"+
			   "┌-------------------------------┐\n"+
			   "|             Member            |\n"+
			   "└-------------------------------┘\n"+
			   member.toString() +"\n";
	
	}	
	
}

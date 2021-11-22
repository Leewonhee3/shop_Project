package vo;

public class Todo {
	
	private int todoNo;
	private String memberId; // private Member member가 정석이지만 코드 편의성을 위해 vo타입들을 DB의 테이블 형태와 맞추기도 함.
	private String todoDate;
	private String todoContent;
	private String create_date;
	private String update_date;
	
	public int getTodoNo() {
		return todoNo;
	}
	public void setTodoNo(int todoNo) {
		this.todoNo = todoNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getTodoDate() {
		return todoDate;
	}
	public void setTodoDate(String todoDate) {
		this.todoDate = todoDate;
	}
	public String getTodoContent() {
		return todoContent;
	}
	public void setTodoContent(String todoContent) {
		this.todoContent = todoContent;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	
	@Override
	public String toString() {
		return "Todo [todoNo=" + todoNo + ", memberId=" + memberId + ", todoDate=" + todoDate + ", todoContent="
				+ todoContent + ", create_date=" + create_date + ", update_date=" + update_date + "]";
	}
	
	
	
	
	
}

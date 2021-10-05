package vo;

public class QnAComment {
	
	private int qnaNo;
	private String qnaCommentContent;
	private int memberNo;
	private String createDate;
	private String updateDate;
	
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaCommentContent() {
		return qnaCommentContent;
	}
	public void setQnaCommentContent(String qnaCommentContent) {
		this.qnaCommentContent = qnaCommentContent;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	
	public String toString() {
		
		return "qnaNo : " + qnaNo +"\n"+
			   "qnaCommentContent : " + qnaCommentContent +"\n"+
			   "memberNo : " + memberNo +"\n"+
			   "createDate : " + createDate +"\n"+
			   "updateDate : " + updateDate +"\n";
	
	}
	
}

package com.kh.semi.cs.model.vo;

public class Cs {
	
	private int csNo;
	private String csTitle;
	private String csContent;
	private String createDate;
	private String replyYn;
	private String status;
	private int memberNo;
	private int replyNo;
	private String memberId;
	
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Cs() {
		super();
	}
	
	public Cs(int csNo, String csTitle, String csContent, String createDate, String replyYn, String status,
			int memberNo, int replyNo) {
		super();
		this.csNo = csNo;
		this.csTitle = csTitle;
		this.csContent = csContent;
		this.createDate = createDate;
		this.replyYn = replyYn;
		this.status = status;
		this.memberNo = memberNo;
		this.replyNo = replyNo;
	}
	
	
	public int getCsNo() {
		return csNo;
	}
	public void setCsNo(int csNo) {
		this.csNo = csNo;
	}
	public String getCsTitle() {
		return csTitle;
	}
	public void setCsTitle(String csTitle) {
		this.csTitle = csTitle;
	}
	public String getCsContent() {
		return csContent;
	}
	public void setCsContent(String csContent) {
		this.csContent = csContent;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getReplyYn() {
		return replyYn;
	}
	public void setReplyYn(String replyYn) {
		this.replyYn = replyYn;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	
	
	@Override
	public String toString() {
		return "Cs [csNo=" + csNo + ", csTitle=" + csTitle + ", csContent=" + csContent + ", createDate=" + createDate
				+ ", replyYn=" + replyYn + ", status=" + status + ", memberNo=" + memberNo + ", replyNo=" + replyNo
				+ "]";
	}
	
	
	
	

}

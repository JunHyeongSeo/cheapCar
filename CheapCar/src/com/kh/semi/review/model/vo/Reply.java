package com.kh.semi.review.model.vo;

import java.sql.Date;

public class Reply {
	
	private int commentNo;
	private String commentContent;
	private String commentWriter;
	private int reviewNo;
	private int memberNo;
	private String status;
	private Date createDate;
	public Reply() {
		super();
	}
	public Reply(int commentNo, String commentContent, String commentWriter, int reviewNo, int memberNo, String status,
			Date createDate) {
		super();
		this.commentNo = commentNo;
		this.commentContent = commentContent;
		this.commentWriter = commentWriter;
		this.reviewNo = reviewNo;
		this.memberNo = memberNo;
		this.status = status;
		this.createDate = createDate;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentWriter() {
		return commentWriter;
	}
	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		return "Reply [commentNo=" + commentNo + ", commentContent=" + commentContent + ", commentWriter="
				+ commentWriter + ", reviewNo=" + reviewNo + ", memberNo=" + memberNo + ", status=" + status
				+ ", createDate=" + createDate + "]";
	}
	
	
	
	
	
	
	
}

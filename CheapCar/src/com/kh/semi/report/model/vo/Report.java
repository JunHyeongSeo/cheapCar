package com.kh.semi.report.model.vo;

public class Report {
	
	private int commentNo;
	private String commentContent;
	private int reviewNo;
	
	
	public Report() {
		super();
	}
	
	
	public Report(int commentNo, String commentContent, int reviewNo) {
		super();
		this.commentNo = commentNo;
		this.commentContent = commentContent;
		this.reviewNo = reviewNo;
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
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	
	
	@Override
	public String toString() {
		return "Report [commentNo=" + commentNo + ", commentContent=" + commentContent + ", reviewNo=" + reviewNo + "]";
	}
	
}

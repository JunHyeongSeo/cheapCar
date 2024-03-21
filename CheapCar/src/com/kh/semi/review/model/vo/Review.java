package com.kh.semi.review.model.vo;

import java.sql.Date;

public class Review {
	
	private int reviewNo;
	private String reviewTitle;
	private String reviewContent;
	private Date createDate;
	private String status;
	private int memberNo;
	private int count;
	public Review() {
		super();
	}
	public Review(int reviewNo, String reviewTitle, String reviewContent, Date createDate, String status, int memberNo,
			int count) {
		super();
		this.reviewNo = reviewNo;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.createDate = createDate;
		this.status = status;
		this.memberNo = memberNo;
		this.count = count;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent
				+ ", createDate=" + createDate + ", status=" + status + ", memberNo=" + memberNo + ", count=" + count
				+ "]";
	}

}

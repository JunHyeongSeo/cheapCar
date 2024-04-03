package com.kh.semi.review.model.vo;

import java.sql.Date;

public class ReviewBoard {
	
	private int reviewNo;
	private String reviewTitle;
	private String reviewContent;
	private String reviewWriter;
	private Date createDate;
	private String status;
	private int memberNo;
	private int count;
	private String titleImg;
	private String fileLevel;
	public ReviewBoard() {
		super();
	}
	public ReviewBoard(int reviewNo, String reviewTitle, String reviewContent, String reviewWriter, Date createDate,
			String status, int memberNo, int count, String titleImg, String fileLevel) {
		super();
		this.reviewNo = reviewNo;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewWriter = reviewWriter;
		this.createDate = createDate;
		this.status = status;
		this.memberNo = memberNo;
		this.count = count;
		this.titleImg = titleImg;
		this.fileLevel = fileLevel;
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
	public String getReviewWriter() {
		return reviewWriter;
	}
	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
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
	public String getTitleImg() {
		return titleImg;
	}
	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}
	public String getFileLevel() {
		return fileLevel;
	}
	public void setFileLevel(String fileLevel) {
		this.fileLevel = fileLevel;
	}
	@Override
	public String toString() {
		return "ReviewBoard [reviewNo=" + reviewNo + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent
				+ ", reviewWriter=" + reviewWriter + ", createDate=" + createDate + ", status=" + status + ", memberNo="
				+ memberNo + ", count=" + count + ", titleImg=" + titleImg + ", fileLevel=" + fileLevel + "]";
	}
	
	
	
	
	
	
	

}

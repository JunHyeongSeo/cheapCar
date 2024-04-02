package com.kh.semi.review.model.vo;

public class ReviewPhoto {
	
	private int photoNo; 
	private String photoOname;
	private String photoCname;
	private String photoPath;
	private int reviewNo;
	private String status;
	private int fileLevel;
	public ReviewPhoto() {
		super();
	}
	public ReviewPhoto(int photoNo, String photoOname, String photoCname, String photoPath, int reviewNo, String status,
			int fileLevel) {
		super();
		this.photoNo = photoNo;
		this.photoOname = photoOname;
		this.photoCname = photoCname;
		this.photoPath = photoPath;
		this.reviewNo = reviewNo;
		this.status = status;
		this.fileLevel = fileLevel;
	}
	public int getPhotoNo() {
		return photoNo;
	}
	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}
	public String getPhotoOname() {
		return photoOname;
	}
	public void setPhotoOname(String photoOname) {
		this.photoOname = photoOname;
	}
	public String getPhotoCname() {
		return photoCname;
	}
	public void setPhotoCname(String photoCname) {
		this.photoCname = photoCname;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getFileLevel() {
		return fileLevel;
	}
	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}
	@Override
	public String toString() {
		return "ReviewPhoto [photoNo=" + photoNo + ", photoOname=" + photoOname + ", photoCname=" + photoCname
				+ ", photoPath=" + photoPath + ", reviewNo=" + reviewNo + ", status=" + status + ", fileLevel="
				+ fileLevel + "]";
	}
	
	
	
	
	
	
	
}

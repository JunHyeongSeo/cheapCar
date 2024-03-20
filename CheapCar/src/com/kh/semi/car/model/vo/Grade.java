package com.kh.semi.car.model.vo;

public class Grade {

	private int gradeNo;
	private String gradeName;
	private int gradePrice;
	
	public Grade() {
		super();
	}

	public Grade(int gradeNo, String gradeName, int gradePrice) {
		super();
		this.gradeNo = gradeNo;
		this.gradeName = gradeName;
		this.gradePrice = gradePrice;
	}

	public int getGradeNo() {
		return gradeNo;
	}

	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public int getGradePrice() {
		return gradePrice;
	}

	public void setGradePrice(int gradePrice) {
		this.gradePrice = gradePrice;
	}

	@Override
	public String toString() {
		return "Grade [gradeNo=" + gradeNo + ", gradeName=" + gradeName + ", gradePrice=" + gradePrice + "]";
	}
	
}

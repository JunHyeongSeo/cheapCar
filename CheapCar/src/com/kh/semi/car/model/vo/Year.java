package com.kh.semi.car.model.vo;

public class Year {

	private int yearNo;
	private int year;
	private int yearPrice;
	
	public Year() {
		super();
	}

	public Year(int yearNo, int year, int yearPrice) {
		super();
		this.yearNo = yearNo;
		this.year = year;
		this.yearPrice = yearPrice;
	}

	public int getYearNo() {
		return yearNo;
	}

	public void setYearNo(int yearNo) {
		this.yearNo = yearNo;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getYearPrice() {
		return yearPrice;
	}

	public void setYearPrice(int yearPrice) {
		this.yearPrice = yearPrice;
	}

	@Override
	public String toString() {
		return "Year [yearNo=" + yearNo + ", year=" + year + ", yearPrice=" + yearPrice + "]";
	}
	
}

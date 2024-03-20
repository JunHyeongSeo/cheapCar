package com.kh.semi.car.model.vo;

public class Car {
	private int managementNo;
	private String status;
	private String carNo;
	private int locationNo;
	private String locationName;
	private String modelName;
	private String fuelName;
	private String brandName;
	private String gradeName;
	private int year;
	private int gradePrice;
	private int modelPrice;
	private int yearPrice;
	
	public Car() {
		super();
	}



	public Car(int managementNo, String status, String carNo, int locationNo, String locationName, String modelName,
			String fuelName, String brandName, String gradeName, int year, int gradePrice, int modelPrice,
			int yearPrice) {
		super();
		this.managementNo = managementNo;
		this.status = status;
		this.carNo = carNo;
		this.locationNo = locationNo;
		this.locationName = locationName;
		this.modelName = modelName;
		this.fuelName = fuelName;
		this.brandName = brandName;
		this.gradeName = gradeName;
		this.year = year;
		this.gradePrice = gradePrice;
		this.modelPrice = modelPrice;
		this.yearPrice = yearPrice;
	}



	public String getFuelName() {
		return fuelName;
	}

	public void setFuelName(String fuelName) {
		this.fuelName = fuelName;
	}

	public int getManagementNo() {
		return managementNo;
	}

	public void setManagementNo(int managementNo) {
		this.managementNo = managementNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}

	public int getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getGradePrice() {
		return gradePrice;
	}

	public void setGradePrice(int gradePrice) {
		this.gradePrice = gradePrice;
	}

	public int getModelPrice() {
		return modelPrice;
	}

	public void setModelPrice(int modelPrice) {
		this.modelPrice = modelPrice;
	}

	public int getYearPrice() {
		return yearPrice;
	}

	public void setYearPrice(int yearPrice) {
		this.yearPrice = yearPrice;
	}



	@Override
	public String toString() {
		return "Car [managementNo=" + managementNo + ", status=" + status + ", carNo=" + carNo + ", locationNo="
				+ locationNo + ", locationName=" + locationName + ", modelName=" + modelName + ", fuelName=" + fuelName
				+ ", brandName=" + brandName + ", gradeName=" + gradeName + ", year=" + year + ", gradePrice="
				+ gradePrice + ", modelPrice=" + modelPrice + ", yearPrice=" + yearPrice + "]";
	}

	
}

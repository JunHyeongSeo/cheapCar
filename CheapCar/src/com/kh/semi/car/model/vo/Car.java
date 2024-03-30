package com.kh.semi.car.model.vo;

import java.sql.Date;

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
	private Date startDate;
	private Date endDate;
	private int mileage;
	private Date mileageDate;
	private int csNo;
	private String csTitle;
	private String csContent;
	private Date createDate;
	private String replyYn;
	private String memberId;
	private int reservationNo;
	private String memberName;
	private String phone;
	private int totalPrice;
	
	
	public int getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}



	private String email;
	

	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public int getReservationNo() {
		return reservationNo;
	}


	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}


	public Car() {
		super();
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


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public String getReplyYn() {
		return replyYn;
	}


	public void setReplyYn(String replyYn) {
		this.replyYn = replyYn;
	}


	public Date getMileageDate() {
		return mileageDate;
	}


	public void setMileageDate(Date mileageDate) {
		this.mileageDate = mileageDate;
	}



	
	public int getMileage() {
		return mileage;
	}



	public void setMileage(int mileage) {
		this.mileage = mileage;
	}



	public Date getStartDate() {
		return startDate;
	}



	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}



	public Date getEndDate() {
		return endDate;
	}



	public void setEndDate(Date endDate) {
		this.endDate = endDate;
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



	


	public Car(int managementNo, String status, String carNo, int locationNo, String locationName, String modelName,
			String fuelName, String brandName, String gradeName, int year, int gradePrice, int modelPrice,
			int yearPrice, Date startDate, Date endDate, int mileage, Date mileageDate, int csNo, String csTitle,
			String csContent, Date createDate, String replyYn, String memberId, int reservationNo, String memberName,
			String phone, String email, int totalPrice) {
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
		this.startDate = startDate;
		this.endDate = endDate;
		this.mileage = mileage;
		this.mileageDate = mileageDate;
		this.csNo = csNo;
		this.csTitle = csTitle;
		this.csContent = csContent;
		this.createDate = createDate;
		this.replyYn = replyYn;
		this.memberId = memberId;
		this.reservationNo = reservationNo;
		this.memberName = memberName;
		this.phone = phone;
		this.email = email;
		this.totalPrice = totalPrice;
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
				+ gradePrice + ", modelPrice=" + modelPrice + ", yearPrice=" + yearPrice + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", mileage=" + mileage + ", mileageDate=" + mileageDate + ", csNo=" + csNo
				+ ", csTitle=" + csTitle + ", csContent=" + csContent + ", createDate=" + createDate + ", replyYn="
				+ replyYn + ", memberId=" + memberId + ", reservationNo=" + reservationNo + ", memberName=" + memberName
				+ ", phone=" + phone + ", totalPrice=" + totalPrice + ", email=" + email + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((brandName == null) ? 0 : brandName.hashCode());
		result = prime * result + ((carNo == null) ? 0 : carNo.hashCode());
		result = prime * result + ((fuelName == null) ? 0 : fuelName.hashCode());
		result = prime * result + ((gradeName == null) ? 0 : gradeName.hashCode());
		result = prime * result + gradePrice;
		result = prime * result + ((locationName == null) ? 0 : locationName.hashCode());
		result = prime * result + locationNo;
		result = prime * result + managementNo;
		result = prime * result + ((modelName == null) ? 0 : modelName.hashCode());
		result = prime * result + modelPrice;
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + year;
		result = prime * result + yearPrice;
		return result;
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Car other = (Car) obj;
		if (brandName == null) {
			if (other.brandName != null)
				return false;
		} else if (!brandName.equals(other.brandName))
			return false;
		if (carNo == null) {
			if (other.carNo != null)
				return false;
		} else if (!carNo.equals(other.carNo))
			return false;
		if (fuelName == null) {
			if (other.fuelName != null)
				return false;
		} else if (!fuelName.equals(other.fuelName))
			return false;
		if (gradeName == null) {
			if (other.gradeName != null)
				return false;
		} else if (!gradeName.equals(other.gradeName))
			return false;
		if (gradePrice != other.gradePrice)
			return false;
		if (locationName == null) {
			if (other.locationName != null)
				return false;
		} else if (!locationName.equals(other.locationName))
			return false;
		if (locationNo != other.locationNo)
			return false;
		if (managementNo != other.managementNo)
			return false;
		if (modelName == null) {
			if (other.modelName != null)
				return false;
		} else if (!modelName.equals(other.modelName))
			return false;
		if (modelPrice != other.modelPrice)
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (year != other.year)
			return false;
		if (yearPrice != other.yearPrice)
			return false;
		return true;
	}

	
	
}

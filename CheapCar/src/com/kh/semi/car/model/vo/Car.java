package com.kh.semi.car.model.vo;

import java.sql.Date;

public class Car {
	
	private int csNo;
	private int year;
	private int mileage;
	private int yearPrice;
	private int locationNo;
	private int gradePrice;
	private int totalPrice;
	private int modelPrice;
	private int managementNo;
	private int reservationNo;
	private String carNo;
	private String phone;
	private String email;
	private String status;
	private String replyYn;
	private String csTitle;
	private String memberId;
	private String fuelName;
	private String csContent;
	private String modelName;
	private String brandName;
	private String gradeName;
	private String memberName;
	private String changeName;
	private String locationName;
	private String carPhotoAddress;
	private Date endDate;
	private Date startDate;
	private Date createDate;
	private Date mileageDate;
	
	public Car() {
		super();
	}
	
	
	
	
	public Car(int csNo, int year, int mileage, int yearPrice, int locationNo, int gradePrice, int totalPrice,
			int modelPrice, int managementNo, int reservationNo, String carNo, String phone, String email,
			String status, String replyYn, String csTitle, String memberId, String fuelName, String csContent,
			String modelName, String brandName, String gradeName, String memberName, String changeName,
			String locationName, String carPhotoAddress, Date endDate, Date startDate, Date createDate,
			Date mileageDate) {
		super();
		this.csNo = csNo;
		this.year = year;
		this.mileage = mileage;
		this.yearPrice = yearPrice;
		this.locationNo = locationNo;
		this.gradePrice = gradePrice;
		this.totalPrice = totalPrice;
		this.modelPrice = modelPrice;
		this.managementNo = managementNo;
		this.reservationNo = reservationNo;
		this.carNo = carNo;
		this.phone = phone;
		this.email = email;
		this.status = status;
		this.replyYn = replyYn;
		this.csTitle = csTitle;
		this.memberId = memberId;
		this.fuelName = fuelName;
		this.csContent = csContent;
		this.modelName = modelName;
		this.brandName = brandName;
		this.gradeName = gradeName;
		this.memberName = memberName;
		this.changeName = changeName;
		this.locationName = locationName;
		this.carPhotoAddress = carPhotoAddress;
		this.endDate = endDate;
		this.startDate = startDate;
		this.createDate = createDate;
		this.mileageDate = mileageDate;
	}




	public Car(
			int managementNo, String status, String carNo, int locationNo, String locationName, String modelName,
			String fuelName, String brandName, String gradeName, int year, int gradePrice, int modelPrice,  int yearPrice,  Date startDate,
			Date endDate, int mileage, Date mileageDate, int csNo, String csTitle, String csContent, Date createDate,
			 String replyYn) {
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

	}

	public int getCsNo() {
		return csNo;
	}

	public void setCsNo(int csNo) {
		this.csNo = csNo;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	public int getYearPrice() {
		return yearPrice;
	}

	public void setYearPrice(int yearPrice) {
		this.yearPrice = yearPrice;
	}

	public int getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}

	public int getGradePrice() {
		return gradePrice;
	}

	public void setGradePrice(int gradePrice) {
		this.gradePrice = gradePrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getModelPrice() {
		return modelPrice;
	}

	public void setModelPrice(int modelPrice) {
		this.modelPrice = modelPrice;
	}

	public int getManagementNo() {
		return managementNo;
	}

	public void setManagementNo(int managementNo) {
		this.managementNo = managementNo;
	}

	public int getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}

	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReplyYn() {
		return replyYn;
	}

	public void setReplyYn(String replyYn) {
		this.replyYn = replyYn;
	}

	public String getCsTitle() {
		return csTitle;
	}

	public void setCsTitle(String csTitle) {
		this.csTitle = csTitle;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getFuelName() {
		return fuelName;
	}

	public void setFuelName(String fuelName) {
		this.fuelName = fuelName;
	}

	public String getCsContent() {
		return csContent;
	}

	public void setCsContent(String csContent) {
		this.csContent = csContent;
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

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getCarPhotoAddress() {
		return carPhotoAddress;
	}

	public void setCarPhotoAddress(String carPhotoAddress) {
		this.carPhotoAddress = carPhotoAddress;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getMileageDate() {
		return mileageDate;
	}

	public void setMileageDate(Date mileageDate) {
		this.mileageDate = mileageDate;
	}

	@Override
	public String toString() {
		return "Car [csNo=" + csNo + ", year=" + year + ", mileage=" + mileage + ", yearPrice=" + yearPrice
				+ ", locationNo=" + locationNo + ", gradePrice=" + gradePrice + ", totalPrice=" + totalPrice
				+ ", modelPrice=" + modelPrice + ", managementNo=" + managementNo + ", reservationNo=" + reservationNo
				+ ", carNo=" + carNo + ", phone=" + phone + ", email=" + email + ", status=" + status + ", replyYn="
				+ replyYn + ", csTitle=" + csTitle + ", memberId=" + memberId + ", fuelName=" + fuelName
				+ ", csContent=" + csContent + ", modelName=" + modelName + ", brandName=" + brandName + ", gradeName="
				+ gradeName + ", memberName=" + memberName + ", changeName=" + changeName + ", locationName="
				+ locationName + ", carPhotoAddress=" + carPhotoAddress + ", endDate=" + endDate + ", startDate="
				+ startDate + ", createDate=" + createDate + ", mileageDate=" + mileageDate + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((brandName == null) ? 0 : brandName.hashCode());
		result = prime * result + ((carNo == null) ? 0 : carNo.hashCode());
		result = prime * result + ((carPhotoAddress == null) ? 0 : carPhotoAddress.hashCode());
		result = prime * result + ((changeName == null) ? 0 : changeName.hashCode());
		result = prime * result + ((createDate == null) ? 0 : createDate.hashCode());
		result = prime * result + ((csContent == null) ? 0 : csContent.hashCode());
		result = prime * result + csNo;
		result = prime * result + ((csTitle == null) ? 0 : csTitle.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((endDate == null) ? 0 : endDate.hashCode());
		result = prime * result + ((fuelName == null) ? 0 : fuelName.hashCode());
		result = prime * result + ((gradeName == null) ? 0 : gradeName.hashCode());
		result = prime * result + gradePrice;
		result = prime * result + ((locationName == null) ? 0 : locationName.hashCode());
		result = prime * result + locationNo;
		result = prime * result + managementNo;
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + ((memberName == null) ? 0 : memberName.hashCode());
		result = prime * result + mileage;
		result = prime * result + ((mileageDate == null) ? 0 : mileageDate.hashCode());
		result = prime * result + ((modelName == null) ? 0 : modelName.hashCode());
		result = prime * result + modelPrice;
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result + ((replyYn == null) ? 0 : replyYn.hashCode());
		result = prime * result + reservationNo;
		result = prime * result + ((startDate == null) ? 0 : startDate.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + totalPrice;
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
		if (carPhotoAddress == null) {
			if (other.carPhotoAddress != null)
				return false;
		} else if (!carPhotoAddress.equals(other.carPhotoAddress))
			return false;
		if (changeName == null) {
			if (other.changeName != null)
				return false;
		} else if (!changeName.equals(other.changeName))
			return false;
		if (createDate == null) {
			if (other.createDate != null)
				return false;
		} else if (!createDate.equals(other.createDate))
			return false;
		if (csContent == null) {
			if (other.csContent != null)
				return false;
		} else if (!csContent.equals(other.csContent))
			return false;
		if (csNo != other.csNo)
			return false;
		if (csTitle == null) {
			if (other.csTitle != null)
				return false;
		} else if (!csTitle.equals(other.csTitle))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (endDate == null) {
			if (other.endDate != null)
				return false;
		} else if (!endDate.equals(other.endDate))
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
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (memberName == null) {
			if (other.memberName != null)
				return false;
		} else if (!memberName.equals(other.memberName))
			return false;
		if (mileage != other.mileage)
			return false;
		if (mileageDate == null) {
			if (other.mileageDate != null)
				return false;
		} else if (!mileageDate.equals(other.mileageDate))
			return false;
		if (modelName == null) {
			if (other.modelName != null)
				return false;
		} else if (!modelName.equals(other.modelName))
			return false;
		if (modelPrice != other.modelPrice)
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (replyYn == null) {
			if (other.replyYn != null)
				return false;
		} else if (!replyYn.equals(other.replyYn))
			return false;
		if (reservationNo != other.reservationNo)
			return false;
		if (startDate == null) {
			if (other.startDate != null)
				return false;
		} else if (!startDate.equals(other.startDate))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (totalPrice != other.totalPrice)
			return false;
		if (year != other.year)
			return false;
		if (yearPrice != other.yearPrice)
			return false;
		return true;
	}
	
	
	
	
}
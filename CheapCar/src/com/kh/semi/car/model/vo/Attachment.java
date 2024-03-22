package com.kh.semi.car.model.vo;

public class Attachment {
	
	private int carPhotoNo;
	private String carPhotoAddress;
	private int managementNo;
	private String originName;
	private String changeName;
	private int fileLevel;
	private String status;
	
	public Attachment() {
		super();
	}
	
	public Attachment(int carPhotoNo, String carPhotoAddress, int managementNo, String originName, String changeName,
			int fileLevel, String status) {
		super();
		this.carPhotoNo = carPhotoNo;
		this.carPhotoAddress = carPhotoAddress;
		this.managementNo = managementNo;
		this.originName = originName;
		this.changeName = changeName;
		this.fileLevel = fileLevel;
		this.status = status;
	}
	
	public int getCarPhotoNo() {
		return carPhotoNo;
	}
	public void setCarPhotoNo(int carPhotoNo) {
		this.carPhotoNo = carPhotoNo;
	}
	public String getCarPhotoAddress() {
		return carPhotoAddress;
	}
	public void setCarPhotoAddress(String carPhotoAddress) {
		this.carPhotoAddress = carPhotoAddress;
	}
	public int getManagementNo() {
		return managementNo;
	}
	public void setManagementNo(int managementNo) {
		this.managementNo = managementNo;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public int getFileLevel() {
		return fileLevel;
	}
	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((carPhotoAddress == null) ? 0 : carPhotoAddress.hashCode());
		result = prime * result + carPhotoNo;
		result = prime * result + ((changeName == null) ? 0 : changeName.hashCode());
		result = prime * result + fileLevel;
		result = prime * result + managementNo;
		result = prime * result + ((originName == null) ? 0 : originName.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
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
		Attachment other = (Attachment) obj;
		if (carPhotoAddress == null) {
			if (other.carPhotoAddress != null)
				return false;
		} else if (!carPhotoAddress.equals(other.carPhotoAddress))
			return false;
		if (carPhotoNo != other.carPhotoNo)
			return false;
		if (changeName == null) {
			if (other.changeName != null)
				return false;
		} else if (!changeName.equals(other.changeName))
			return false;
		if (fileLevel != other.fileLevel)
			return false;
		if (managementNo != other.managementNo)
			return false;
		if (originName == null) {
			if (other.originName != null)
				return false;
		} else if (!originName.equals(other.originName))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		return true;
	}
	
}

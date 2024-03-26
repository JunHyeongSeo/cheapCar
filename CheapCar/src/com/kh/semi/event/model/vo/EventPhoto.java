package com.kh.semi.event.model.vo;

public class EventPhoto {

	private int photoNo; 
	private String photoName; 
	private String photoPath;
	private int eventNo;
	private String status;
	public EventPhoto() {
		super();
	}
	public EventPhoto(int photoNo, String photoName, String photoPath, int eventNo, String status) {
		super();
		this.photoNo = photoNo;
		this.photoName = photoName;
		this.photoPath = photoPath;
		this.eventNo = eventNo;
		this.status = status;
	}
	public int getPhotoNo() {
		return photoNo;
	}
	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	public int getEventNo() {
		return eventNo;
	}
	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "EventPhoto [photoNo=" + photoNo + ", photoName=" + photoName + ", photoPath=" + photoPath + ", eventNo="
				+ eventNo + ", status=" + status + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + eventNo;
		result = prime * result + ((photoName == null) ? 0 : photoName.hashCode());
		result = prime * result + photoNo;
		result = prime * result + ((photoPath == null) ? 0 : photoPath.hashCode());
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
		EventPhoto other = (EventPhoto) obj;
		if (eventNo != other.eventNo)
			return false;
		if (photoName == null) {
			if (other.photoName != null)
				return false;
		} else if (!photoName.equals(other.photoName))
			return false;
		if (photoNo != other.photoNo)
			return false;
		if (photoPath == null) {
			if (other.photoPath != null)
				return false;
		} else if (!photoPath.equals(other.photoPath))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		return true;
	}
	
	
	
	
	
	
	
	
}

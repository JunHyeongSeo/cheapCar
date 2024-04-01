package com.kh.semi.event.model.vo;

public class EventPhoto {

	private int photoNo; 
	private String photoOname;
	private String photoCname;
	private String photoPath;
	private int eventNo;
	private String status;
	private int fileLevel;
	
	
	
	
	
	public EventPhoto(int photoNo, String photoCname, int fileLevel) {
		super();
		this.photoNo = photoNo;
		this.photoCname = photoCname;
		this.fileLevel = fileLevel;
	}
	
	

	public EventPhoto(String photoCname) {
		super();
		this.photoCname = photoCname;
	}

	public EventPhoto() {
		super();
	}

	public EventPhoto(int photoNo, String photoOname, String photoCname, String photoPath, int eventNo, String status,
			int fileLevel) {
		super();
		this.photoNo = photoNo;
		this.photoOname = photoOname;
		this.photoCname = photoCname;
		this.photoPath = photoPath;
		this.eventNo = eventNo;
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

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	

	@Override
	public String toString() {
		return "EventPhoto [photoNo=" + photoNo + ", photoOname=" + photoOname + ", photoCname=" + photoCname
				+ ", photoPath=" + photoPath + ", eventNo=" + eventNo + ", status=" + status + ", fileLevel="
				+ fileLevel + "]";
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + eventNo;
		result = prime * result + fileLevel;
		result = prime * result + ((photoCname == null) ? 0 : photoCname.hashCode());
		result = prime * result + photoNo;
		result = prime * result + ((photoOname == null) ? 0 : photoOname.hashCode());
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
		if (fileLevel != other.fileLevel)
			return false;
		if (photoCname == null) {
			if (other.photoCname != null)
				return false;
		} else if (!photoCname.equals(other.photoCname))
			return false;
		if (photoNo != other.photoNo)
			return false;
		if (photoOname == null) {
			if (other.photoOname != null)
				return false;
		} else if (!photoOname.equals(other.photoOname))
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

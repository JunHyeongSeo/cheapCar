package com.kh.semi.event.model.vo;

import java.sql.Date;

public class EventBoard {

	private int eventNo;
	private String eventTitle;
	private String eventContent;
	private String eventWriter;
	private Date createDate;
	private String status;
	private int memberNo;
	private int count;
	private String titleImg;
	
	public EventBoard() {
		super();
	}

	public EventBoard(int eventNo, String eventTitle, String eventContent, String eventWriter, Date createDate,
			String status, int memberNo, int count, String titleImg) {
		super();
		this.eventNo = eventNo;
		this.eventTitle = eventTitle;
		this.eventContent = eventContent;
		this.eventWriter = eventWriter;
		this.createDate = createDate;
		this.status = status;
		this.memberNo = memberNo;
		this.count = count;
		this.titleImg = titleImg;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public String getEventContent() {
		return eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}

	public String getEventWriter() {
		return eventWriter;
	}

	public void setEventWriter(String eventWriter) {
		this.eventWriter = eventWriter;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + count;
		result = prime * result + ((createDate == null) ? 0 : createDate.hashCode());
		result = prime * result + ((eventContent == null) ? 0 : eventContent.hashCode());
		result = prime * result + eventNo;
		result = prime * result + ((eventTitle == null) ? 0 : eventTitle.hashCode());
		result = prime * result + ((eventWriter == null) ? 0 : eventWriter.hashCode());
		result = prime * result + memberNo;
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((titleImg == null) ? 0 : titleImg.hashCode());
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
		EventBoard other = (EventBoard) obj;
		if (count != other.count)
			return false;
		if (createDate == null) {
			if (other.createDate != null)
				return false;
		} else if (!createDate.equals(other.createDate))
			return false;
		if (eventContent == null) {
			if (other.eventContent != null)
				return false;
		} else if (!eventContent.equals(other.eventContent))
			return false;
		if (eventNo != other.eventNo)
			return false;
		if (eventTitle == null) {
			if (other.eventTitle != null)
				return false;
		} else if (!eventTitle.equals(other.eventTitle))
			return false;
		if (eventWriter == null) {
			if (other.eventWriter != null)
				return false;
		} else if (!eventWriter.equals(other.eventWriter))
			return false;
		if (memberNo != other.memberNo)
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (titleImg == null) {
			if (other.titleImg != null)
				return false;
		} else if (!titleImg.equals(other.titleImg))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "EventBoard [eventNo=" + eventNo + ", eventTitle=" + eventTitle + ", eventContent=" + eventContent
				+ ", eventWriter=" + eventWriter + ", createDate=" + createDate + ", status=" + status + ", memberNo="
				+ memberNo + ", count=" + count + ", titleImg=" + titleImg + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
}

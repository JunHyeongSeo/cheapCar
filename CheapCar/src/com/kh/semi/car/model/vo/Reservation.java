package com.kh.semi.car.model.vo;

public class Reservation {

	private int reservationNo;
	private String startDate;
	private String endDate;
	private int memberNo;
	private int managementNo;
	private int totalPrice;
	
	public Reservation() {
		super();
	}
	
	public Reservation(int reservationNo, String startDate, String endDate, int memberNo, int managementNo,
			int totalPrice) {
		super();
		this.reservationNo = reservationNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.memberNo = memberNo;
		this.managementNo = managementNo;
		this.totalPrice = totalPrice;
	}
	
	public int getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getManagementNo() {
		return managementNo;
	}
	public void setManagementNo(int managementNo) {
		this.managementNo = managementNo;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	@Override
	public String toString() {
		return "Reservation [reservationNo=" + reservationNo + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", memberNo=" + memberNo + ", managementNo=" + managementNo + ", totalPrice=" + totalPrice + "]";
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((endDate == null) ? 0 : endDate.hashCode());
		result = prime * result + managementNo;
		result = prime * result + memberNo;
		result = prime * result + reservationNo;
		result = prime * result + ((startDate == null) ? 0 : startDate.hashCode());
		result = prime * result + totalPrice;
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
		Reservation other = (Reservation) obj;
		if (endDate == null) {
			if (other.endDate != null)
				return false;
		} else if (!endDate.equals(other.endDate))
			return false;
		if (managementNo != other.managementNo)
			return false;
		if (memberNo != other.memberNo)
			return false;
		if (reservationNo != other.reservationNo)
			return false;
		if (startDate == null) {
			if (other.startDate != null)
				return false;
		} else if (!startDate.equals(other.startDate))
			return false;
		if (totalPrice != other.totalPrice)
			return false;
		return true;
	}
}

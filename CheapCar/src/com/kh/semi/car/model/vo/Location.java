package com.kh.semi.car.model.vo;

public class Location {

	private int locationNo;
	private int locationName;
	private int locationAddress;
	
	public Location() {
		super();
	}

	public Location(int locationNo, int locationName, int locationAddress) {
		super();
		this.locationNo = locationNo;
		this.locationName = locationName;
		this.locationAddress = locationAddress;
	}

	public int getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}

	public int getLocationName() {
		return locationName;
	}

	public void setLocationName(int locationName) {
		this.locationName = locationName;
	}

	public int getLocationAddress() {
		return locationAddress;
	}

	public void setLocationAddress(int locationAddress) {
		this.locationAddress = locationAddress;
	}

	@Override
	public String toString() {
		return "Location [locationNo=" + locationNo + ", locationName=" + locationName + ", locationAddress="
				+ locationAddress + "]";
	}
	
}

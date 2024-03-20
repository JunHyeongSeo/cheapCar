package com.kh.semi.car.model.vo;

public class Fuel {
	
	private int fuelNo;
	private String fuelName;
	
	public Fuel() {
		super();
	}

	public Fuel(int fuelNo, String fuelName) {
		super();
		this.fuelNo = fuelNo;
		this.fuelName = fuelName;
	}

	public int getFuelNo() {
		return fuelNo;
	}

	public void setFuelNo(int fuelNo) {
		this.fuelNo = fuelNo;
	}

	public String getFuelName() {
		return fuelName;
	}

	public void setFuelName(String fuelName) {
		this.fuelName = fuelName;
	}

	@Override
	public String toString() {
		return "Fuel [fuelNo=" + fuelNo + ", fuelName=" + fuelName + "]";
	}
	
}

package com.kh.semi.car.model.vo;

public class Option {

	private int managementNo;
	private int optionNo;
	private String optionName;
	private int optionPrice;
	
	public Option() {
		super();
	}

	public Option(int managementNo, int optionNo, String optionName, int optionPrice) {
		super();
		this.managementNo = managementNo;
		this.optionNo = optionNo;
		this.optionName = optionName;
		this.optionPrice = optionPrice;
	}

	public int getManagementNo() {
		return managementNo;
	}

	public void setManagementNo(int managementNo) {
		this.managementNo = managementNo;
	}

	public int getOptionNo() {
		return optionNo;
	}

	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public int getOptionPrice() {
		return optionPrice;
	}

	public void setOptionPrice(int optionPrice) {
		this.optionPrice = optionPrice;
	}

	@Override
	public String toString() {
		return "Option [managementNo=" + managementNo + ", optionNo=" + optionNo + ", optionName=" + optionName
				+ ", optionPrice=" + optionPrice + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + managementNo;
		result = prime * result + ((optionName == null) ? 0 : optionName.hashCode());
		result = prime * result + optionNo;
		result = prime * result + optionPrice;
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
		Option other = (Option) obj;
		if (managementNo != other.managementNo)
			return false;
		if (optionName == null) {
			if (other.optionName != null)
				return false;
		} else if (!optionName.equals(other.optionName))
			return false;
		if (optionNo != other.optionNo)
			return false;
		if (optionPrice != other.optionPrice)
			return false;
		return true;
	}

	
}

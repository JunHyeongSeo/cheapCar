package com.kh.semi.car.model.vo;

public class Model {

	private int modelNo;
	private String modelName;
	private int modelPrice;
	
	public Model() {
		super();
	}

	public Model(int modelNo, String modelName, int modelPrice) {
		super();
		this.modelNo = modelNo;
		this.modelName = modelName;
		this.modelPrice = modelPrice;
	}

	public int getModelNo() {
		return modelNo;
	}

	public void setModelNo(int modelNo) {
		this.modelNo = modelNo;
	}

	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	public int getModelPrice() {
		return modelPrice;
	}

	public void setModelPrice(int modelPrice) {
		this.modelPrice = modelPrice;
	}

	@Override
	public String toString() {
		return "Model [modelNo=" + modelNo + ", modelName=" + modelName + ", modelPrice=" + modelPrice + "]";
	}
	
}

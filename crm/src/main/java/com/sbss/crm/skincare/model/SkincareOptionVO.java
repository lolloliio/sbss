package com.sbss.crm.skincare.model;

public class SkincareOptionVO {

	private int skincareOptionId;
	
	private int skincareDetailId;
	
	private int programOptionId;
	
	private int cycle;
	
	private int price;
	
	private int employeeId;

	public int getSkincareOptionId() {
		return skincareOptionId;
	}

	public void setSkincareOptionId(int skincareOptionId) {
		this.skincareOptionId = skincareOptionId;
	}

	public int getSkincareDetailId() {
		return skincareDetailId;
	}

	public void setSkincareDetailId(int skincareDetailId) {
		this.skincareDetailId = skincareDetailId;
	}

	public int getProgramOptionId() {
		return programOptionId;
	}

	public void setProgramOptionId(int programOptionId) {
		this.programOptionId = programOptionId;
	}

	public int getCycle() {
		return cycle;
	}

	public void setCycle(int cycle) {
		this.cycle = cycle;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	
}

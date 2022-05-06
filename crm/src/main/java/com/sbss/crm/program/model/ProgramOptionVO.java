package com.sbss.crm.program.model;

public class ProgramOptionVO {
	
	private int rnum;
	
	private int programOptionId;
	
	private String programOptionName;
	
	private int price;
	
	private String useStatus;
	
	private String useStatusName;
	
	private int franchiseeId;

	private int employeeId;
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getProgramOptionId() {
		return programOptionId;
	}

	public void setProgramOptionId(int programOptionId) {
		this.programOptionId = programOptionId;
	}

	public String getProgramOptionName() {
		return programOptionName;
	}

	public void setProgramOptionName(String programOptionName) {
		this.programOptionName = programOptionName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getUseStatus() {
		return useStatus;
	}

	public void setUseStatus(String useStatus) {
		this.useStatus = useStatus;
	}

	public String getUseStatusName() {
		return useStatusName;
	}

	public void setUseStatusName(String useStatusName) {
		this.useStatusName = useStatusName;
	}

	public int getFranchiseeId() {
		return franchiseeId;
	}

	public void setFranchiseeId(int franchiseeId) {
		this.franchiseeId = franchiseeId;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

}

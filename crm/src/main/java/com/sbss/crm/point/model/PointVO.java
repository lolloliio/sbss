package com.sbss.crm.point.model;

public class PointVO {
	
	private int rnum;
	
	private int pointId;
	
	private int giftcardAmount;
	
	private int pointAmount;
	
	private int customerId;
	
	private String customerName;
	
	private int pointHistoryId;
	
	private String pointType;
		
	private String updateDate;		
	
	private int franchiseeId;
	
	private int employeeId;

	public int getPointId() {
		return pointId;
	}

	public void setPointId(int pointId) {
		this.pointId = pointId;
	}

	public int getGiftcardAmount() {
		return giftcardAmount;
	}

	public void setGiftcardAmount(int giftcardAmount) {
		this.giftcardAmount = giftcardAmount;
	}

	public int getPointAmount() {
		return pointAmount;
	}

	public void setPointAmount(int pointAmount) {
		this.pointAmount = pointAmount;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public int getPointHistoryId() {
		return pointHistoryId;
	}

	public void setPointHistoryId(int pointHistoryId) {
		this.pointHistoryId = pointHistoryId;
	}

	public String getPointType() {
		return pointType;
	}

	public void setPointType(String pointType) {
		this.pointType = pointType;
	}


	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
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

package com.sbss.crm.giftcard.model;

public class GiftcardVO {
	
	private int rnum;
	
	private int giftcardId;
	
	private int giftcardAmount;
	
	private int customerId;
	
	private String customerName;
	
	private int employeeId;
	
	private String updateDate;
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getGiftcardId() {
		return giftcardId;
	}

	public void setGiftcardId(int giftcardId) {
		this.giftcardId = giftcardId;
	}

	public int getGiftcardAmount() {
		return giftcardAmount;
	}

	public void setGiftcardAmount(int giftcardAmount) {
		this.giftcardAmount = giftcardAmount;
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

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

}

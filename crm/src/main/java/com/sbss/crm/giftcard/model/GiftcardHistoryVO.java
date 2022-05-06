package com.sbss.crm.giftcard.model;

public class GiftcardHistoryVO {

	private int rnum;
	
	private int customerId;
	
	private String customerName;
	
	private int giftcardId;
	
	private int earnAmount;
	
	private int useAmount;
	
	private int totalAmount;
	
	private String memo;
	
	private String useDate;
	
	private int paymentId;
	
	private int employeeId;
	
	private int card;
	
	private int cash;
	
	private int transfer;
	
	private String paymentType;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
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

	public int getGiftcardId() {
		return giftcardId;
	}

	public void setGiftcardId(int giftcardId) {
		this.giftcardId = giftcardId;
	}

	public int getEarnAmount() {
		return earnAmount;
	}

	public void setEarnAmount(int earnAmount) {
		this.earnAmount = earnAmount;
	}

	public int getUseAmount() {
		return useAmount;
	}

	public void setUseAmount(int useAmount) {
		this.useAmount = useAmount;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getUseDate() {
		return useDate;
	}

	public void setUseDate(String useDate) {
		this.useDate = useDate;
	}

	public int getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public int getCard() {
		return card;
	}

	public void setCard(int card) {
		this.card = card;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public int getTransfer() {
		return transfer;
	}

	public void setTransfer(int transfer) {
		this.transfer = transfer;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

}

package com.sbss.crm.payment.model;

public class PaymentVO {
	
	private int paymentId;
	
	private String paymentType;
	
	private int cash;
	
	private int card;
	
	private int transfer;
	
	private int receivables;
	
	private int discount;
	
	private int usePoint;
	
	private int useGiftcard;
	
	private int amountPayment;
	
	private String paymentDate;
	
	private int employeeId;

	public int getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public int getCard() {
		return card;
	}

	public void setCard(int card) {
		this.card = card;
	}

	public int getTransfer() {
		return transfer;
	}

	public void setTransfer(int transfer) {
		this.transfer = transfer;
	}

	public int getReceivables() {
		return receivables;
	}

	public void setReceivables(int receivables) {
		this.receivables = receivables;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getUsePoint() {
		return usePoint;
	}

	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}

	public int getUseGiftcard() {
		return useGiftcard;
	}

	public void setUseGiftcard(int useGiftcard) {
		this.useGiftcard = useGiftcard;
	}

	public int getAmountPayment() {
		return amountPayment;
	}

	public void setAmountPayment(int amountPayment) {
		this.amountPayment = amountPayment;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	
}

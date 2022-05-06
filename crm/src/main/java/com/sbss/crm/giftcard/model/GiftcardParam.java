package com.sbss.crm.giftcard.model;

import com.sbss.crm.common.model.DataTableVO;

public class GiftcardParam extends DataTableVO {
	
	private int franchiseeId;
	
	private int customerId;
	
	private String customerName;
	
	private int giftcardId;

	public int getFranchiseeId() {
		return franchiseeId;
	}

	public void setFranchiseeId(int franchiseeId) {
		this.franchiseeId = franchiseeId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public int getGiftcardId() {
		return giftcardId;
	}

	public void setGiftcardId(int giftcardId) {
		this.giftcardId = giftcardId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	
}

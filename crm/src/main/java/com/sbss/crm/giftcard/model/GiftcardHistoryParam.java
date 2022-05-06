package com.sbss.crm.giftcard.model;

import com.sbss.crm.common.model.DataTableVO;

public class GiftcardHistoryParam extends DataTableVO {
	
	private int franchiseeId;
	
	private int customerId;

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
	
}

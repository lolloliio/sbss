package com.sbss.crm.point.model;

import com.sbss.crm.common.model.DataTableVO;

public class PointHistoryParam extends DataTableVO {
	
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

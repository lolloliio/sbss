package com.sbss.crm.franchisee.model;

import com.sbss.crm.common.model.DataTableVO;

public class FranchiseeParam extends DataTableVO {
	
	private int franchiseeId;
	
	private String franchiseeName;
	
	private String franchiseeStatus;
	
	public int getFranchiseeId() {
		return franchiseeId;
	}

	public void setFranchiseeId(int franchiseeId) {
		this.franchiseeId = franchiseeId;
	}

	public String getFranchiseeName() {
		return franchiseeName;
	}

	public void setFranchiseeName(String franchiseeName) {
		this.franchiseeName = franchiseeName;
	}

	public String getFranchiseeStatus() {
		return franchiseeStatus;
	}

	public void setFranchiseeStatus(String franchiseeStatus) {
		this.franchiseeStatus = franchiseeStatus;
	}

}

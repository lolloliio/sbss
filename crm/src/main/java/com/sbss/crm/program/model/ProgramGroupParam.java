package com.sbss.crm.program.model;

import com.sbss.crm.common.model.DataTableVO;

public class ProgramGroupParam extends DataTableVO {
	
	private String gender;
	
	private String part;
	
	private int franchiseeId;

	public int getFranchiseeId() {
		return franchiseeId;
	}

	public void setFranchiseeId(int franchiseeId) {
		this.franchiseeId = franchiseeId;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}
	
}

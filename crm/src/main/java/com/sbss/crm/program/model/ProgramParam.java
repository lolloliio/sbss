package com.sbss.crm.program.model;

import com.sbss.crm.common.model.DataTableVO;

public class ProgramParam extends DataTableVO {

	private int programGroupId;
	
	private int programId;
	
	private int franchiseeId;
	
	private String gender;
	
	private String part;

	public int getProgramGroupId() {
		return programGroupId;
	}

	public void setProgramGroupId(int programGroupId) {
		this.programGroupId = programGroupId;
	}

	public int getProgramId() {
		return programId;
	}

	public void setProgramId(int programId) {
		this.programId = programId;
	}

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

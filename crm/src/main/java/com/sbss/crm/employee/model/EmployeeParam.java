package com.sbss.crm.employee.model;

import com.sbss.crm.common.model.DataTableVO;

public class EmployeeParam extends DataTableVO {
	
	private int employeeId;
	
	private int franchiseeId;

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public int getFranchiseeId() {
		return franchiseeId;
	}

	public void setFranchiseeId(int franchiseeId) {
		this.franchiseeId = franchiseeId;
	}
	
}

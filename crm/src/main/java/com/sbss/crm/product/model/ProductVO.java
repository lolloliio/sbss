package com.sbss.crm.product.model;

public class ProductVO {
	
	private int rnum;
	
	private int productId;
	
	private String productName;
	
	private String productType;
	
	private String productTypeName;
	
	private int price;
	
	private String memo;
	
	private String useStatus;
	
	private String useStatusName;
	
	private int franchiseeId;
	
	private int employeeId;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductTypeName() {
		return productTypeName;
	}

	public void setProductTypeName(String productTypeName) {
		this.productTypeName = productTypeName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getUseStatus() {
		return useStatus;
	}

	public void setUseStatus(String useStatus) {
		this.useStatus = useStatus;
	}

	public String getUseStatusName() {
		return useStatusName;
	}

	public void setUseStatusName(String useStatusName) {
		this.useStatusName = useStatusName;
	}

	public int getFranchiseeId() {
		return franchiseeId;
	}

	public void setFranchiseeId(int franchiseeId) {
		this.franchiseeId = franchiseeId;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	
}

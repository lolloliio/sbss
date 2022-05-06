package com.sbss.crm.booking.model;

public class CalendarParam {
	
	private int franchiseeId;

	private int cachebuster;
	
	private String start;
	
	private String end;
	
	public int getFranchiseeId() {
		return franchiseeId;
	}

	public void setFranchiseeId(int franchiseeId) {
		this.franchiseeId = franchiseeId;
	}

	public int getCachebuster() {
		return cachebuster;
	}

	public void setCachebuster(int cachebuster) {
		this.cachebuster = cachebuster;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}
	
}

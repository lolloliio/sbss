package com.sbss.crm.booking.model;

import com.sbss.crm.common.model.DataTableVO;

public class BookingParam extends DataTableVO {
	
	private int franchiseeId;
	
	private int bookingId;
	
	public int getFranchiseeId() {
		return franchiseeId;
	}

	public void setFranchiseeId(int franchiseeId) {
		this.franchiseeId = franchiseeId;
	}

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

}

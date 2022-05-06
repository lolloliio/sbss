<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script>

	var initTable = false;

    $(document).ready(function () {
    	
    	$('.clockpicker').clockpicker({
    	    placement: 'bottom',
    	    align: 'left',
    	    autoclose: true,
    	    'default': 'now'
    	});
    	
    	$('.datePicker').datepicker({
    		format: "yyyy-mm-dd",
    		language: "ko",
    		orientation: "bottom auto",
    		autoclose: true
		});

    	$('#customerName').on('click', function () {
    		if(!initTable){
    			fn_customerList();
    		}    		
    		new Custombox.modal({
				content: {
					effect: 'fadein',
					target: '#con-close-modal'
				}    		
			}).open();
    	});
    	
    	$('.close').on('click', function (){
    		Custombox.modal.close();
    	});
    	    	
    	$('#modifyBtn').click( function() {
    		
    		var bookingDate = $('#bookingDate').val();
    		var bookingTime = $('#bookingTime').val();
    		var bookingStatus = $('#bookingStatus').val();
    		var memo = $('#memo').val();
    		var receptionDate = $('#receptionDate').val();
    		var confirmDate = $('#confirmDate').val();
    		var confirmTime = $('#confirmTime').val();
    		var etc = $('#etc').val();
    		var employeeId = $('#employeeId').val();
    		    		    		
    		$.ajax({
    		    url: '<c:url value="/booking/updateBookingInformation"/>',
    		    type: 'POST',
				dataType: 'json',
    		    data: {
    		    	bookingId : '<c:out value="${booking.bookingId}"/>',
    		    	bookingDate : bookingDate,
    		    	bookingTime : bookingTime,
    		    	bookingStatus : bookingStatus,
    		    	memo : memo,
    		    	receptionDate : receptionDate,
    		    	confirmDate : confirmDate,
    		    	confirmTime : confirmTime,
    		    	etc : etc,
    		    	employeeId : employeeId
    		    },
    		    success: function(data) {
					if(data.result == 'success'){
	    	            Swal.fire({
	    	            	title : '<spring:message code="success.saved"/>',
							type: 'success',
							confirmButtonColor: '#ff9800'
						}).then(function(){
							if(data.result == 'success'){
								location.href = '<c:url value="/booking/bookingList"/>';
							}
						});
					}
    		    	
    		    }
    		});
    	});
    	
    	$('#listBtn').click( function() {
    		location.href = '<c:url value="/booking/bookingList"/>';
    	});
    	
    });
</script>

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            
                            <ol class="breadcrumb float-right p-0 m-0">
                                <li><a href="#"><spring:message code="booking.manageBooking"/></a></li>
                                <li class="active"><spring:message code="booking.selectBooking"/></li>
                            </ol>
                            <h4 class="page-title m-0"><spring:message code="booking.selectBooking"/></h4>
                        
                        </div>
                    </div>
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-border card-warning">
                            <div class="card-heading">
                            	<h4 class="m-t-0 header-title"><b><spring:message code="booking.bookingInformation"/></b></h4>
                            </div>
                        	
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-6">
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="booking.name"/><span class="text-danger">*</span></label>
											<div class="col-md-10 input-group">
												<div class="input-group-prepend">
													<span class="input-group-text bg-custom text-white b-0"></span>
												</div>
												<input type="hidden" class="form-control" id="customerId" name="customerId" value="<c:out value='${booking.customerId}'/>">
												<input type="text" class="form-control" id="customerName" name="customerName" value="<c:out value='${booking.customerName}'/>" readonly>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="booking.cellphoneNumber"/></label>
											<div class="col-md-10">
												<input type="text" class="form-control" id="cellphoneNumber" name="cellphoneNumber" value="<c:out value='${booking.cellphoneNumber}'/>" readonly>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="booking.franchisee"/></label>
											<div class="col-md-10">
												<input type="hidden" class="form-control" id="feanchiseeId" name="franchiseeId" value="<c:out value='${booking.franchiseeId}'/>">
												<input type="text" class="form-control" id="franchiseeName" name="franchiseeName" value="<c:out value='${booking.franchiseeName}'/>" readonly>
											</div>
										</div>
                                    </div>

                                    <div class="col-lg-6">
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="booking.bookingDate"/><span class="text-danger">*</span></label>
											<div class="col-md-10 input-group">
												<input type="text" class="form-control datePicker" id="bookingDate" name="bookingDate" value="<c:out value='${booking.bookingDate}'/>" readonly>
												<div class="input-group-append">
													<span class="input-group-text bg-custom text-white b-0"><i class="mdi mdi-calendar"></i></span>
												</div>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="booking.bookingTime"/><span class="text-danger">*</span></label>
											<div class="col-md-10 input-group clockpicker">
												<input type="text" class="form-control" id="bookingTime" name="bookingTime" value="<c:out value='${booking.bookingTime}'/>" readonly>
			                                    <div class="input-group-append">
			                                        <span class="input-group-text bg-custom text-white b-0"><i class="mdi mdi-clock"></i></span>
			                                    </div>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="booking.receptionDate"/></label>
											<div class="col-md-10 input-group">
												<input type="text" class="form-control datePicker" id="receptionDate" name="receptionDate" value="<c:out value='${booking.receptionDate}'/>">
												<div class="input-group-append">
													<span class="input-group-text bg-custom text-white b-0"><i class="mdi mdi-calendar"></i></span>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<div class="row">
                                    <div class="col-lg-12">
										<div class="form-group row">
											<label class="col-md-1 control-label"><spring:message code="booking.memo"/></label>
											<div class="col-md-11">
												<textarea class="form-control" id="memo" name="memo" rows="5"><c:out value='${booking.memo}'/></textarea>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-1 control-label"><spring:message code="booking.status"/><span class="text-danger">*</span></label>
											<div class="col-md-11">
												<select class="form-control" name="bookingStatus" id="bookingStatus">
													<option value="">선택하세요</option>
	                                            <c:forEach var="item" items="${bookingStatusList}">
                                                    <option value="<c:out value='${item.codeId}'/>" <c:if test='${item.codeId eq booking.bookingStatus}'>selected</c:if> ><c:out value='${item.codeName}'/></option>
												</c:forEach>
												</select>
											</div>
										</div>
										<div class="form-group row confirm">
											<label class="col-md-1 control-label"><spring:message code="booking.confirmDate"/></label>
											<div class="col-md-11 input-group">
												<input type="text" class="form-control datePicker" id="confirmDate" name="confirmDate" value="<c:out value='${booking.confirmDate}'/>">
												<div class="input-group-append">
													<span class="input-group-text bg-custom text-white b-0"><i class="mdi mdi-calendar"></i></span>
												</div>
											</div>
										</div>
										<div class="form-group row confirm">
											<label class="col-md-1 control-label"><spring:message code="booking.confirmTime"/></label>
											<div class="col-md-11 input-group clockpicker">
												<input type="text" class="form-control" id="confirmTime" name="confirmTime" value="<c:out value='${booking.confirmTime}'/>">
			                                    <div class="input-group-append">
			                                        <span class="input-group-text bg-custom text-white b-0"><i class="mdi mdi-clock"></i></span>
			                                    </div>
											</div>
										</div>
										<div class="form-group row confirm">
											<label class="col-md-1 control-label"><spring:message code="booking.otherConsultation"/></label>
											<div class="col-md-11">
												<textarea class="form-control" id="etc" name="etc" rows="5"><c:out value='${booking.etc}'/></textarea>
											</div>
										</div>
										<div class="form-group row confirm">
											<label class="col-md-1 control-label"><spring:message code="booking.staffInCharge"/></label>
											<div class="col-md-11">
												<select class="form-control" name="employeeId" id="employeeId">
													<option value=""><spring:message code="common.select"/></option>
	                                            <c:forEach var="item" items="${employeeList}">
                                                    <option value="<c:out value='${item.employeeId}'/>" <c:if test='${item.employeeId eq booking.employeeId}'>selected</c:if> ><c:out value='${item.employeeName}' /></option>
												</c:forEach>
												</select>
											</div>
										</div>							
									</div>
								</div>
								
                                <div>
                                	<button type="button" id="listBtn" class="btn btn-danger waves-effect waves-light m-t-20 m-r-10 float-right"><spring:message code="button.list"/></button>
                                	<button type="button" id="modifyBtn" class="btn btn-warning waves-effect waves-light m-t-20 m-r-10 float-right"><spring:message code="button.modify"/></button>                                	
                                </div>
								
                            </div>
                        </div>
                    </div><!-- end col -->
                </div>
                <!-- end row -->
                
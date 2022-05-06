<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script>

	$(document).ready(function() {
	    var calendarEl = document.getElementById('calendar');

	    var calendar = new FullCalendar.Calendar(calendarEl, {
	        plugins: [ 'dayGrid', 'timeGrid', 'list', 'interaction' ],
	        header: {
	            left: 'prev,next today',
	            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			defaultView: 'timeGridWeek',
			locale: 'ko',
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			allDaySlot: false,
	        eventLimit: true, // allow "more" link when too many events
	        minTime: '10:00:00',
	        maxTime: '24:00:00',
	        contentHeight: 'auto',
	        eventSources: [{
	        	events: function(info, successCallback, failureCallback) {
	        		$.ajax({
	        		    url: '<c:url value="/booking/selectCalEventList"/>',
	        		    type: 'POST',
	    				dataType: 'json',
	        		    data: {
	        		    	start : moment(info.startStr).format('YYYY-MM-DD'), 
	        		    	end : moment(info.endStr).format('YYYY-MM-DD')
	        		    },
	        		    success: function(data) {
	        		    	successCallback(data);
	        		    }
					});
	        	}
			}],
			eventAfterAllRender: function(view) {
				if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
					$('#calendar').fullCalendar('changeView', 'agendaDay');
				} //IF MOBILE CHANGE VIEW TO AGENDA DAY
			}
		});
	    
	    calendar.render();
	});
	
	function fn_openCustomerModal(bookingId){
		
		$.ajax({
		    url: '<c:url value="/booking/selectBookingInformation"/>',
		    type: 'POST',
			dataType: 'json',
		    data: {
		    	bookingId : bookingId
		    },
		    success: function(data) {
				$("#customerName").val(data.customerName);
				$("#cellphoneNumber").val(data.cellphoneNumber);
				$("#bookingDate").val(data.bookingDate);
				$("#bookingTime").val(data.bookingTime);
				$("#receptionDate").val(data.receptionDate);
				$("#memo").val(data.memo);
				$("#confirmDate").val(data.confirmDate);
				$("#confirmTime").val(data.confirmTime);
				$("#etc").val(data.etc);
				$("#employeeName").val(data.employeeName);
		    }
		});
		
		new Custombox.modal({
			content: {
				effect: 'fadein',
				target: '#con-close-modal'
			}    		
		}).open();
	}
		
</script>
<style>
	.fc-time-grid .fc-slats td {
  		height: 23px;  /* Edit as required */
	}
</style>

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            
                            <ol class="breadcrumb float-right p-0 m-0">
                                <li><a href="#"><spring:message code="booking.manageBooking"/></a></li>
                                <li class="active">예약 현황 조회</li>
                            </ol>
                            <h4 class="page-title m-0">예약 현황 조회</h4>
                        
                        </div>
                    </div>
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-border card-warning">
                            <div class="card-heading">
                            </div>
                        	
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div id="calendar"></div>
                                    </div>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div id="con-close-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title mt-0" id="myModalLabel">고객 정보</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="Custombox.modal.close();">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
 
                                <div class="row">
                                    <div class="col-lg-12">
										<div class="form-group row">
											<label class="col-md-4 control-label"><spring:message code="booking.name"/></label>
											<div class="col-md-8">
												<input type="text" class="form-control" id="customerName" name="customerName" value="">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group row">
											<label class="col-md-4 control-label"><spring:message code="booking.cellphoneNumber"/></label>
											<div class="col-md-8">
												<input type="text" class="form-control" id="cellphoneNumber" name="cellphoneNumber" value="">
											</div>
										</div>
                                    </div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group row">
											<label class="col-md-4 control-label">예약일시</label>
											<div class="col-md-8 input-group">
												<input type="text" class="form-control" id="bookingDate" name="bookingDate" value="">
												&nbsp;
												<input type="text" class="form-control" id="bookingTime" name="bookingTime" value="">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group row">
											<label class="col-md-4 control-label"><spring:message code="booking.receptionDate"/></label>
											<div class="col-md-8">
												<input type="text" class="form-control" id="receptionDate" name="receptionDate" value="">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
                                    <div class="col-lg-12">
										<div class="form-group row">
											<label class="col-md-4 control-label"><spring:message code="booking.memo"/></label>
											<div class="col-md-8">
												<textarea class="form-control" id="memo" name="memo" rows="2"></textarea>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">										
										<div class="form-group row">
											<label class="col-md-4 control-label">확정일시</label>
											<div class="col-md-8 input-group">
												<input type="text" class="form-control" id="confirmDate" name="confirmDate" value="">
												&nbsp;
												<input type="text" class="form-control" id="confirmTime" name="confirmTime" value="">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">										
										<div class="form-group row">
											<label class="col-md-4 control-label"><spring:message code="booking.otherConsultation"/></label>
											<div class="col-md-8">
												<textarea class="form-control" id="etc" name="etc" rows="2"></textarea>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">										
										<div class="form-group row">
											<label class="col-md-4 control-label"><spring:message code="booking.staffInCharge"/></label>
											<div class="col-md-8">
												<input type="text" class="form-control" id="employeeName" name="employeeName" value="">
											</div>
										</div>
									</div>
								</div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal" onclick="Custombox.modal.close();">닫기</button>                                
                            </div>
                        </div>
                    </div>
                </div><!-- /.modal -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script>
	var initTable = false;
	var table;

    $(document).ready(function () {
    	
    	$('#receptionDate').val(getToday());
    	
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
    	
    	
    	$('#bookingStatus').change(function(){
    		var status = $(this).val();
    		if(status != 'BKS0001'){
    			$('.confirm').show();
    		}else{
    			$('.confirm').hide();
    		}
    	});
    	
    	$('#saveBtn').click( function() {
    		
    		var bookingDate = $('#bookingDate').val();
    		var bookingTime = $('#bookingTime').val();
    		var bookingStatus = $('#bookingStatus').val();
    		var memo = $('#memo').val();
    		var receptionDate = $('#receptionDate').val();
    		var confirmDate = $('#confirmDate').val();
    		var confirmTime = $('#confirmTime').val();
    		var etc = $('#etc').val();
    		var customerId = $('#customerId').val();
    		    		    		
    		$.ajax({
    		    url: '<c:url value="/booking/insertBookingInformation"/>',
    		    type: 'POST',
				dataType: 'json',
    		    data: {
    		    	bookingDate : bookingDate,
    		    	bookingTime : bookingTime,
    		    	bookingStatus : bookingStatus,
    		    	memo : memo,
    		    	receptionDate : receptionDate,
    		    	confirmDate : confirmDate,
    		    	confirmTime : confirmTime,
    		    	etc : etc,
    		    	customerId : customerId
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
    	
    	function fn_customerList(){
			initTable = true;    		
    		//데이터 조회
    	    table = $("#customerTable").DataTable({
    			"serverSide": true,
    			"processing": true,
    			"searching": true,
    			"lengthChange": false,
    	        "language" : {
    	            "url" : "<c:url value='/resources/js/Korean.json'/>"
    	        },
    			"order" : [[ 1, "desc" ]],
    	        ajax: {
    				"type" : "POST",
    				"url" : "<c:url value='/customer/selectCustomerList'/>",
    			    "data" : function (data) {
    					return JSON.stringify(data);
    				},
    				"dataType": "json",
    				"contentType": "application/json; charset=utf-8",
    				"dataSrc": "data"
    	        },
    	        columns: [
    	        	{ data: "customerId", "visible": false},
    	        	{ data: "chartId" },
    	        	{ data: "customerName" },
    	        	{ data: "cellphoneNumber" },
    	        	{ data: "franchiseeId", "visible": false},
    	        	{ data: "franchiseeName", "visible": false},
    	        ]
    	    });
    		
    	    $('#customerTable tbody').on('click', 'td', function (e) {
                var tdIndex = this.cellIndex;
                if (tdIndex != 0){
           	        var rowData = table.row($(this).closest('tr')).data();
           	        $('#customerId').val(rowData.customerId);
           	        $('#customerName').val(rowData.customerName);
           	        $('#cellphoneNumber').val(rowData.cellphoneNumber);
           	        $('#feanchiseeId').val(rowData.franchiseeId);
           	        $('#franchiseeName').val(rowData.franchiseeName);
           	        Custombox.modal.close();
                }
        	});
    	}

    });
</script>

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            
                            <ol class="breadcrumb float-right p-0 m-0">
                                <li><a href="#"><spring:message code="booking.manageBooking"/></a></li>
                                <li class="active"><spring:message code="booking.regBooking"/></li>
                            </ol>
                            <h4 class="page-title m-0"><spring:message code="booking.regBooking"/></h4>
                        
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
													<span class="input-group-text bg-custom text-white b-0"><i class="fa fa-user"></i></span>
												</div>
												<input type="hidden" class="form-control" id="customerId" name="customerId" value="">
												<input type="text" class="form-control" id="customerName" name="customerName" value="" required="">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="booking.cellphoneNumber"/></label>
											<div class="col-md-10">
												<input type="text" class="form-control" id="cellphoneNumber" name="cellphoneNumber" value="" readonly>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="booking.franchisee"/></label>
											<div class="col-md-10">
												<input type="hidden" class="form-control" id="feanchiseeId" name="feanchiseeId" value="">
												<input type="text" class="form-control" id="franchiseeName" name="franchiseeName" value="" readonly>
											</div>
										</div>
                                    </div>

                                    <div class="col-lg-6">
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="booking.bookingDate"/><span class="text-danger">*</span></label>
											<div class="col-md-10 input-group">
												<input type="text" class="form-control datePicker" id="bookingDate" name="bookingDate" value="">
												<div class="input-group-append">
													<span class="input-group-text bg-custom text-white b-0"><i class="mdi mdi-calendar"></i></span>
												</div>
											</div>
										</div>										
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="booking.bookingTime"/><span class="text-danger">*</span></label>
											<div class="col-md-10 input-group clockpicker">
												<input type="text" class="form-control" id="bookingTime" name="bookingTime" value="">
			                                    <div class="input-group-append">
			                                        <span class="input-group-text bg-custom text-white b-0"><i class="mdi mdi-clock"></i></span>
			                                    </div>
											</div>											
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="booking.receptionDate"/></label>
											<div class="col-md-10 input-group">
												<input type="text" class="form-control datePicker" id="receptionDate" name="receptionDate" value="">
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
												<textarea class="form-control" id="memo" name="memo" rows="5"></textarea>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-1 control-label"><spring:message code="booking.status"/><span class="text-danger">*</span></label>
											<div class="col-md-11">
												<select class="form-control" name="bookingStatus" id="bookingStatus">
													<option value="">선택하세요</option>
	                                            <c:forEach var="item" items="${bookingStatusList}">
                                                    <option value="<c:out value='${item.codeId}'/>" ><c:out value='${item.codeName}'/></option>
												</c:forEach>
												</select>
											</div>
										</div>
										<!-- 확정일 경우에만 표시 -->
										<div class="form-group row confirm" style="display:none">
											<label class="col-md-1 control-label"><spring:message code="booking.confirmDate"/></label>
											<div class="col-md-11 input-group">
												<input type="text" class="form-control datePicker" id="confirmDate" name="confirmDate" value="">
												<div class="input-group-append">
													<span class="input-group-text bg-custom text-white b-0"><i class="mdi mdi-calendar"></i></span>
												</div>
											</div>
										</div>
										<div class="form-group row confirm" style="display:none">
											<label class="col-md-1 control-label"><spring:message code="booking.confirmTime"/></label>
											<div class="col-md-11 input-group clockpicker">
												<input type="text" class="form-control" id="confirmTime" name="confirmTime" value="">
			                                    <div class="input-group-append">
			                                        <span class="input-group-text bg-custom text-white b-0"><i class="mdi mdi-clock"></i></span>
			                                    </div>
											</div>
										</div>
										<div class="form-group row confirm" style="display:none">
											<label class="col-md-1 control-label"><spring:message code="booking.otherConsultation"/></label>
											<div class="col-md-11">
												<textarea class="form-control" id="etc" name="etc" rows="5"></textarea>
											</div>
										</div>
										<div class="form-group row confirm" style="display:none">
											<label class="col-md-1 control-label"><spring:message code="booking.staffInCharge"/></label>
											<div class="col-md-11">
												<select class="form-control" name="employeeId" id="employeeId">
													<option value=""><spring:message code="common.select"/></option>
	                                            <c:forEach var="item" items="${employeeList}">
                                                    <option value="<c:out value='${item.employeeId}'/>" ><c:out value='${item.employeeName}'/></option>
												</c:forEach>
												</select>
											</div>
										</div>							
									</div>
								</div>
								
                                <div>
                                	<button type="button" id="listBtn" class="btn btn-danger waves-effect waves-light m-t-20 m-r-10 float-right"><spring:message code="button.list"/></button>
                                	<button type="button" id="saveBtn" class="btn btn-warning waves-effect waves-light m-t-20 m-r-10 float-right"><spring:message code="button.save"/></button>                                	
                                </div>
								
                            </div>
                        </div>
                    </div><!-- end col -->
                </div>
                <!-- end row -->
                
                <div id="con-close-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog" style="width:800px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title mt-0">고객 정보</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <table id="customerTable"
                                        class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                    <tr>
                                    	<th><spring:message code="booking.customerId"/></th>
                                        <th><spring:message code="booking.number"/></th>
                                        <th><spring:message code="booking.name"/></th>
                                        <th><spring:message code="booking.cellphoneNumber"/></th>
                                        <th><spring:message code="booking.franchiseeId"/></th>
                                        <th><spring:message code="booking.franchiseeName"/></th>
                                    </tr>
                                    </thead>
                                </table>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal" onclick="Custombox.modal.close();">닫기</button>                                
                            </div>
                        </div>
                    </div>
                </div><!-- /.modal -->

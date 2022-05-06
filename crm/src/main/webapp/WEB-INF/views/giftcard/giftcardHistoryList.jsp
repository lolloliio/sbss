<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>

	var table;

    $(document).ready(function () {
    	
    	$('#useDate').val(getToday());
    	
    	$('#useDate').datepicker({
    		format: "yyyy-mm-dd",
    		language: "ko",
    		orientation: "top auto",
    		autoclose: true
		});
    	
    	//데이터 조회
	    table = $("#giftcardHistoryTable").DataTable({
			"serverSide": true,
			"processing": true,
			"searching": false,
			"destroy": true,
	        "language" : {
	            "url" : "<c:url value='/resources/js/Korean.json'/>"
	        },
			"order" : [[ 1, "desc" ]],
	        ajax: {
				"type" : "POST",
				"url" : "<c:url value='/giftcard/selectGiftcardHistoryList'/>",
			    "data" : function (data) {
			    	data.customerId = $("#customerId").val();
					return JSON.stringify(data);
				},
				"dataType": "json",
				"contentType": "application/json; charset=utf-8",
				"dataSrc": "data"
	        },
	        columns: [
	        	{ data: "giftcardId", visible:false },
	        	{ data: "rnum" },
	        	{ data: "card" },
	        	{ data: "cash" },
	        	{ data: "transfer" },
	        	{ data: "earnAmount" },
	        	{ data: "useAmount" },
	        	{ data: "totalAmount" },
	        	{ data: "memo"},
	        	{ data: "useDate" },
	        ],
	        columnDefs: [
	        	{ targets: [8], className: 'dt-head-center dt-body-left'},
	        	{ targets: [1,9], className: 'dt-head-center dt-body-center'},
	        	{ targets: [2,3,4,5,6,7], className: 'dt-head-center dt-body-right'},
	        	{ targets: 0, width: "0%" },
	            { targets: 1, width: "10%" },
	            { targets: 2, width: "10%" },
	            { targets: 3, width: "10%" },
	            { targets: 4, width: "10%" },
	            { targets: 5, width: "10%" },
	            { targets: 6, width: "10%" },
	            { targets: 7, width: "10%" },
	            { targets: 8, width: "20%" },
	            { targets: 9, width: "10%" },
			],	        
	    });
    	
    	$("#saveBtn").click(function(){
    		var giftcardId = $("#giftcardId").val();
    		var customerId = $("#customerId").val();
    		var memo = $("#memo").val();
    		var useDate = $("#useDate").val();
    		var paymentType = $("#paymentType").val();
    		var card = $("#card").val();
    		var cash = $("#cash").val();
    		var transfer = $("#transfer").val();
    		
    		if(paymentType == "PMT0004"){
    			if(card > 0){
    				card = card * -1;
    			}
    			if(cash > 0){
    				cash = cash * -1;
    			}
    			if(transfer > 0){
    				transfer = transfer * -1;
    			}
    		}
    		
    		var earnAmount = parseInt(card) + parseInt(cash) + parseInt(transfer);
    		
    		$.ajax({
    		    url: '<c:url value="/giftcard/insertGiftcardInformation"/>',
    		    type: 'POST',
				dataType: 'json',
    		    data: {
    		    	giftcardId : giftcardId,
    		    	customerId : customerId,
    		    	earnAmount : earnAmount,
    		    	memo : memo,
    		    	useDate : useDate,
    		    	paymentType : paymentType,
    		    	card : card,
    		    	cash : cash,
    		    	transfer : transfer
    		    },
    		    success: function(data) {
					if(data.result == 'success'){
	    	            Swal.fire({
	    	            	title : '<spring:message code="success.saved"/>',
							type: 'success',
							confirmButtonColor: '#ff9800'
						}).then(function(){
							fn_clear();
							table.draw();
						});
					}
    		    }
    		});
    	});
    	
    	$("#clearBtn").click(function(){
    		fn_clear();		
    	});
    	
    	$("#listBtn").click(function(){
    		location.href = "<c:url value='/giftcard/giftcardList'/>";		
    	});
    	    	
    });
    
    function fn_clear(){
    	$("#paymentType").val("");
    	$("#card").val("");
    	$("#cash").val("");
    	$("#transfer").val("");
    	$("#memo").val("");    	
    	$('#useDate').val(getToday());
    }    
	
</script>
				<input type="hidden" id="giftcardId" name="giftcardId" value="<c:out value='${giftcardId}'/>" />
				<input type="hidden" id="customerId" name="customerId" value="<c:out value='${customerId}'/>" />
                
                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            <ol class="breadcrumb float-right p-0 m-0">
                                <li><a href="#"><spring:message code="gift.manageGiftcard"/></a></li>
                                <li class="active"><spring:message code="gift.giftcardHistory"/></li>
                            </ol>
                            <h5 class="m-t-0 m-b-20 font-600"><spring:message code="gift.customerGiftcardHistory"/></h5>
                         </div>

                    </div>
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-border card-warning">
                            <div class="card-heading"></div>
                            <div class="card-body table-responsive">
								
								<h5 class="m-t-0 m-b-20 font-600"><spring:message code="gift.customerGiftcardHistory" arguments="${customerName}" /></h5>

                                <table id="giftcardHistoryTable"
                                        class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                    <tr>
                                    	<th><spring:message code="gift.giftcardId"/></th>
                                    	<th><spring:message code="gift.rowNumber"/></th>
                                    	<th>카드</th>
                                    	<th>현금</th>
                                    	<th>계좌이체</th>
                                    	<th><spring:message code="gift.earnAmount"/></th>
                                    	<th><spring:message code="gift.useAmount"/></th>
                                        <th><spring:message code="gift.balance"/></th>
                                        <th><spring:message code="gift.memo"/></th>
                                        <th><spring:message code="gift.regDate"/></th>
                                    </tr>
                                    </thead>
                                </table>
                                
								<h5 class="m-t-30 m-b-20 font-600">기프트카드 금액 관리</h5>
                                
								<div class="row">
									<div class="col-sm-12">
				                        <div class="card card-border">
				                            <div class="card-body">
												<div class="row">
													<div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-1 control-label">결제구분</label>
															<div class="col-md-11">
																<input type="hidden" id="earnAmount" name="earnAmount" value=""/>
					                                            <select class="form-control" id="paymentType" name="paymentType">
					                                            	<option value=""><spring:message code="common.select"/></option>
				                                                    <option value="PMT0003" >기프트카드 결제</option>
				                                                    <option value="PMT0004" >기프트카드 결제 취소</option>
					                                            </select>
															</div>
									                	</div>
									                </div>
												</div>
												<div class="row">
													<div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-1 control-label">현금</label>
															<div class="col-md-11">
																<span id="rnum"></span>
																<input type="text" id="cash" name="cash" class="form-control" value=""/>
															</div>
									                	</div>
									                </div>
												</div>
												<div class="row">
													<div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-1 control-label">카드</label>
															<div class="col-md-11">
																<span id="rnum"></span>
																<input type="text" id="card" name="card" class="form-control" value=""/>
															</div>
									                	</div>
									                </div>
								                </div>
								                <div class="row">
													<div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-1 control-label">계좌입금</label>
															<div class="col-md-11">
																<span id="rnum"></span>
																<input type="text" id="transfer" name="transfer" class="form-control" value=""/>
															</div>
									                	</div>
									                </div>
								                </div>
												<div class="row">
								                	<div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-1 control-label">메모</label>
															<div class="col-md-11">
																<textarea id="memo" name="memo" class="form-control" row="5"></textarea>
															</div>
														</div>
								                	</div>
								                </div>
								                <div class="row">
								                	<div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-1 control-label">적립일</label>
															<div class="col-md-11">
																<input type="text" id="useDate" name="useDate" class="form-control" value=""/>
															</div>
														</div>
								                	</div>
								                </div>
				                            </div>
										</div>
									</div>
								</div>                
				                <div class="row">
				                	<div class="col-lg-12">
				                		<button type="button" id="listBtn" class="btn btn-warning waves-effect waves-light m-r-10 float-right"><spring:message code="button.list"/></button>
										<button type="button" id="saveBtn" class="btn btn-danger waves-effect waves-light m-r-10 float-right"><spring:message code="button.reg"/></button>
									</div>
				                </div>
				                
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
				
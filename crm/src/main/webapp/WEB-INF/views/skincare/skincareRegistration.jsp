<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script>

	var programList;

    $(document).ready(function () {
    	
    	$('#manageDate').val(getToday());
    	
    	$('#paymentDate').val(getToday());
    	
    	$('#manageDate').datepicker({
    		format: "yyyy-mm-dd",
    		language: "ko",
    		orientation: "bottom auto",
    		autoclose: true
		});
    	
    	$('#paymentDate').datepicker({
    		format: "yyyy-mm-dd",
    		language: "ko",
    		orientation: "bottom auto",
    		autoclose: true
		});
    	
    	$('#listBtn').click( function() {
    		location.href = '<c:url value="/skincare/skincareList"/>';
    	});
    	
    	$('#saveBtn').click( function() {
    		fn_reg();
    	});
    	
    	$('input[name=programOptionId]').change(function(){
    		fn_calc();
    	});
        	
		$('input[name=programOptionCycle]').change(function(){
			fn_calc();
		});
		
		$('#point,#giftcard,#card,#cash,#transfer').change(function(){
			fn_calc();
		});
    });
    
    function fn_getProgramGroup(programGroupId){
    	
    	var gender = $("#gender").val();
    	var part = $("#part").val();
    	
    	if(gender == "" || part == ""){
    		return false;
    	}
    
		$.ajax({
		    url: '<c:url value="/program/selectProgramGroupCodeList"/>',
		    type: 'POST',
			dataType: 'json',
		    data: {
		    	gender : gender,
		    	part : part	    	
		    },
		    success: function(data) {
		    	$("#programGroupId").html('<option value="0"><spring:message code="common.select"/></option>');
		    	for(var i=0; i<data.length; i++){
		    		if(programGroupId != "" && data[i].programGroupId == programGroupId){
		    			$("#programGroupId").append("<option value='" + data[i].programGroupId + "' selected>" + data[i].programGroupName + "</option>");
		    		}else{
		    			$("#programGroupId").append("<option value='" + data[i].programGroupId + "'>" + data[i].programGroupName + "</option>");
		    		}
		    	}
		    }
		});
    }
    
    function fn_getProgramCode(programId){
    	
    	var programGroupId = $("#programGroupId").val();
    	
    	if(gender == "" || part == ""){
    		return false;
    	}
    
		$.ajax({
		    url: '<c:url value="/program/selectProgramCodeList"/>',
		    type: 'POST',
			dataType: 'json',
		    data: {
		    	programGroupId : programGroupId
		    },
		    success: function(data) {
		    	programList = data;		    	
		    	$("#programId").html('<option value="0"><spring:message code="common.select"/></option>');
		    	for(var i=0; i<data.length; i++){
		    		if(programGroupId != "" && data[i].programId == programId){
		    			$("#programId").append("<option value='" + data[i].programId + "' selected>" + data[i].cycle + "회</option>");
		    		}else{
		    			$("#programId").append("<option value='" + data[i].programId + "'>" + data[i].cycle + "회</option>");
		    		}
		    	}
		    }
		});
    }
    
    function fn_programAmount(programId){
		for(var i=0; i<programList.length; i++){
			if(programId == programList[i].programId){
				$("#programAmount").val(programList[i].price);
				fn_calc();
			}
		}
    }
    
    function fn_customerInfomation(pageType){
		$('#listForm').prop("action", "<c:url value='/customer/customerInformation'/>");
		$('#pageType').val(pageType);
		$('#listForm').submit();
    }
    
    function fn_calc(){
    	var programAmount = $("#programAmount").val();
    	var giftcard = $("#giftcard").val();
    	var point = $("#point").val();
    	var card = $("#card").val();
    	var cash = $("#cash").val();
    	var transfer = $("#transfer").val();
    	    	
    	var programOptionTotalPrice = 0;
    	$("input[name=programChkOptId]").each(function() {
    		var bChecked = $(this).prop('checked');
			var programOptionId = this.value;
    		if(this.checked){
    			if($("#programOptionCycle_"+programOptionId).val() == ""){
    				$("#programOptionCycle_"+programOptionId).val(1);
    			}    			
    			var programOptionPrice = $("#programOptionPrice_"+programOptionId).val();
    			var programOptionCycle = $("#programOptionCycle_"+programOptionId).val();
    			var programOptionAmount = Number(programOptionPrice) * Number(programOptionCycle);
    			programOptionTotalPrice = programOptionTotalPrice + programOptionAmount;
    		}else{
    			$("#programOptionCycle_"+programOptionId).val("");
    		}
    	});
    	
    	var totalDiscountPrice = Number(point || 0) + Number(giftcard || 0);
    	var totalPrice = Number(programOptionTotalPrice) + Number(programAmount) - Number(totalDiscountPrice);
    	var totalPayment = Number(card || 0) + Number(cash || 0) + Number(transfer || 0);
    	var receivables = totalPrice - totalPayment;
    	
    	$("#cycleProgramPrice").val(programAmount);
    	$("#cycleDiscountPrice").val(totalDiscountPrice);
    	$("#cycleOptionPrice").val(programOptionTotalPrice);
    	$("#cycleTotalPrice").val(totalPrice);
    	$("#cyclePayment").val(totalPayment);
    	$("#cycleReceivables").val(receivables);
    	
    	
    	$("#totalDiscountPrice").val(totalDiscountPrice);
    	$("#totalOptionPrice").val(programOptionTotalPrice);
    	$("#totalPrice").val(totalPrice);
    	$("#totalPayment").val(totalPayment);
    	$("#totalReceivables").val(receivables);
    }
    
    function fn_reg(){
    	    	
		$.ajax({
		    url: '<c:url value="/skincare/insertSkincareInformation"/>',
		    type: 'POST',
			dataType: 'json',
		    data: $("#regForm").serialize(),	    
		    success: function(data) {
				if(data.result == 'success'){
    	            Swal.fire({
    	            	title : '<spring:message code="success.saved"/>',
						type: 'success',
						confirmButtonColor: '#ff9800'
					})
				}
		    }
		});
    }
               
</script>

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            
                            <ol class="breadcrumb float-right p-0 m-0">
                                <li><a href="#"><spring:message code="customer.manageCustomer"/></a></li>
                                <li class="active">고객 조회</li>
                            </ol>
                            <h4 class="page-title m-0">고객 조회</h4>
                        
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
                            
								<ul class="nav nav-tabs" role="tablist">
									<li class="nav-item">
										<a class="nav-link" id="information-tab" data-toggle="tab" href="#" onclick="fn_customerInfomation('information');" role="tab" aria-controls="information" aria-selected="true">
											<span class="d-block d-sm-none"><i class="fa fa-home"></i></span>
											<span class="d-none d-sm-block">고객 정보</span>
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link active" id="skincare-tab" data-toggle="tab" href="#" onclick="fn_customerInfomation('skincare');" role="tab" aria-controls="skincare" aria-selected="false">        
											<span class="d-block d-sm-none"><i class="fa fa-user"></i></span>
											<span class="d-none d-sm-block">관리 프로그램</span>
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="point-tab" data-toggle="tab" href="#" onclick="fn_customerInfomation('point');" role="tab" aria-controls="point" aria-selected="false">
											<span class="d-block d-sm-none"><i class="fa fa-envelope-o"></i></span>
											<span class="d-none d-sm-block">포인트</span>
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="giftcard-tab" data-toggle="tab" href="#" onclick="fn_customerInfomation('giftcard');" role="tab" aria-controls="giftcard" aria-selected="false">
											<span class="d-block d-sm-none"><i class="fa fa-cog"></i></span>
											<span class="d-none d-sm-block">기프트카드</span>
										</a>
									</li>
								</ul>
								
								<div class="tab-content">
																	
									<h5 class="m-t-10 m-b-20 ">프로그램 정보</h5>
									<form name="regForm" method="post">
					                <div class="row">
					                    <div class="col-sm-12">
					                        <div class="card card-border">
					                            <div class="card-body">
					                            
													<div class="row">
					                                    <div class="col-lg-12">
															<div class="form-group row">
																<label class="col-md-2 control-label">회원정보</label>					                                    
																<div class="col-md-10">
																	<div class="col-md-12 input-group" style="padding:0px">
																		<div class="col-md-6" style="padding-left:0px;">
																			<label class="control-label">회원명</label>	
																			<div class="m-b-10 input-group">
																				<div class="input-group-prepend">
																					<span class="input-group-text bg-custom text-white b-0"><i class="fa fa-user"></i></span>
																				</div>																			
																				<input type="hidden" id="customerId" name="customerId" value="<c:out value='${customer.customerId}'/>" />
																				<input type="text" class="form-control" id="customerName" name="customerName" value="<c:out value='${customer.customerName}'/>" readonly />
																			</div>
																		</div>
																		<div class="col-md-6" style="padding-left:0px;padding-right:0px">
																			<label class="control-label">전화번호</label>	
																			<div class="m-b-10">
																				<input type="text" class="form-control" id="cellphoneNumber" name="cellphoneNumber" value="<c:out value='${customer.cellphoneNumber}'/>" readonly />
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>					                            
					                                <div class="row">
					                                	<div class="col-lg-12">
															<div class="form-group row">
																<label class="col-md-2 control-label">프로그램</label>
																<div class="col-md-10 input-group">
																	<div class="col-md-3" style="padding-left:0px;">
																		<label class="control-label">성별</label>	
																		<select class="form-control" id="gender" name="gender" onchange="fn_getProgramGroup()">
																			<option value=""><spring:message code='common.select'/></option>
							                                            <c:forEach var="item" items="${genderList}">
						                                                    <option value="<c:out value='${item.codeId}'/>" ><c:out value='${item.codeName}'/></option>
																		</c:forEach>
																		</select>
																	</div>
																	<div class="col-md-3" style="padding-left:0px;">
																		<label class="control-label">구분</label>	
																		<select class="form-control" id="part" name="part" onchange="fn_getProgramGroup()">
																			<option value=""><spring:message code='common.select'/></option>
							                                            <c:forEach var="item" items="${partList}">
						                                                    <option value="<c:out value='${item.codeId}'/>" ><c:out value='${item.codeName}'/></option>
																		</c:forEach>
																		</select>
																	</div>
																	<div class="col-md-3" style="padding-left:0px;">
																		<label class="control-label">프로그램</label>	
																		<select class="form-control" id="programGroupId" name="programGroupId" onchange="fn_getProgramCode()">
																			<option value=""><spring:message code='common.select'/></option>
																		</select>
																	</div>
																	<div class="col-md-3" style="padding-left:0px;padding-right:0px">
																		<label class="control-label">회차</label>	
																		<select class="form-control" id="programId" name="programId" onchange="fn_programAmount(this.value)">
																			<option value=""><spring:message code='common.select'/></option>
																		</select>
																	</div>
																</div>
															</div>
					                                	</div>
					                                </div>
 													<div class="row">
					                                    <div class="col-lg-12">
															<div class="form-group row">
																<label class="col-md-2 control-label">전체 금액</label>					                                    
																<div class="col-md-10">
																	<div class="col-md-12 input-group" style="padding:0px">
																		<div class="col-md-2" style="padding-left:0px">
																			<label class="control-label">프로그램 금액</label>	
																			<div class="m-b-10">
																				<input type="text" class="form-control" id="programAmount" name="programAmount" value="0" readonly />
																			</div>
																		</div>
																		<div class="col-md-2" style="padding-left:0px;">
																			<label class="control-label">옵션 금액</label>	
																			<div class="m-b-10">
																				<input type="number" class="form-control" id="totalOptionPrice" name="totalOptionPrice" value="0" readonly />
																			</div>
																		</div>
																		<div class="col-md-2" style="padding-left:0px;">
																			<label class="control-label">할인 금액</label>	
																			<div class="m-b-10">
																				<input type="number" class="form-control" id="totalDiscountPrice" name="totalDiscountPrice" value="0" readonly />
																			</div>
																		</div>
																		<div class="col-md-2" style="padding-left:0px;">
																			<label class="control-label">전체 금액</label>	
																			<div class="m-b-10">
																				<input type="number" class="form-control" id="totalPrice" name="totalPrice" value="0" readonly />
																			</div>
																		</div>
																		<div class="col-md-2" style="padding-left:0px;">
																			<label class="control-label">지불 금액</label>	
																			<div class="m-b-10">
																				<input type="number" class="form-control" id="totalPayment" name="totalPayment" value="0" readonly />
																			</div>
																		</div>
																		<div class="col-md-2" style="padding-left:0px;padding-right:0px">
																			<label class="control-label">미수 금액</label>	
																			<div class="m-b-10">
																				<input type="number" class="form-control" id="totalReceivables" name="totalReceivables" value="0" readonly />
																			</div>
																		</div>																		
																	</div>
																</div>
															</div>
					                                	</div>
					                                </div>
					                                <div class="row">
					                                	<div class="col-lg-12">
															<div class="form-group row">
																<label class="col-md-2 control-label">서비스 회차 추가</label>
																<div class="col-md-10">
																	<input type="number" class="form-control" id="eventCycle" name="eventCycle" value="" />
																</div>
															</div>
					                                	</div>
					                                </div>
					                                <div class="row">
					                                	<div class="col-lg-12">
															<div class="form-group row">
																<label class="col-md-2 control-label">비고</label>
																<div class="col-md-10">
																	<textarea id="etc" name="etc" rows="3" class="form-control"></textarea>
																</div>
															</div>
					                                	</div>
					                                </div>
					                                <div class="row">
					                                    <div class="col-lg-12">
															<div class="form-group row">
																<label class="col-md-2 control-label">관리상태</label>
																<div class="col-md-10">
																	<select class="form-control" id="skincareStatus" name="skincareStatus">
						                                            <c:forEach var="item" items="${skincareStatusList}">
					                                                    <option value="<c:out value='${item.codeId}'/>" ><c:out value='${item.codeName}'/></option>
																	</c:forEach>
																	</select>
																</div>
															</div>
					                                    </div>
					                                </div>
												</div>
											</div>
										</div>
									</div>
					                
					                <h5 class="m-t-10 m-b-20 ">프로그램 회차 정보</h5>          

					                <div class="row">
					                    <div class="col-sm-12">
					                        <div class="card card-border">
					                            <div class="card-body">

					                                <div class="row">
					                                    <div class="col-lg-12">
															<div class="form-group row">
																<label class="col-sm-2 control-label">관리회차</label>
																<div class="col-sm-10">
																	<span id="cycle">1회</span>
																</div>
															</div>
					                                    </div>
													</div>
													<div class="row">
					                                    <div class="col-lg-12">
															<div class="form-group row">
																<label class="col-sm-2 control-label">관리일</label>
																<div class="col-sm-10">
																	<input type="text" class="form-control" id="manageDate" name="manageDate" value="" />
																</div>
															</div>
					                                    </div>
													</div>
													<div class="row">
					                                    <div class="col-lg-12">
															<div class="form-group row">
																<label class="col-md-2 control-label">추가 프로그램</label>
																<div class="col-md-10 checkbox checkbox-warning input-group">
																	<c:forEach var="item" items="${programOptionList}">
																		<div style="width:450px">
										                                    <label class="m-r-10 w-xxxxlg">
										                                        <input type="checkbox" name="programChkOptId" value="<c:out value='${item.programOptionId}'/>" >
										                                        <span class="cr"><i class="cr-icon fa fa-check"></i></span>
																				<c:out value='${item.programOptionName}'/>
										                                    </label>
										                                    <input type="hidden" id="programOptionId_<c:out value='${item.programOptionId}'/>" name="programOptionId" value="<c:out value='${item.programOptionId}'/>" />
										                                    <input type="text" id="programOptionPrice_<c:out value='${item.programOptionId}'/>" name="programOptionPrice" class="form-custom" style="width:80px;" value="${item.price}"/>
																			<span class="m-r-10">원</span>
																			<input type="text" id="programOptionCycle_<c:out value='${item.programOptionId}'/>" name="programOptionCycle" class="form-custom" style="width:30px;" value=""/>
																			<span class="m-r-15">회</span>
																		</div>
								                                    </c:forEach>
																</div>
															</div>
					                                    </div>
													</div>
													<div class="row">
					                                    <div class="col-lg-12">
															<div class="form-group row">
																<label class="col-md-2 control-label">회차 금액</label>
																<div class="col-md-10">
																	<div class="col-md-12 input-group" style="padding:0px">
																		<div class="col-md-2" style="padding-left:0px">
																			<label class="control-label">프로그램 금액</label>
																			<div class="m-b-10">
																				<input type="number" class="form-control" id="cycleProgramPrice" name="cycleProgramPrice" value="0" readonly />
																			</div>
																		</div>
																		<div class="col-md-2" style="padding-left:0px">
																			<label class="control-label">프로그램 옵션 금액</label>
																			<div class="m-b-10">
																				<input type="number" class="form-control" id="cycleOptionPrice" name="cycleOptionPrice" value="0" readonly />
																			</div>
																		</div>
																		<div class="col-md-2" style="padding-left:0px">
																			<label class="control-label">할인 금액</label>	
																			<div class="m-b-10">
																				<input type="number" class="form-control" id="cycleDiscountPrice" name="cycleDiscountPrice" value="0" readonly />
																			</div>
																		</div>
																		<div class="col-md-2" style="padding-left:0px">
																			<label class="control-label">전체 금액</label>
																			<div class="m-b-10">
																				<input type="number" class="form-control" id="cycleTotalPrice" name="cycleTotalPrice" value="0" readonly />
																			</div>
																		</div>
																		<div class="col-md-2" style="padding-left:0px">
																			<label class="control-label">지불 금액</label>
																			<div class="m-b-10">
																				<input type="number" class="form-control" id="cyclePayment" name="cyclePayment" value="0" readonly />
																			</div>
																		</div>
																		<div class="col-md-2" style="padding-left:0px;padding-right:0px">
																			<label class="control-label">미수 금액</label>
																			<div class="m-b-10">
																				<input type="number" class="form-control" id="cycleReceivables" name="cycleReceivables" value="0" readonly />
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
					                                    <div class="col-lg-12">
															<div class="form-group row">
																<label class="col-md-2 control-label">할인내역</label>					                                    
																<div class="col-md-10">
																	<div class="col-md-12 input-group" style="padding:0px">
																		<div class="col-md-6" style="padding-left:0px;">
																			<label class="control-label">적립포인트</label> <span class="text-danger">(사용가능한 포인트 : </span><span id="customerPoint"><c:out value="${customer.pointAmount}"/></span><span class="text-danger">)</span>
																			<div class="m-b-10">
																				<input type="number" class="form-control" id="point" name="point" value="" <c:if test="${customer.pointAmount eq 0}">disabled</c:if> />
																			</div>
																		</div>
																		<div class="col-md-6" style="padding-left:0px;padding-right:0px">
																			<label class="control-label">기프트카드</label> <span class="text-danger">(사용가능한 포인트 : </span><span id="customerGiftcard"><c:out value="${customer.giftcardAmount}"/></span><span class="text-danger">)</span>
																			<div class="m-b-10">
																				<input type="number" class="form-control" id="giftcard" name="giftcard" value="" <c:if test="${customer.giftcardAmount eq 0}">disabled</c:if> />
																			</div>
																		</div>
																	</div>
																</div>
	                                    					</div>
                                						</div>
													</div>
													<div class="row">
					                                    <div class="col-lg-12">
															<div class="form-group row">
																<label class="col-md-2 control-label">결제방법</label>
																<div class="col-md-10">
																	<div class="col-md-12 input-group" style="padding:0px">
																		<div class="col-md-4" style="padding-left:0px">
																			<label class="control-label">카드</label>	
																			<div class="m-b-10">
																				<input type="number" class="form-control" id="card" name="card" value="" />
																			</div>
																		</div>
																		<div class="col-md-4" style="padding-left:0px">
																			<label class="control-label">현금</label>
																			<div class="m-b-10">
																				<input type="number" class="form-control" id="cash" name="cash" value="" />
																			</div>
																		</div>
																		<div class="col-md-4" style="padding-left:0px;padding-right:0px">
																			<label class="control-label">계좌이체</label>
																			<div class="m-b-10">
																				<input type="number" class="form-control" id="transfer" name="transfer" value="" />
																			</div>
																		</div>
																	</div>
																</div>
	                                    					</div>
                                						</div>
													</div>
													<div class="row">
					                                    <div class="col-lg-12">
															<div class="form-group row">
																<label class="col-sm-2 control-label">결제일</label>
																<div class="col-sm-10">
																	<input type="text" class="form-control" id="paymentDate" name="paymentDate" value="" />
																</div>
															</div>
					                                    </div>
													</div>
					                                <div class="row">
					                                    <div class="col-lg-12">
															<div class="form-group row">
																<label class="col-md-2 control-label">메모</label>
																<div class="col-md-10">
																	<textarea class="form-control" id="memo" name="memo" rows="3"></textarea>
																</div>
															</div>
					                                    </div>
													</div>
					                                <div class="row">
					                                    <div class="col-lg-12">
															<div class="form-group row">
																<label class="col-md-2 control-label">담당자<span class="text-danger">*</span></label>
																<div class="col-md-10">
																	<select class="form-control" id="employeeId" name="employeeId">
																	<option value=""><spring:message code="common.select"/></option>
						                                            <c:forEach var="item" items="${employeeList}">
					                                                    <option value="<c:out value='${item.employeeId}'/>" ><c:out value='${item.employeeName}'/></option>
																	</c:forEach>
																	</select>
																</div>
															</div>
					                                    </div>
													</div>
					                            
					                            </div>
`											</div>
										</div>
									</div>
									</form>

									<div class="row">
										<div class="col-sm-12">
											<button type="button" id="listBtn" class="btn btn-warning waves-effect waves-light m-r-10 float-right"><spring:message code="button.list"/></button>
											<button type="button" id="saveBtn" class="btn btn-danger waves-effect waves-light m-r-10 float-right"><spring:message code="button.save"/></button>
										</div>
									</div>
								</div>
								
                            </div>
                            
                        </div>
                    </div>
                </div>
                <!-- end row -->
                
                <form id="listForm" name="listForm" method="post" action="">
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                	<input type="hidden" id="customerId" name="customerId" value="<c:out value="${customer.customerId}"/>"/>
                	<input type="hidden" id="customerName" name="customerName" value="<c:out value="${customer.customerName}"/>"/>
                	<input type="hidden" id="pageType" name="pageType" value="skincare"/> 
                </form>
                
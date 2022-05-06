<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

	var customerId = "<c:out value='${customerId}'/>";
	var customerName = "<c:out value='${customerName}'/>";
	
	var skinTable;
	var initSkinTable = false;
	
	var pointTable;
	var initPointTable = false;
	
	var giftTable;
	var initGiftTable = false;
	
	var pageType = "<c:out value='${pageType}'/>";

    $(document).ready(function () {
    	
    	$('#dateOfBirth').datepicker({
    		format: "yyyy-mm-dd",
    		language: "ko",
    		orientation: "bottom auto",
    		autoclose: true
		});
    	
    	$('#joinDate').datepicker({
    		format: "yyyy-mm-dd",
    		language: "ko",
    		orientation: "bottom auto",
    		autoclose: true
		});
    	
    	$('#postalCode, #postalIcon').click( function() {
    	    new daum.Postcode({
    	        oncomplete: function(data) {
    	        	$('#postalCode').val(data.zonecode);
					$('#address').val(data.address);
    	        }
    	    }).open();
		});
    	
		$("input[name=manageExperience]").change(function() {
			var manageExperience = $(this).val();
			if(manageExperience == "Y"){
				$("#otherStoreName").prop("readonly", false);
				$("#otherStoreProgram").prop("readonly", false);
			}else{
				$("#otherStoreName").prop("readonly", true);
				$("#otherStoreProgram").prop("readonly", true);
			}
		});
		
		$("input[name=allergy]").change(function() {
			if($("input[name=allergy][value=ALG0099]").is(":checked")){
				$("#allergyName").prop("readonly", false);
			}else{
				$("#allergyName").prop("readonly", true);
			}
		});
    	
    	$('#modifyCustomerBtn').click( function() {
    		fn_updateCustomerInformation();
    	});
    	
    	$('.listBtn').click( function() {
    		location.href = '<c:url value="/customer/customerList"/>';
    	});
    	    	
    	$('#information-tab').click( function() {
    		fn_selectCustomerInformation();
    	});
    	
    	$('#skincare-tab').click( function() {
    		fn_customerCareList();    		
    	});
    	
    	$('#point-tab').click( function() {
    		if(!initPointTable){
    			fn_pointHistoryList();
    		}else{
    			pointTable.draw();
    		}
    	});
    	
    	$('#giftcard-tab').click( function() {
    		if(!initGiftTable){
    			fn_giftcardHistoryList();
    		}else{
    			giftTable.draw();
    		}
    	});
    	
    	$('#regSkincareBtn').click( function() {
    		$('#listForm').prop("action", "<c:url value='/skincare/skincareRegistration'/>");
    		$('#customerId').val(customerId);
    		$('#customerName').val(customerName);
    		$('#listForm').submit();
    	});
    	
    	$('#savePointBtn').click( function() {
    		fn_savePointInformation();
    	});
    	
    	$('#saveGiftBtn').click( function() {
    		fn_saveGiftInformation();
    	});
    	
       	fn_setPage(pageType);
    	
    });
    
	function fn_setPage(pageType){		
		$(".nav-link").removeClass("active");
		$(".tab-pane").removeClass("show");
		$(".tab-pane").removeClass("active");
		
		$("#" + pageType + "-tab").addClass("active");
		$("#" + pageType + "-content").addClass("show");
		$("#" + pageType + "-content").addClass("active");
		
		switch(pageType){
			case "information":
				fn_customerCareList();
				break;
			case "skincare":
				fn_customerCareList();
				break;
			case "point":
	    		if(!initPointTable){
	    			fn_pointHistoryList();
	    		}else{
	    			pointTable.draw();
	    		}
				break;
			case "giftcard":
	    		if(!initGiftTable){
	    			fn_giftcardHistoryList();
	    		}else{
	    			giftTable.draw();
	    		}
				break;
			default:
				break;
		}
	}
    
    function fn_updateCustomerInformation(){
		var comma 				= '';
		var customerName		= $('#customerName').val();
		var gender 				= $('#gender').val();
		var dateOfBirth 		= $('#dateOfBirth').val();
		var cellphoneNumber 	= $('#cellphoneNumber').val();
		var postalCode 			= $('#postalCode').val();
		var address 			= $('#address').val();
		var joinDate 			= $('#joinDate').val();
		var membershipLevel 	= $('#membershipLevel').val();
		var visitPath 			= $('input[name=visitPath]').val();
		var interests			= '';
		
		var skinType			= $('input[name=skinType]:checked').val();
		var pregnant			= $('input[name=pregnant]:checked').val();
		var manageExperience	= $('input[name=manageExperience]:checked').val();
		var otherStoreName		= $('#otherStoreName').val();
		var otherStoreProgram 	= $('#otherStoreProgram').val();
		var skinProblems		= '';
		var problemOccurTime	= '';
		var pimpleOccurPoint	= '';
		var troubleOccurTime	= '';
		var allergy				= '';
		var allergyName			= $('#allergyName').val();
		var intensity			= $('input[name=intensity]:checked').val();
		var etc					= $('#etc').val();
		
		$("input[name=interests]:checked").each(function() {
			interests = interests + comma + $(this).val();
			comma = ',';
		});
		
		comma = '';
		$("input[name=skinProblems]:checked").each(function() {
			skinProblems = skinProblems + comma + $(this).val();
			comma = ',';
		});
		
		comma = '';
		$("input[name=problemOccurTime]:checked").each(function() {
			problemOccurTime = problemOccurTime + comma + $(this).val();
			comma = ',';
		});
		
		comma = '';			
		$("input[name=pimpleOccurPoint]:checked").each(function() {
			pimpleOccurPoint = pimpleOccurPoint + comma + $(this).val();
			comma = ',';
		});
		
		comma = '';			
		$("input[name=troubleOccurTime]:checked").each(function() {
			troubleOccurTime = troubleOccurTime + comma + $(this).val();
			comma = ',';
		});			
		
		comma = '';			
		$("input[name=allergy]:checked").each(function() {
			allergy = allergy + comma + $(this).val();
			comma = ',';
		});

		$.ajax({
		    url: '<c:url value="/customer/updateCustomerInformation"/>',
		    type: 'POST',
			dataType: 'json',
		    data: {
		    	customerId : customerId,
		    	customerName : customerName,
		    	gender : gender,
		    	dateOfBirth : dateOfBirth,
		    	cellphoneNumber : cellphoneNumber,
		    	postalCode : postalCode,
		    	address : address,
		    	joinDate : joinDate,
		    	membershipLevel : membershipLevel,
		    	visitPath : visitPath,
		    	interests : interests,
		    	skinType : skinType,
		    	pregnant : pregnant,
		    	manageExperience : manageExperience,
		    	otherStoreName : otherStoreName,
		    	otherStoreProgram : otherStoreProgram,
		    	skinProblems : skinProblems,
		    	problemOccurTime : problemOccurTime,
		    	pimpleOccurPoint : pimpleOccurPoint,
		    	troubleOccurTime : troubleOccurTime,
		    	allergy : allergy,
		    	allergyName : allergyName,
		    	intensity : intensity,
		    	etc : etc
		    },
		    success: function(data) {
				if(data.result == 'success'){
    	            Swal.fire({
    	            	title : '<spring:message code="success.changed"/>',
						type: 'success',
						confirmButtonColor: '#ff9800'
					})
				}
		    }
		});    	
    }
    
    function fn_selectCustomerInformation(){
		$.ajax({
		    url: '<c:url value="/customer/selectCustomerInformation"/>',
		    type: 'POST',
			dataType: 'json',
		    data: {
		    	customerId : customerId
		    },
		    success: function(data) {
				$("#customerName").val(data.customerName);
				$("#gender").val(data.gender);

				$('#dateOfBirth').val(data.dateOfBirth);
				$('#cellphoneNumber').val(data.cellphoneNumber);
				$('#postalCode').val(data.postalCode);
				$('#address').val(data.address);
				$('#joinDate').val(data.joinDate);
				$('#membershipLevel').val(data.membershipLevel);
				$('input[name=visitPath][value="' + data.visitPath + '"]').prop("checked",true);
				var interests = data.interests;
				var interestsSplit = interests.split(',');
				for(var i=0; i<interestsSplit.length; i++){
					$('input[name=interests][value="' + interestsSplit[i] + '"]').prop("checked",true);
				}

				$('input[name=skinType][value="' + data.skinType + '"]').prop("checked",true);
				$('input[name=pregnant][value="' + data.pregnant + '"]').prop("checked",true);
				$('input[name=manageExperience][value="' + data.manageExperience + '"]').prop("checked",true);
				$('#otherStoreName').val(data.otherStoreName);
				$('#otherStoreProgram').val(data.otherStoreProgram);
				
				if(data.manageExperience == "Y"){
					$('#otherStoreName').prop("readonly", false);
					$('#otherStoreProgram').prop("readonly", false);					
				}
				
				var skinProblems = data.skinProblems;
				var skinProblemsSplit = skinProblems.split(',');
				for(var j=0; j<skinProblemsSplit.length; j++){
					$('input[name=skinProblems][value="' + skinProblemsSplit[j] + '"]').prop("checked",true);
				}
				
				var problemOccurTime = data.problemOccurTime;
				var problemOccurTimeSplit = problemOccurTime.split(',');
				for(var k=0; k<problemOccurTimeSplit.length; k++){
					$('input[name=problemOccurTime][value="' + problemOccurTimeSplit[k] + '"]').prop("checked",true);
				}
				
				var pimpleOccurPoint = data.pimpleOccurPoint;
				var pimpleOccurPointSplit = pimpleOccurPoint.split(',');
				for(var l=0; l<pimpleOccurPointSplit.length; l++){
					$('input[name=pimpleOccurPoint][value="' + pimpleOccurPointSplit[l] + '"]').prop("checked",true);
				}
				
				var troubleOccurTime = data.troubleOccurTime;
				var troubleOccurTimeSplit = troubleOccurTime.split(',');
				for(var m=0; m<troubleOccurTimeSplit.length; m++){
					$('input[name=troubleOccurTime][value="' + troubleOccurTimeSplit[m] + '"]').prop("checked",true);
				}
				
				var allergy = data.allergy;
				var allergySplit = allergy.split(',');
				for(var n=0; n<allergySplit.length; n++){
					$('input[name=allergy][value="' + allergySplit[n] + '"]').prop("checked",true);
					if(allergySplit[n] == "ALG0099"){
						$('#allergyName').prop("readonly", false);
					}
				}
				$('#allergyName').val(data.allergyName);
				$('input[name=intensity][value="' + data.intensity + '"]').prop("checked",true);
				$('#etc').val(data.etc);
				
				$('#pointId').val(data.pointId);
				$('#giftcardId').val(data.giftcardId);
		    }
		});
    }
    
    function fn_customerCareList(){
       	initSkinTable = true;
   	    skinTable = $("#skincareTable").DataTable({
   			"serverSide": true,
   			"processing": true,
   			"searching": false,
   			"destroy": true,
   	        "language" : {
   	            "url" : "<c:url value='/resources/js/Korean.json'/>"
   	        },
   			"order" : [[ 4, "desc" ]],
   	        ajax: {
   				"type" : "POST",
   				"url" : "<c:url value='/skincare/selectCustomerCareList'/>",
   			    "data" : function (data) {
   			    	data.customerId = customerId;
   					return JSON.stringify(data);
   				},
   				"dataType": "json",
   				"contentType": "application/json; charset=utf-8",
   				"dataSrc": "data"
   	        },
   	        columns: [
   	        	{ data: "skincareId", visible:false },
   	        	{ data: "rnum" },
   	        	{ data: "programGroupName" },
   	        	{ data: "totalCycle" },
   	        	{ data: "createDate" },
   	        	{ data: "skincareStatusName"},
   	        ]
   	    });
    }
    
    function fn_pointHistoryList(){
    	initPointTable = true;
	    pointTable = $("#pointHistoryTable").DataTable({
			"serverSide": true,
			"processing": true,
			"searching": false,
			"destroy": true,
	        "language" : {
	            "url" : "<c:url value='/resources/js/Korean.json'/>"
	        },
			"order" : [[ 4, "desc" ]],
	        ajax: {
				"type" : "POST",
				"url" : "<c:url value='/point/selectPointHistoryList'/>",
			    "data" : function (data) {
			    	data.customerId = customerId;
					return JSON.stringify(data);
				},
				"dataType": "json",
				"contentType": "application/json; charset=utf-8",
				"dataSrc": "data"
	        },
	        columns: [
	        	{ data: "pointId", visible:false },
	        	{ data: "rnum" },
	        	{ data: "earnPoint" },
	        	{ data: "usePoint" },
	        	{ data: "totalPoint" },
	        	{ data: "memo"},
	        	{ data: "useDate" },
	        ]
	    });
    }
    
    function fn_savePointInformation(){
		var pointId = $("#pointId").val();    		
		var earnPoint = $("#earnPoint").val();
		var memo = $("#memo").val();
		var useDate = $("#useDate").val();
		
		$.ajax({
		    url: '<c:url value="/point/insertPointInformation"/>',
		    type: 'POST',
			dataType: 'json',
		    data: {
		    	pointId : pointId,
		    	customerId : customerId,
		    	earnPoint : earnPoint,
		    	memo : memo,
		    	useDate : useDate
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
    }
    
    function fn_giftcardHistoryList(){
    	initGiftTable = true;
	    giftTable = $("#giftcardHistoryTable").DataTable({
			"serverSide": true,
			"processing": true,
			"searching": false,
			"destroy": true,
	        "language" : {
	            "url" : "<c:url value='/resources/js/Korean.json'/>"
	        },
			"order" : [[ 4, "desc" ]],
	        ajax: {
				"type" : "POST",
				"url" : "<c:url value='/giftcard/selectGiftcardHistoryList'/>",
			    "data" : function (data) {
			    	data.customerId = customerId;
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
	        ]
	    });
    }
    
    function fn_savePointInformation(){
		var pointId= $("#pointId").val();
		var customerId = $("#customerId").val();    		
		var earnPoint = $("#earnPoint").val();
		var memo = $("#memo").val();
		var useDate = $("#useDate").val();
		
		$.ajax({
		    url: '<c:url value="/point/insertPointInformation"/>',
		    type: 'POST',
			dataType: 'json',
		    data: {
		    	pointId : pointId,
		    	customerId : customerId,
		    	earnPoint : earnPoint,
		    	memo : memo,
		    	useDate : useDate
		    },
		    success: function(data) {
		    	
		    	var title = '<spring:message code="success.saved"/>';
		    	var text = '';
		    	var type = 'success';
		    	
				if(data.result == 'success'){
		            Swal.fire({
		            	title : '<spring:message code="success.saved"/>',
						type: 'success',
						confirmButtonColor: '#ff9800'
					}).then(function(){				
						fn_pointClear();
						giftTable.draw();
					});
				}
				
		    }
		});
    }
    
    function fn_pointClear(){
    	$("#earnPoint").val("");
    	$("#memo").val("");
    	$('#useDate').val(getToday());
    }
    
    function fn_saveGiftInformation(){
		var giftcardId = $("#giftcardId").val();
		var memo = $("#memo").val();
		var useDate = $("#giftUseDate").val();
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
						fn_giftClear();
						giftTable.draw();
					});
				}
		    }
		});
    }
    
    function fn_giftClear(){
    	$("#paymentType").val("");
    	$("#card").val("");
    	$("#cash").val("");
    	$("#transfer").val("");
    	$("#giftMemo").val("");    	
    	$('#giftUseDate').val(getToday());
    }
    
</script>

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="page-title-box">
                            
                            <ol class="breadcrumb float-right p-0 m-0">
                                <li><a href="#"><spring:message code="customer.manageCustomer"/></a></li>
                                <li class="active">고객 조회</li>
                            </ol>
                            <h4 class="page-title m-0">고객 조회</h4>
                        
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card card-border card-warning">
                            <div class="card-heading">
                            </div>                        
                        
                            <div class="card-body">
                            
								<ul class="nav nav-tabs" role="tablist">
									<li class="nav-item">
										<a class="nav-link" id="information-tab" data-toggle="tab" href="#information-content" role="tab" aria-controls="information" aria-selected="true">
											<span class="d-block d-sm-none"><i class="fa fa-user"></i></span>
											<span class="d-none d-sm-block">고객 정보</span>
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link active" id="skincare-tab" data-toggle="tab" href="#skincare-content" role="tab" aria-controls="skincare" aria-selected="false">        
											<span class="d-block d-sm-none"><i class="fa fa-user"></i></span>
											<span class="d-none d-sm-block">관리 프로그램</span>
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="point-tab" data-toggle="tab" href="#point-content" role="tab" aria-controls="point" aria-selected="false">
											<span class="d-block d-sm-none"><i class="fa fa-envelope-o"></i></span>
											<span class="d-none d-sm-block">포인트</span>
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="giftcard-tab" data-toggle="tab" href="#giftcard-content" role="tab" aria-controls="giftcard" aria-selected="false">
											<span class="d-block d-sm-none"><i class="fa fa-credit-card"></i></span>
											<span class="d-none d-sm-block">기프트카드</span>
										</a>
									</li>
								</ul>
                
								<div class="tab-content">
									
									<!-- 고객정보 탭 시작 -->
									<div class="tab-pane" id="information-content" role="tabpanel" aria-labelledby="information-tab">
										
										<!-- 고객 정보 기초 -->
										<h5 class="header-title m-t-0 m-b-20 font-600"><spring:message code="customer.basicInformation"/></h5>
										
						                <div class="row">
						                    <div class="col-sm-12">
						                        <div class="card card-border">
						                            <div class="card-body">
				                    					<div class="row">
						                                    <div class="col-lg-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="customer.customerName"/><span class="text-danger">*</span></label>
																	<div class="col-md-10 input-group">
																		<div class="input-group-prepend">
																			<span class="input-group-text bg-custom text-white b-0"><i class="fa fa-user"></i></span>
																		</div>
																		<input type="text" class="form-control" id="customerName" name="customerName" value="" required="" />
																	</div>
																</div>
															</div>
														</div>
				                    					<div class="row">
						                                    <div class="col-lg-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="customer.sex"/></label>
																	<div class="col-md-10">
							                                            <select class="form-control" id="gender" name="gender">
							                                            <c:forEach var="item" items="${genderList}">
						                                                    <option value="<c:out value='${item.codeId}'/>" ><c:out value='${item.codeName}'/></option>
																		</c:forEach>
							                                            </select>
																	</div>
																</div>
															</div>
														</div>
				                    					<div class="row">
						                                    <div class="col-lg-12">												
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="customer.dateOfBirth"/></label>
																	<div class="col-md-10 input-group">
																		<input type="text" class="form-control" id="dateOfBirth" name="dateOfBirth" value="">
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
																	<label class="col-md-2 control-label"><spring:message code="customer.cellphoneNumber"/><span class="text-danger">*</span></label>
																	<div class="col-md-10">
																		<input type="text" class="form-control" id="cellphoneNumber" name="cellphoneNumber" value="" required="">
																	</div>
																</div>
						                                    </div>
														</div>										
				                    					<div class="row">
						                                    <div class="col-lg-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="customer.postalCode"/></label>
																	<div class="col-md-10 input-group">
																		<input type="text" class="form-control" id="postalCode" name="postalCode" value="" maxlength="5">
																		<div class="input-group-append">
																			<span class="input-group-text bg-custom text-white b-0"><i class="fa fa-envelope-o" id="postalIcon"></i></span>
																		</div>
																	</div>
																</div>
															</div>
														</div>
				                    					<div class="row">
						                                    <div class="col-lg-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="customer.address"/></label>
																	<div class="col-md-10">
																		<input type="text" class="form-control" id="address" name="address" value="">
																	</div>
																</div>
															</div>
														</div>
				                    					<div class="row">
						                                    <div class="col-lg-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="customer.joinDate"/><span class="text-danger">*</span></label>
																	<div class="col-md-10 input-group">
																		<input type="text" class="form-control" id="joinDate" name="joinDate" value="">
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
																	<label class="col-md-2 control-label"><spring:message code="customer.membershipLevel"/></label>
																	<div class="col-md-10">
							                                            <select class="form-control" id="membershipLevel" name="membershipLevel">
							                                            <c:forEach var="item" items="${membershipLvList}">
						                                                    <option value="<c:out value='${item.codeId }'/>" ><c:out value='${item.codeName}'/></option>
																		</c:forEach>
							                                            </select>
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">									
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="customer.visitPath"/></label>
																	<div class="col-md-10 radio radio-warning m-t-0">
																		<c:forEach var="item" items="${visitPathList}">
									                                    <label class="m-r-10 w-xlg">
						            			                            <input type="radio" name="visitPath" value="<c:out value='${item.codeId}'/>" >
						                        			                <span class="cr"><i class="cr-icon mdi mdi-checkbox-blank-circle"></i></span>
						                                        			<c:out value='${item.codeName}'/>
																		</label>
																		</c:forEach>
																	</div>
																</div>
															</div>
														</div>
				                    					<div class="row">
						                                    <div class="col-lg-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="customer.interests"/></label>
																	<div class="col-md-10 checkbox checkbox-warning m-t-0">
																		<c:forEach var="item" items="${interestsList}">
									                                    <label class="m-r-10 w-xlg">
									                                        <input type="checkbox" name="interests" value="<c:out value='${item.codeId}'/>" >
									                                        <span class="cr"><i class="cr-icon fa fa-check"></i></span>
																			<c:out value='${item.codeName}'/>
									                                    </label>
									                                    </c:forEach>
																	</div>
																</div>
						                                    </div>
						                                </div>
													</div>
												</div>
											</div>
										</div>
		                                
										<!-- 고객 정보 상세 -->
										<h5 class="header-title m-t-20 m-b-20 font-600"><spring:message code="customer.detailInformation"/></h5>
			                            
						                <div class="row">
						                    <div class="col-sm-12">
						                        <div class="card card-border">
						                            <div class="card-body">
			                            
						                                <div class="row">
						                                    <div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="customer.skinType"/></label>
																	<div class="col-md-10 radio radio-warning m-t-0">
																		<c:forEach var="item" items="${skinTypeList}">
									                                    <label class="m-r-10 w-xlg">
						            			                            <input type="radio" name="skinType" value="<c:out value='${item.codeId}'/>">
						                        			                <span class="cr"><i class="cr-icon mdi mdi-checkbox-blank-circle"></i></span>
						                                        			<c:out value='${item.codeName}'/>
																		</label>
																		</c:forEach>
																	</div>
																</div>
															</div>
														</div>												
						                                <div class="row">
						                                    <div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="customer.pregnant"/></label>
																	<div class="col-md-10 radio radio-warning m-t-0">
									                                    <label class="m-r-10 w-xlg">
									                                        <input type="radio" name="pregnant" value="N">
									                                        <span class="cr"><i class="cr-icon mdi mdi-checkbox-blank-circle"></i></span>
																			<spring:message code="customer.none"/>
									                                    </label>
									                                    <label class="m-r-10 w-xlg">
									                                        <input type="radio" name="pregnant" value="Y">
									                                        <span class="cr"><i class="cr-icon mdi mdi-checkbox-blank-circle"></i></span>
																			<spring:message code="customer.exist"/>
									                                    </label>
																	</div>
																</div>
															</div>
														</div>												
						                                <div class="row">
						                                	<div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="customer.manageExperience"/></label>
																	<div class="col-md-10 radio radio-warning m-t-0">
									                                    <label class="m-r-10 w-xlg">
									                                        <input type="radio" name="manageExperience" value="N">
									                                        <span class="cr"><i class="cr-icon mdi mdi-checkbox-blank-circle"></i></span>
																			<spring:message code="customer.none"/>
									                                    </label>
									                                    <label class="m-r-10 w-xlg">
									                                        <input type="radio" name="manageExperience" value="Y">
									                                        <span class="cr"><i class="cr-icon mdi mdi-checkbox-blank-circle"></i></span>
																			<spring:message code="customer.exist"/>
									                                    </label>			                                    
																	</div>
																</div>
															</div>
														</div>												
						                                <div class="row">
						                                	<div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label">매장</label>
																	<div class="col-md-10">
																		<input type="text" class="form-control" id="otherStoreName" name="otherStoreName" value="" readonly>
																	</div>
																</div>
															</div>
														</div>												
						                                <div class="row">
						                                	<div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label">프로그램</label>
																	<div class="col-md-10">
																		<input type="text" class="form-control" id="otherStoreProgram" name="otherStoreProgram" value="" readonly>
																	</div>
																</div>
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="customer.skinProblem"/></label>
																	<div class="col-md-10 checkbox checkbox-warning m-t-0">
																		<c:forEach var="item" items="${skinProblemList}">
									                                    <label class="m-r-10 w-xlg">
									                                        <input type="checkbox" name="skinProblems" value="<c:out value='${item.codeId}'/>">
									                                        <span class="cr"><i class="cr-icon fa fa-check"></i></span>
									                                        <c:out value="${item.codeName}"/>
									                                    </label>
									                                    </c:forEach>
																	</div>
																</div>
															</div>
														</div>												
						                                <div class="row">
															<div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="customer.problemOccurTime"/></label>
																	<div class="col-md-10 checkbox checkbox-warning m-t-0">
																		<c:forEach var="item" items="${skinOcrTimeList}">
									                                    <label class="m-r-10 w-xlg">
									                                        <input type="checkbox" name="problemOccurTime" value="<c:out value='${item.codeId}'/>">
									                                        <span class="cr"><i class="cr-icon fa fa-check"></i></span>
																			<c:out value="${item.codeName}"/>
									                                    </label>
									                                    </c:forEach>
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="customer.pimpleOccurPoint"/></label>
																	<div class="col-md-10 checkbox checkbox-warning m-t-0">
																		<c:forEach var="item" items="${pimpleList}">
									                                    <label class="m-r-10 w-xlg">
									                                        <input type="checkbox" name="pimpleOccurPoint" value="<c:out value='${item.codeId}'/>">
									                                        <span class="cr"><i class="cr-icon fa fa-check"></i></span>
																			<c:out value="${item.codeName}"/>
									                                    </label>
									                                    </c:forEach>
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="customer.troubleOccurTime"/></label>
																	<div class="col-md-10 checkbox checkbox-warning m-t-0">
																		<c:forEach var="item" items="${tbOcrTimeList}">
									                                    <label class="m-r-10 w-xlg">
									                                        <input type="checkbox" name="troubleOccurTime" value="<c:out value='${item.codeId}'/>">
									                                        <span class="cr"><i class="cr-icon fa fa-check"></i></span>
																			<c:out value="${item.codeName}"/>
									                                    </label>
									                                    </c:forEach>
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="customer.allergy"/></label>
																	<div class="col-md-10 checkbox checkbox-warning m-t-0">
																		<c:forEach var="item" items="${allergyList}">
									                                    <label class="m-r-10 w-xlg">
									                                        <input type="checkbox" name="allergy" value="<c:out value='${item.codeId}'/>">
									                                        <span class="cr"><i class="cr-icon fa fa-check"></i></span>
																			<c:out value="${item.codeName}"/>
									                                    </label>
									                                    </c:forEach>
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label">알레르기 명</label>
																	<div class="col-md-10">
																		<input type="text" class="form-control" id="allergyName" name="allergyName" value="" readonly>
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="customer.intensity"/></label>
																	<div class="col-md-10 radio radio-warning m-t-0">
																		<c:forEach var="item" items="${intensityList}">
									                                    <label class="m-r-10 w-xlg">
						            			                            <input type="radio" name="intensity" value="<c:out value='${item.codeId}'/>">
						                        			                <span class="cr"><i class="cr-icon mdi mdi-checkbox-blank-circle"></i></span>
						                                        			<c:out value='${item.codeName}'/>
																		</label>
																		</c:forEach>
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="customer.etc"/></label>
																	<div class="col-md-10">
																		<textarea class="form-control" id="etc" name="etc" rows="5"></textarea>
																	</div>
																</div>
						                                    </div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
		                                		<button type="button" id="listCustomerBtn" class="listBtn btn btn-warning waves-effect waves-light m-r-10 float-right"><spring:message code="button.list"/></button>
	       		                        		<button type="button" id="modifyCustomerBtn" class="btn btn-danger waves-effect waves-light m-r-10 float-right"><spring:message code="button.modify"/></button>
	       		                        	</div>
										</div>
										
									</div>
									<!-- 고객정보 탭 끝 -->

									<!-- 피부관리 탭 시작 -->
                                    <div class="tab-pane" id="skincare-content" role="tabpanel" aria-labelledby="skincare-tab">
										
										<h5 class="header-title m-t-0 m-b-20 font-600"><spring:message code="skincare.skincareHistory" arguments="${customerName}" /></h5>										
										
						                <div class="row">
						                    <div class="col-md-12">
					                            <div class="table-responsive">
					                                <table id="skincareTable"
					                                        class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
					                                    <thead>
					                                    <tr>
					                                    	<th>피부관리 아이디</th>
					                                    	<th>번호</th>
					                                    	<th>프로그램</th>
					                                    	<th>회차</th>
					                                    	<th>등록일</th>					                                    	
					                                    	<th>상태</th>
					                                    </tr>
					                                    </thead>
					                                </table>
					                            </div>
											</div>
						                </div>
										<div class="row">
											<div class="col-md-12">
		                                		<button type="button" id="listCustomerBtn" class="listBtn btn btn-warning waves-effect waves-light m-t-20 m-r-10 float-right"><spring:message code="button.list"/></button>
	       		                        		<button type="button" id="regSkincareBtn" class="btn btn-danger waves-effect waves-light m-t-20 m-r-10 float-right"><spring:message code="button.reg"/></button>
	       		                        	</div>
										</div>						                
										
                                    </div>
                                    <!-- 피부관리 탭 끝 -->
                                    
                                    <!-- 포인트 관리 탭 -->
                                    <div class="tab-pane" id="point-content" role="tabpanel" aria-labelledby="point-tab">

										<input type="hidden" id="pointId" name="pointId" value="0"/> 

										<h5 class="header-title m-t-0 m-b-20 font-600"><spring:message code="point.customerPointHistory" arguments="${customerName}" /></h5>

						                <div class="row">
						                    <div class="col-md-12">
					                            <div class="table-responsive">
					                                <table id="pointHistoryTable"
					                                        class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
					                                    <thead>
					                                    <tr>
					                                    	<th><spring:message code="point.pointId"/></th>
					                                    	<th><spring:message code="point.rowNumber"/></th>
					                                    	<th><spring:message code="point.earnPoint"/></th>
					                                    	<th><spring:message code="point.usePoint"/></th>
					                                        <th><spring:message code="point.point"/></th>
					                                        <th><spring:message code="point.memo"/></th>
					                                        <th><spring:message code="point.regDate"/></th>
					                                    </tr>
					                                    </thead>
					                                </table>
					                            </div>
											</div>
						                </div>

										<h5 class="header-title m-t-30 m-b-20 font-600"><spring:message code="point.regPoint"/></h5>						
						                
						                <div class="row">
						                    <div class="col-sm-12">
						                        <div class="card card-border">
						                            <div class="card-body">
														<div class="row">
															<div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="point.point"/><span class="text-danger">*</span></label>
																	<div class="col-md-10">
																		<input type="text" id="earnPoint" name="earnPoint" class="form-control" value=""/>
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label"><spring:message code="point.memo"/></label>
																	<div class="col-md-10">
																		<textarea id="memo" name="memo" class="form-control" row="5"></textarea>
																	</div>
																</div>
										                	</div>
										                </div>
										                <div class="row">
										                	<div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label">적립일</label>
																	<div class="col-md-10">
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
						                	<div class="col-md-12">
												<button type="button" id="listPointBtn" class="listBtn btn btn-warning waves-effect waves-light m-r-10 float-right"><spring:message code="button.list"/></button>
												<button type="button" id="savePointBtn" class="btn btn-danger waves-effect waves-light m-r-10 float-right"><spring:message code="button.save"/></button>										
		                                	</div>
						                </div>

                                    </div>
                                    <!-- 포인트 관리 탭 끝 -->
                                    
                                    <!-- 기프트카드 관리 탭 시작 -->
                                    <div class="tab-pane" id="giftcard-content" role="tabpanel" aria-labelledby="giftcard-tab">

										<input type="hidden" id="giftcardId" name="giftcardId" value="0"/>

										<h5 class="header-title m-t-0 m-b-20 font-600"><spring:message code="gift.customerGiftcardHistory" arguments="${customerName}" /></h5>

						                <div class="row">
						                    <div class="col-md-12">
					                            <div class="table-responsive">
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
					                            </div>
											</div>
						                </div>

										<h5 class="header-title m-t-30 m-b-20 font-600">기프트카드 금액 관리</h5>						
						                
						                <div class="row">
						                    <div class="col-sm-12">
						                        <div class="card card-border">
						                            <div class="card-body">
														<div class="row">
															<div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label">결제구분</label>
																	<div class="col-md-10">
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
															<div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label">현금</label>
																	<div class="col-md-10">
																		<span id="rnum"></span>
																		<input type="text" id="cash" name="cash" class="form-control" value=""/>
																	</div>
											                	</div>
										                	</div>
										                </div>
										                <div class="row">
										                	<div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label">카드</label>
																	<div class="col-md-10">
																		<span id="rnum"></span>
																		<input type="text" id="card" name="card" class="form-control" value=""/>
																	</div>
											                	</div>
											                </div>
														</div>
										                <div class="row">
										                	<div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label">계좌입금</label>
																	<div class="col-md-10">
																		<span id="rnum"></span>
																		<input type="text" id="transfer" name="transfer" class="form-control" value=""/>
																	</div>
											                	</div>
															</div>
														</div>
										                <div class="row">
										                	<div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label">메모</label>
																	<div class="col-md-10">
																		<textarea id="giftMemo" name="giftMemo" class="form-control" row="5"></textarea>
																	</div>
																</div>
															</div>
														</div>
										                <div class="row">
										                	<div class="col-md-12">
																<div class="form-group row">
																	<label class="col-md-2 control-label">적립일</label>
																	<div class="col-md-10">
																		<input type="text" id="giftUseDate" name="giftUseDate" class="form-control" value=""/>
																	</div>
																</div>
										                	</div>
										                </div>
													</div>
												</div>
											</div>
										</div>
						                <div class="row">
						                	<div class="col-md-12">
												<button type="button" id="listGiftBtn" class="listBtn btn btn-warning waves-effect waves-light m-r-10 float-right"><spring:message code="button.list"/></button>
												<button type="button" id="saveGiftBtn" class="btn btn-danger waves-effect waves-light m-r-10 float-right"><spring:message code="button.save"/></button>										
		                                	</div>
						                </div>
                                    </div>
                                    <!-- 기프트카드 관리 탭 끝 -->
									
								</div>								
							
							</div>
						</div>
					</div>
				</div>
				
                <form id="listForm" name="listForm" method="post" action="">
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                	<input type="hidden" id="customerId" name="customerId" value="0"/>
                	<input type="hidden" id="customerName" name="customerName" value=""/>
                </form>

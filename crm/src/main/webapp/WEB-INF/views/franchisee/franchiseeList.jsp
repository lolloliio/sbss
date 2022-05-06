<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

	var table;

    $(document).ready(function () {
    	
    	//데이터 조회
	    table = $("#franchiseeTable").DataTable({
			"serverSide": true,
			"processing": true,
			"searching": false,
	        "language" : {
	            "url" : "<c:url value='/resources/js/Korean.json'/>"
	        },
			"order" : [[ 0, "desc" ]],
	        ajax: {
				"type" : "POST",
				"url" : "<c:url value='/franchisee/selectFranchiseeList'/>",
			    "data" : function (data) {
					return JSON.stringify(data);
				},
				"dataType": "json",
				"contentType": "application/json; charset=utf-8",
				"dataSrc": "data"
	        },
	        columns: [
	        	{ data: "franchiseeId", "visible": false },
	        	{ data: "rnum" },
	        	{ data: "franchiseeName" },
	        	{ data: "phoneNumber" },
	        	{ data: "cellphoneNumber" },
	        	{ data: "franchiseeStatus", "visible": false },
	        	{ data: "franchiseeStatusName" },
	        	{ data: "postalCode", "visible": false },
	        	{ data: "address", "visible": false }	        	
	        ],
	        columnDefs: [
	        	{ targets: [2], className: 'dt-head-center dt-body-left'},
	        	{ targets: [1,3,4,6], className: 'dt-head-center dt-body-center'},
	        	{ targets: 0, width: "0%" },
	            { targets: 1, width: "10%" },
	            { targets: 2, width: "40%" },
	            { targets: 3, width: "20%" },
	            { targets: 4, width: "20%" },
	            { targets: 5, width: "0%" },
	            { targets: 6, width: "10%" },
	            { targets: 7, width: "0%" },
	            { targets: 8, width: "0%" },
			],
	    });
	    
	    $("#franchiseeTable tbody").on( "click", "td", function () {
            var tdIndex = this.cellIndex;
            if (tdIndex != 0){
    	        var rowData = table.row($(this).closest('tr')).data();
    	        $("#franchiseeId").val(rowData.franchiseeId);
    	        $("#franchiseeName").val(rowData.franchiseeName);
    	        $("#rnum").text(rowData.rnum);
    	        $("#postalCode").val(rowData.postalCode);
    	        $("#address").val(rowData.address);
    	        $("#phoneNumber").val(rowData.phoneNumber);
    	        $("#cellphoneNumber").val(rowData.cellphoneNumber);
    	        $("#franchiseeStatus").val(rowData.franchiseeStatus);
    	        
    	        $("#saveBtn").hide();
    	        $("#modifyBtn").show();
            }
	    });
    	
    	$('#postalCode, #postalIcon').click( function() {
    	    new daum.Postcode({
    	        oncomplete: function(data) {
    	        	$('#postalCode').val(data.zonecode);
					$('#address').val(data.address);
    	        }
    	    }).open();			
		});
    	
    	$('#saveBtn').click( function() {
    		
    		var franchiseeId = $('#franchiseeId').val();
    		var franchiseeName = $('#franchiseeName').val();
    		var phoneNumber = $('#phoneNumber').val();
    		var cellphoneNumber = $('#cellphoneNumber').val();
    		var postalCode = $('#postalCode').val();
    		var address = $('#address').val();
    		var franchiseeStatus = $('#franchiseeStatus').val();

    		$.ajax({
    		    url: '<c:url value="/franchisee/insertFranchiseeInformation"/>',
    		    type: 'POST',
				dataType: 'json',
    		    data: {
    		    	franchiseeId : franchiseeId,
    		    	franchiseeName : franchiseeName,
    		    	phoneNumber : phoneNumber,
    		    	cellphoneNumber : cellphoneNumber,
    		    	postalCode : postalCode,
    		    	address : address,
    		    	franchiseeStatus : franchiseeStatus
    		    },
    		    success: function(data) {
					if(data.result == 'success'){
	    	            Swal.fire({
	    	            	title : title,
							text: text,
							type: type,
							confirmButtonColor: '#ff9800'
						}).then(function(){
							table.draw();
							fn_clear();
						});
					}
    		    }
    		});

    	});
    	
    	$('#modifyBtn').click( function() {
    		
    		var franchiseeId = $('#franchiseeId').val();
    		var franchiseeName = $('#franchiseeName').val();
    		var phoneNumber = $('#phoneNumber').val();
    		var cellphoneNumber = $('#cellphoneNumber').val();
    		var postalCode = $('#postalCode').val();
    		var address = $('#address').val();
    		var franchiseeStatus = $('#franchiseeStatus').val();

    		$.ajax({
    		    url: '<c:url value="/franchisee/updateFranchiseeInformation"/>',
    		    type: 'POST',
				dataType: 'json',
    		    data: {
    		    	franchiseeId : franchiseeId,
    		    	franchiseeName : franchiseeName,
    		    	phoneNumber : phoneNumber,
    		    	cellphoneNumber : cellphoneNumber,
    		    	postalCode : postalCode,
    		    	address : address,
    		    	franchiseeStatus : franchiseeStatus
    		    },
    		    success: function(data) {
					if(data.result == 'success'){
	    	            Swal.fire({
	    	            	title : '<spring:message code="success.changed"/>',
							type : 'success',
							confirmButtonColor: '#ff9800'
						}).then(function(){
							table.draw();
							fn_clear();
						});
						
					}
    		    }
    		});

    	});    	
    	
    	$('#clearBtn').click( function() {
    		fn_clear();
    	});	    
    });
    
    function fn_clear(){
    	$("#rnum").text("");
    	$("#franchiseeId").val("");
    	$("#franchiseeName").val("");
    	$("#phoneNumber").val("");	
    	$("#cellphoneNumber").val("");
    	$("#phoneNumber").val("");
    	$("#postalCode").val("");
    	$("#address").val("");
		$("#franchiseeStatus").val("");
		
        $("#saveBtn").show();
        $("#modifyBtn").hide();
    }        
</script>

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            <ol class="breadcrumb float-right p-0 m-0">
                                <li><a href="#">가맹점 관리</a></li>
                                <li class="active">가맹점 관리</li>
                            </ol>
                            <h4 class="page-title m-0">가맹점 관리</h4>
                        </div>

                    </div>
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-border card-warning">
                            <div class="card-heading"></div>
                            <div class="card-body table-responsive">
                            
								<!-- 가맹점 목록 -->
								<h5 class="m-t-0 m-b-20 font-600">가맹점 목록</h5>

                                <table id="franchiseeTable"
                                        class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                    <tr>
                                    	<th>가맹점 아이디</th>
                                    	<th>번호</th>
                                        <th>가맹점 이름</th>
                                        <th>전화번호</th>
                                        <th>휴대폰번호</th>
                                        <th>영업상태코드</th>
                                        <th>영업상태</th>
                                        <th>우편번호</th>
                                        <th>주소</th>
                                    </tr>
                                    </thead>
                                </table>
                                
								<!-- 가맹점 목록 -->
								<h5 class="m-t-30 m-b-20 font-600">가맹점 상세정보</h5>
                                
				                <div class="row">
				                    <div class="col-sm-12">
				                        <div class="card card-border">
				                            <div class="card-body">
				                                <div class="row">
				                                    <div class="col-md-12">
														<div class="form-group row">
															<label class="col-md-2 control-label">번호</label>
															<div class="col-md-10">
																<span id="rnum"></span>
																<input type="hidden" id="franchiseeId" name="franchiseeId" value=""/>
															</div>
														</div>
													</div>
												</div>
				                                <div class="row">
				                                    <div class="col-md-12">
														<div class="form-group row">
															<label class="col-md-2 control-label">이름<span class="text-danger">*</span></label>
															<div class="col-md-10 input-group">
																<div class="input-group-prepend">
																	<span class="input-group-text bg-custom text-white b-0"><i class="fa fa-user"></i></span>
																</div>
																<input type="text" class="form-control" id="franchiseeName" name="franchiseeName" value="" required="" />
															</div>
														</div>
													</div>
												</div>
				                                <div class="row">
				                                    <div class="col-md-12">
														<div class="form-group row">
															<label class="col-md-2 control-label">전화번호</label>
															<div class="col-md-10">
					                                            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="" />
															</div>
														</div>
													</div>										
												</div>
				                                <div class="row">
				                                    <div class="col-md-12">
														<div class="form-group row">
															<label class="col-md-2 control-label">휴대폰번호</label>
															<div class="col-md-10">
																<input type="text" class="form-control" id="cellphoneNumber" name="cellphoneNumber" value="" />
															</div>
														</div>
				                                    </div>
												</div>
				                                <div class="row">
				                                    <div class="col-md-12">
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
				                                    <div class="col-md-12">
														<div class="form-group row">
															<label class="col-md-2 control-label"><spring:message code="customer.address"/></label>
															<div class="col-md-10">
																<input type="text" class="form-control" id="address" name="address" value="">
															</div>
														</div>
													</div>
												</div>
				                                <div class="row">
				                                    <div class="col-md-12">										
														<div class="form-group row">
															<label class="col-md-2 control-label">영업상태</label>
															<div class="col-md-10 input-group">
					                                            <select class="form-control" id="franchiseeStatus" name="franchiseeStatus">
					                                            <c:forEach var="item" items="${franchiseeStatusList}">
				                                                    <option value="<c:out value='${item.codeId }'/>" ><c:out value='${item.codeName}'/></option>
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
                                  
								<div class="row">
									<div class="col-md-12">
										<button type="button" id="modifyBtn" class="btn btn-danger waves-effect waves-light m-r-10 float-right" style="display:none"><spring:message code="button.modify"/></button>
										<button type="button" id="saveBtn" class="btn btn-danger waves-effect waves-light m-r-10 float-right"><spring:message code="button.save"/></button>
										<button type="button" id="clearBtn" class="btn btn-warning waves-effect waves-light m-r-10 float-right"><spring:message code="button.clear"/></button>
									</div>
								</div>
                                                           
                            </div>
                            
                        </div>
                    </div>
                </div>
                
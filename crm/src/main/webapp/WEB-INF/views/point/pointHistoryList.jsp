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
	    table = $("#pointHistoryTable").DataTable({
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
				"url" : "<c:url value='/point/selectPointHistoryList'/>",
			    "data" : function (data) {
			    	data.customerId = $("#customerId").val();
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
	        ],
	        columnDefs: [
	        	{ targets: [5], className: 'dt-head-center dt-body-left'},
	        	{ targets: [1,6], className: 'dt-head-center dt-body-center'},
	        	{ targets: [2,3,4], className: 'dt-head-center dt-body-right'},
	        	{ targets: 0, width: "0%" },
	            { targets: 1, width: "10%" },
	            { targets: 2, width: "15%" },
	            { targets: 3, width: "15%" },
	            { targets: 4, width: "15%" },
	            { targets: 5, width: "35%" },
	            { targets: 6, width: "10%" },
			],
	    });

    	$("#saveBtn").click(function(){
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
					if(data.result == 'success'){
	    	            Swal.fire({
	    	            	title : '<spring:message code="success.saved"/>',
							type : 'success',
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
    		location.href = "<c:url value='/point/pointList'/>";
    	});
    	
    });
        
    function fn_clear(){
    	$("#earnPoint").val("");
    	$("#memo").val("");
    	$('#useDate').val(getToday());
    }
	
</script>
				<input type="hidden" id="pointId" name="pointId" value="<c:out value='${pointId}'/>" />
				<input type="hidden" id="customerId" name="customerId" value="<c:out value='${customerId}'/>" />
                
                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            <ol class="breadcrumb float-right p-0 m-0">
                                <li><a href="#"><spring:message code="point.managePoint"/></a></li>
                                <li class="active"><spring:message code="point.pointHistoryList"/></li>
                            </ol>
                            <h4 class="page-title m-0"><spring:message code="point.pointHistoryList"/></h4>
                         </div>

                    </div>
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-border card-warning">
                            <div class="card-heading"></div>
                            <div class="card-body table-responsive">
                            
                            	<h5 class="m-t-0 m-b-20 font-600"><spring:message code="point.customerPointHistory" arguments="${customerName}" /></h5>

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
                                
                                <h5 class="m-t-30 m-b-20 font-600"><spring:message code="point.regPoint"/></h5>
                                
								<div class="row">
									<div class="col-sm-12">
				                        <div class="card card-border card-warning">
				                            <div class="card-body">
								                <div class="row">
								                	<div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-1 control-label"><spring:message code="point.point"/><span class="text-danger">*</span></label>
															<div class="col-md-11">
																<input type="text" id="earnPoint" name="earnPoint" class="form-control" value=""/>
															</div>
														</div>
								                	</div>
												</div>
												<div class="row">
								                	<div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-1 control-label"><spring:message code="point.memo"/></label>
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
										<button type="button" id="saveBtn" class="btn btn-danger waves-effect waves-light m-r-10 float-right"><spring:message code="button.save"/></button>										
									</div>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
                
                
				
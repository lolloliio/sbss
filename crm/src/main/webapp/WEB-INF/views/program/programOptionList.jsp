<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>

	var table;

    $(document).ready(function () {
    	
    	//데이터 조회
		table = $("#programOptionTable").DataTable({
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
				"url" : "<c:url value='/program/selectProgramOptionList'/>",
			    "data" : function (data) {
					return JSON.stringify(data);
				},
				"dataType": "json",
				"contentType": "application/json; charset=utf-8",
				"dataSrc": "data"
	        },
	        columns: [
	        	{ data: "programOptionId", "visible": false },
	        	{ data: "rnum" },
	        	{ data: "programOptionName" },
	        	{ data: "price" },
	        	{ data: "useStatus", "visible": false },
	        	{ data: "useStatusName" },
	        ],
	        columnDefs: [
	        	{ targets: [2], className: 'dt-head-center dt-body-left'},
	        	{ targets: [1,5], className: 'dt-head-center dt-body-center'},
	        	{ targets: [3], className: 'dt-head-center dt-body-right'},
	        	{ targets: 0, width: "0%" },
	            { targets: 1, width: "10%" },
	            { targets: 2, width: "70%" },
	            { targets: 3, width: "10%" },
	            { targets: 4, width: "0%" },
	            { targets: 5, width: "10%" },
			],
	    });
    	
	    $('#programOptionTable tbody').on('click', 'td', function (e) {
            var tdIndex = this.cellIndex;
            if (tdIndex != 0){
    	        var rowData = table.row($(this).closest('tr')).data();
    	   		$("#rnum").html(rowData.rnum);
    	   		$("#programOptionId").val(rowData.programOptionId);
    	   		$("#programOptionName").val(rowData.programOptionName);
    	   		$("#price").val(rowData.price);
    	   		$("#useStatus").val(rowData.useStatus);
    	   		
    	    	$("#saveBtn").hide();
    			$("#modifyBtn").show();
            }
    	});
	    
	    $('#saveBtn').click(function(){

	    	var programOptionName = $("#programOptionName").val();
	    	var price = $("#price").val();
	    	var useStatus = $("#useStatus").val();
	    	
    		$.ajax({
    		    url: '<c:url value="/program/insertProgramOptionInformation"/>',
    		    type: 'POST',
				dataType: 'json',
    		    data: {
    		    	programOptionName : programOptionName,
    		    	price : price,
    		    	useStatus : useStatus
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
	    
	    $('#modifyBtn').click(function(){

	    	var programOptionId = $("#programOptionId").val();
	    	var programOptionName = $("#programOptionName").val();
	    	var price = $("#price").val();
	    	var useStatus = $("#useStatus").val();
	    	
    		$.ajax({
    		    url: '<c:url value="/program/updateProgramOptionInformation"/>',
    		    type: 'POST',
				dataType: 'json',
    		    data: {
    		    	programOptionId : programOptionId,
    		    	programOptionName : programOptionName,
    		    	price : price,
    		    	useStatus : useStatus
    		    },
    		    success: function(data) {
					if(data.result == 'success'){
	    	            Swal.fire({
	    	            	title : '<spring:message code="success.changed"/>',
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
	    
	    $('#clearBtn').click(function(){
	    	fn_clear();
	    });
	    	   
	    function fn_clear(){
	    	$("#rnum").html("");
	    	$("#programOptionId").val(0);
	    	$("#programOptionName").val("");
	    	$("#price").val(0);
	    	$("#useStatus").val("");
	    	
	    	$("#saveBtn").show();
			$("#modifyBtn").hide();
	    }
	    
    });
        
</script>
			<form data-parsley-validate="">
                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            <ol class="breadcrumb float-right p-0 m-0">
                                <li><a href="#"><spring:message code="program.manageCode"/></a></li>
                                <li class="active"><spring:message code='program.manageProgramOption'/></li>
                            </ol>
                            <h4 class="page-title m-0"><spring:message code="program.manageProgramOption"/></h4>
                        </div>

                    </div>
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-border card-warning">
                            <div class="card-heading"></div>
                            <div class="card-body table-responsive">

								<h5 class="header-title m-t-0 m-b-20 font-600"><spring:message code='program.programOptionList'/></h5>

                                <table id="programOptionTable"
                                        class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                    <tr>
                                    	<th><spring:message code='program.programOptionId'/></th>
                                        <th><spring:message code='program.rowNumber'/></th>
                                        <th><spring:message code='program.programOptionName'/></th>
                                        <th><spring:message code='program.price'/></th>
                                        <th><spring:message code='program.useStatusCode'/></th>
                                        <th><spring:message code='program.useStatus'/></th>
                                    </tr>
                                    </thead>
                                </table>
                                
                                <h5 class="header-title m-t-20 m-b-20 font-600"><spring:message code="program.programOptionDetail"/></h5>
                                
								<div class="row">
									<div class="col-sm-12">
				                        <div class="card card-border card-warning">
				                            <div class="card-heading">
				                            </div>
				                            
				                            <div class="card-body">
				
								                <div class="row">
								                	<div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-2 control-label"><spring:message code="program.rowNumber"/></label>
															<div class="col-md-10">
																<span id="rnum"></span>
																<input type="hidden" id="programOptionId" name="programOptionId" value="0"/>
															</div>
														</div>
								                	</div>
												</div>
												<div class="row">
								                	<div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-2 control-label"><spring:message code="program.programOptionName"/><span class="text-danger">*</span></label>
															<div class="col-md-10">
																<input type="text" class="form-control" id="programOptionName" name="programOptionName" value="" required="" />
															</div>
														</div>
								                	</div>
								                </div>
												<div class="row">
								                	<div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-2 control-label"><spring:message code="program.price"/><span class="text-danger">*</span></label>
															<div class="col-md-10">
																<input type="text" class="form-control" id="price" name="price" value="" required="" />
															</div>
														</div>
								                	</div>
												</div>
												<div class="row">
								                	<div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-2 control-label"><spring:message code="program.useStatus"/><span class="text-danger">*</span></label>
															<div class="col-md-10">
					                                            <select class="form-control" id="useStatus" name="useStatus">
					                                            	<option value=""><spring:message code='common.select'/></option>
																	<option value="Y"><spring:message code='program.use'/></option>
																	<option value="N"><spring:message code='program.unused'/></option>												
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
				                	<div class="col-lg-12">
										<button type="button" id="modifyBtn" class="btn btn-danger waves-effect waves-light m-t-20 m-r-10 float-right" style="display:none"><spring:message code="button.modify"/></button>
                                		<button type="button" id="saveBtn" class="btn btn-danger waves-effect waves-light m-t-20 m-r-10 float-right"><spring:message code="button.save"/></button>
                                		<button type="button" id="clearBtn" class="btn btn-warning waves-effect waves-light m-t-20 m-r-10 float-right"><spring:message code="button.clear"/></button>
                                	</div>
				                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
                
                
				
			</form>
                
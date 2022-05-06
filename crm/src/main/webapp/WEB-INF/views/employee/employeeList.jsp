<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

	var table;

    $(document).ready(function () {
    	
    	$('#hireDate').val(getToday());
    	
    	$('#hireDate').datepicker({
    		format: "yyyy-mm-dd",
    		language: "ko",
    		orientation: "bottom auto",
    		autoclose: true
		});    	
    	
    	//데이터 조회
	    table = $("#employeeTable").DataTable({
			"serverSide": true,
			"processing": true,
			"searching": false,
	        "language" : {
	            "url" : "<c:url value='/resources/js/Korean.json'/>"
	        },
			"order" : [[ 0, "desc" ]],
	        ajax: {
				"type" : "POST",
				"url" : "<c:url value='/employee/selectEmployeeList'/>",
			    "data" : function (data) {
					return JSON.stringify(data);
				},
				"dataType": "json",
				"contentType": "application/json; charset=utf-8",
				"dataSrc": "data"
	        },
	        columns: [
	        	{ data: "employeeId", "visible": false },
	        	{ data: "rnum" },
	        	{ data: "employeeName" },
	        	{ data: "email" },
	        	{ data: "cellphoneNumber" },
	        	{ data: "jobClassId", visible: false },
	        	{ data: "jobClassName" },
	        	{ data: "hireDate" },
	        	{ data: "etc", "visible": false }
	        ],
	        columnDefs: [
	        	{ targets: [2,3], className: 'dt-head-center dt-body-left'},
	        	{ targets: [1,4,6,7], className: 'dt-head-center dt-body-center'},
	        	{ targets: 0, width: "0%" },
	            { targets: 1, width: "10%" },
	            { targets: 2, width: "20%" },
	            { targets: 3, width: "20%" },
	            { targets: 4, width: "20%" },
	            { targets: 5, width: "0%" },
	            { targets: 6, width: "15%" },
	            { targets: 7, width: "15%" },
	            { targets: 8, width: "0%" },
			],
	    });
	    
	    $("#employeeTable tbody").on( "click", "td", function () {
            var tdIndex = this.cellIndex;
            if (tdIndex != 0){
    	        var rowData = table.row($(this).closest('tr')).data();
    	        $("#rnum").text(rowData.rnum);
    	        $("#employeeId").val(rowData.employeeId);
    	        $("#employeeName").val(rowData.employeeName);
    	        $("#email").val(rowData.email);
    	        $("#cellphoneNumber").val(rowData.cellphoneNumber);
    	        $("#jobClassId").val(rowData.jobClassId);
    	        $("#hireDate").val(rowData.hireDate);
    	        $("#etc").val(rowData.etc);
    	        
    	        $("#saveBtn").hide();
    	        $("#modifyBtn").show();
            }
	    });
	    
    	$('#saveBtn').click( function() {
    		
    		var employeeName = $('#employeeName').val();
    		var email = $('#email').val();
    		var cellphoneNumber = $('#cellphoneNumber').val();
    		var hireDate = $('#hireDate').val();
    		var jobClassId = $('#jobClassId').val();
    		var franchiseeId = $('#franchiseeId').val();
    		var password = $('#password').val();
    		var employeeStatus = $('#employeeStatus').val();
    		var etc = $('#etc').val();
    		    		    		
    		$.ajax({
    		    url: '<c:url value="/employee/insertEmployeeInformation"/>',
    		    type: 'POST',
				dataType: 'json',
    		    data: {
    		    	employeeName : employeeName,
    		    	email : email,
    		    	cellphoneNumber : cellphoneNumber,
    		    	hireDate : hireDate,
    		    	jobClassId : jobClassId,
    		    	franchiseeId : franchiseeId,
    		    	password : password,
    		    	employeeStatus : employeeStatus,
    		    	etc : etc
    		    },
    		    success: function(data) {
					if(data.result == 'success'){
	    	            Swal.fire({
	    	            	title : '<spring:message code="success.saved"/>',
							type: 'success',
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
    		
    		var employeeId = $('#employeeId').val();
    		var employeeName = $('#employeeName').val();
    		var email = $('#email').val();
    		var cellphoneNumber = $('#cellphoneNumber').val();
    		var hireDate = $('#hireDate').val();
    		var jobClassId = $('#jobClassId').val();
    		var franchiseeId = $('#franchiseeId').val();
    		var password = $('#password').val();
    		var employeeStatus = $('#employeeStatus').val();
    		var etc = $('#etc').val();
    		    		    		
    		$.ajax({
    		    url: '<c:url value="/employee/updateEmployeeInformation"/>',
    		    type: 'POST',
				dataType: 'json',
    		    data: {
    		    	employeeId : employeeId,
    		    	employeeName : employeeName,
    		    	email : email,
    		    	cellphoneNumber : cellphoneNumber,
    		    	hireDate : hireDate,
    		    	jobClassId : jobClassId,
    		    	franchiseeId : franchiseeId,
    		    	password : password,
    		    	employeeStatus : employeeStatus,
    		    	etc : etc
    		    },
    		    success: function(data) {
					if(data.result == 'success'){
	    	            Swal.fire({
	    	            	title : '<spring:message code="success.saved"/>',
							type: 'success',
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
		$('#employeeId').val("");
		$('#employeeName').val("");		
		$('#email').val("");
		$('#cellphoneNumber').val("");
		$('#hireDate').val("");
		$('#jobClassId').val("");		
		$('#password').val("");
		$('#employeeStatus').val("");
		$('#etc').val("");
		
        $("#saveBtn").show();
        $("#modifyBtn").hide();
    }
        
</script>

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            <ol class="breadcrumb float-right p-0 m-0">
                                <li><a href="#">직원 관리</a></li>
                                <li class="active">직원 관리</li>
                            </ol>
                            <h4 class="page-title m-0">직원 관리</h4>
                        </div>

                    </div>
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-border card-warning">
                            <div class="card-heading"></div>
                            <div class="card-body table-responsive">

								<!-- 직원 목록 -->
								<h5 class="m-t-0 m-b-20 font-600">직원 목록</h5>

                                <table id="employeeTable"
                                        class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                    <tr>
                                    	<th>직원 아이디</th>
                                    	<th>번호</th>
                                        <th>이름</th>
                                        <th>이메일</th>
                                        <th>휴대폰번호</th>
                                        <th>직급코드</th>
                                        <th>직급</th>
                                        <th>입사일</th>
                                        <th>메모</th>
                                    </tr>
                                    </thead>
                                </table>
                                
								<!-- 직원 상세 정보 -->
								<h5 class="m-t-30 m-b-20 font-600">직원 상세 정보</h5>
                            
				                <div class="row">
				                    <div class="col-sm-12">
				                        <div class="card card-border">
				                            <div class="card-body">
				                                <div class="row">
				                                    <div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-2 control-label">번호</label>
															<div class="col-md-10">
																<span id="rnum"></span>
																<input type="hidden" id="employeeId" name="employeeId" value=""/>
															</div>
														</div>
													</div>
												</div>
				                                <div class="row">
				                                    <div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-2 control-label">이름<span class="text-danger">*</span></label>
															<div class="col-md-10 input-group">
																<div class="input-group-prepend">
																	<span class="input-group-text bg-custom text-white b-0"><i class="fa fa-user"></i></span>
																</div>
																<input type="text" class="form-control" id="employeeName" name="employeeName" value="" required="" />
															</div>
														</div>
													</div>
												</div>
				                                <div class="row">
				                                    <div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-2 control-label">이메일<span class="text-danger">*</span></label>
															<div class="col-md-10">
					                                            <input type="text" class="form-control" id="email" name="email" value="" />
															</div>
														</div>
													</div>
												</div>
				                                <div class="row">
				                                    <div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-2 control-label">비밀번호<span class="text-danger">*</span></label>
															<div class="col-md-10">
																<input type="text" class="form-control" id="password" name="password" value="" required="" />
															</div>
														</div>
				                                    </div>
												</div>
				                                <div class="row">
				                                    <div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-2 control-label">휴대폰번호<span class="text-danger">*</span></label>
															<div class="col-md-10">
																<input type="text" class="form-control" id="cellphoneNumber" name="cellphoneNumber" value="" required="" />
															</div>
														</div>
													</div>
												</div>
				                                <div class="row">
				                                    <div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-2 control-label">직급</label>
															<div class="col-md-10">
					                                            <select class="form-control" id="jobClassId" name="jobClassId">
					                                            <option value=""><spring:message code="common.select"/></option>
					                                            <c:forEach var="item" items="${jobClassList}">
				                                                    <option value="<c:out value='${item.codeId }'/>" ><c:out value='${item.codeName}'/></option>
																</c:forEach>
					                                            </select>
															</div>
														</div>
													</div>
												</div>
				                                <div class="row">
				                                    <div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-2 control-label">입사일</label>
															<div class="col-md-10 input-group">
																<input type="text" class="form-control" id="hireDate" name="hireDate" value="">
															</div>
														</div>
													</div>
												</div>
				                                <div class="row">
				                                    <div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-2 control-label">근무 상태</label>
															<div class="col-md-10">
					                                            <select class="form-control" id="employeeStatus" name="employeeStatus">
					                                            <c:forEach var="item" items="${employeeStatusList}">
				                                                    <option value="<c:out value='${item.codeId }'/>" ><c:out value='${item.codeName}'/></option>
																</c:forEach>
					                                            </select>
															</div>
														</div>
				                                    </div>
												</div>
				                                <div class="row">
				                                    <div class="col-lg-12">							
														<div class="form-group row">
															<label class="col-md-2 control-label">메모</label>
															<div class="col-md-10">
																<textarea class="form-control" id="etc" name="etc" rows="5"></textarea>
															</div>
														</div>
													</div>																					
				                                </div>
				                                <div class="row">
				                                    <div class="col-lg-12">
				                                    	<div class="form-group row">
															<label class="col-md-2 control-label">가맹점</label>
															<div class="col-md-10 input-group">
					                                            <select class="form-control" id="franchiseeId" name="franchiseeId">
					                                            <c:forEach var="item" items="${franchiseeList}">
				                                                    <option value="<c:out value='${item.franchiseeId}'/>" ><c:out value='${item.franchiseeName}'/></option>
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
                
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    $(document).ready(function () {
    	
    	$('#hireDate').datepicker({
    		format: "yyyy-mm-dd",
    		language: "ko",
    		orientation: "bottom auto",
    		autoclose: true
		});
    	    	
    	$('#saveBtn').click( function() {

    		var employeeName = $('#employeeName').val();
    		var email = $('#email').val();
    		var cellphoneNumber = $('#cellphoneNumber').val();
    		var hireDate = $('#hireDate').val();
    		var jobClassId = $('#jobClassId').val();
    		var franchiseeId = $('#franchiseeId').val();
    		var employeeStatus = $('#employeeStatus').val();
    		var etc = $('#etc').val();
    		
    		$.ajax({
    		    url: '<c:url value="/employee/updateEmployeeInformation"/>',
    		    type: 'POST',
				dataType: 'json',
    		    data: {
    		    	employeeId : '<c:out value="${employee.employeeId}"/>',
    		    	employeeName : employeeName,
    		    	email : email,
    		    	cellphoneNumber : cellphoneNumber,
    		    	hireDate : hireDate,
    		    	jobClassId : jobClassId,
    		    	franchiseeId : franchiseeId,
    		    	employeeStatus : employeeStatus,
    		    	etc : etc
    		    },
    		    success: function(data) {
					if(data.result == 'success'){
	    	            Swal.fire({
	    	            	title : '<spring:message code="success.saved"/>',
							type : 'success',
							confirmButtonColor: '#ff9800'
						}).then(function(){
							location.href = '<c:url value="/employee/employeeList"/>';
						});
					}
    		    }
    		});

    	});
    	
    	$('#listBtn').click( function() {
    		location.href = '<c:url value="/employee/employeeList"/>';
    	});

    });
</script>

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            
                            <ol class="breadcrumb float-right p-0 m-0">
                                <li><a href="#">직원 관리</a></li>
                                <li class="active">직원 조회</li>
                            </ol>
                            <h4 class="page-title m-0">직원 조회</h4>
                        
                        </div>
                    </div>
                </div>
                <!-- end row -->
                
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-border card-warning">
                            <div class="card-heading">
                            	<h4 class="m-t-0 header-title"><b>직원 정보</b></h4>
                            </div>
                        	
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-6">
										<div class="form-group row">
											<label class="col-md-2 control-label">이름<span class="text-danger">*</span></label>
											<div class="col-md-10 input-group">
												<div class="input-group-prepend">
													<span class="input-group-text bg-custom text-white b-0"><i class="fa fa-user"></i></span>
												</div>
												<input type="text" class="form-control" id="employeeName" name="employeeName" value="<c:out value='${employee.employeeName}'/>" required="" />
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label">이메일<span class="text-danger">*</span></label>
											<div class="col-md-10">
	                                            <input type="text" class="form-control" id="email" name="email" value="<c:out value='${employee.email}'/>" required="" readonly />
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label">휴대폰<span class="text-danger">*</span></label>
											<div class="col-md-10">
												<input type="text" class="form-control" id="cellphoneNumber" name="cellphoneNumber" value="<c:out value='${employee.cellphoneNumber}'/>" required="" />
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label">근무 상태</label>
											<div class="col-md-10">
	                                            <select class="form-control" id="employeeStatus" name="employeeStatus">
	                                            <c:forEach var="item" items="${employeeStatusList}">
                                                    <option value="<c:out value='${item.codeId }'/>" <c:if test='${item.codeId eq employee.employeeStatus}'>selected</c:if> ><c:out value='${item.codeName}'/></option>
												</c:forEach>
	                                            </select>
											</div>
										</div>
                                    </div>

                                    <div class="col-lg-6">
										<div class="form-group row">
											<label class="col-md-2 control-label">입사일</label>
											<div class="col-md-10 input-group">
												<input type="text" class="form-control" id="hireDate" name="hireDate" value="<c:out value='${employee.hireDate}'/>">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label">직급</label>
											<div class="col-md-10">
	                                            <select class="form-control" id="jobClassId" name="jobClassId">
	                                            <c:forEach var="item" items="${jobClassList}">
                                                    <option value="<c:out value='${item.codeId }'/>" <c:if test='${item.codeId eq employee.jobClassId}'>selected</c:if> ><c:out value='${item.codeName}'/></option>
												</c:forEach>
	                                            </select>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label">가맹점</label>
											<div class="col-md-10 input-group">
	                                            <select class="form-control" id="franchiseeId" name="franchiseeId">
	                                            <c:forEach var="item" items="${franchiseeList}">
                                                    <option value="<c:out value='${item.franchiseeId}'/>" <c:if test='${item.franchiseeId eq employee.franchiseeId}'>selected</c:if> ><c:out value='${item.franchiseeName}'/></option>
												</c:forEach>
	                                            </select>
											</div>
										</div>
                                    </div>
                                    <div class="col-lg-12">
										<div class="form-group row">
											<label class="col-md-1 control-label">기타</label>
											<div class="col-md-11">
												<textarea class="form-control" id="etc" name="etc" rows="5"><c:out value='${employee.etc}'/></textarea>
											</div>
										</div>
									</div>
									
	                                <div class="col-lg-12">
	                                	<button type="button" id="listBtn" class="btn btn-danger waves-effect waves-light m-t-20 m-r-10 float-right"><spring:message code="button.list"/></button>
	                                	<button type="button" id="saveBtn" class="btn btn-warning waves-effect waves-light m-t-20 m-r-10 float-right"><spring:message code="button.modify"/></button>                                	
	                                </div>									
														
                                </div>
                                <!-- end row -->

                            </div>
                        </div>
                    </div><!-- end col -->
                </div>
                <!-- end row -->

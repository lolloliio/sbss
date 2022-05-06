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
    	
    	$('#postalCode, #postalIcon').click( function() {
    	    new daum.Postcode({
    	        oncomplete: function(data) {
    	        	$('#postalCode').val(data.zonecode);
					$('#address').val(data.address);
    	        }
    	    }).open();			
		});
    	
    	$('#saveBtn').click( function() {
    		
    		var franchiseeId = '<c:out value="${franchisee.franchiseeId}"/>';
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
	    	            	title : '<spring:message code="success.saved"/>',
							type: 'success',
							confirmButtonColor: '#ff9800'
						}).then(function(){
							location.href = '<c:url value="/franchisee/franchiseeList"/>';
						});
					}
    		    }
    		});

    	});
    	
    	$('#listBtn').click( function() {
    		location.href = '<c:url value="/franchisee/franchiseeList"/>';
    	});

    });
</script>

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            
                            <ol class="breadcrumb float-right p-0 m-0">
                                <li><a href="#">가맹점 관리</a></li>
                                <li class="active">가맹점 조회</li>
                            </ol>
                            <h4 class="page-title m-0">가맹점 조회</h4>
                        
                        </div>
                    </div>
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-border card-warning">
                            <div class="card-heading">
                            	<h4 class="m-t-0 header-title"><b>가맹점 정보</b></h4>
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
												<input type="text" class="form-control" id="franchiseeName" name="franchiseeName" value="<c:out value='${franchisee.franchiseeName}'/>" required="" />
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label">전화번호</label>
											<div class="col-md-10">
	                                            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="<c:out value='${franchisee.phoneNumber}'/>" />
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label">휴대폰번호</label>
											<div class="col-md-10">
												<input type="text" class="form-control" id="cellphoneNumber" name="cellphoneNumber" value="<c:out value='${franchisee.cellphoneNumber}'/>" />
											</div>
										</div>
                                    </div>

                                    <div class="col-lg-6">
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.postalCode"/></label>
											<div class="col-md-10 input-group">
												<input type="number" class="form-control" id="postalCode" name="postalCode" value="<c:out value='${franchisee.postalCode}'/>" maxlength="5">
												<div class="input-group-append">
													<span class="input-group-text bg-custom text-white b-0"><i class="fa fa-envelope-o" id="postalIcon"></i></span>
												</div>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.address"/></label>
											<div class="col-md-10">
												<input type="text" class="form-control" id="address" name="address" value="<c:out value='${franchisee.address}'/>">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label">영업상태</label>
											<div class="col-md-10 input-group">
	                                            <select class="form-control" id="franchiseeStatus" name="franchiseeStatus">
	                                            <c:forEach var="item" items="${franchiseeStatusList}">
                                                    <option value="<c:out value='${item.codeId }'/>" <c:if test='${item.codeId eq franchisee.franchiseeStatus}'>selected</c:if> ><c:out value='${item.codeName}'/></option>
												</c:forEach>
	                                            </select>
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

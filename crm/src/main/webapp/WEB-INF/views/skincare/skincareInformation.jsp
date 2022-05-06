<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
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
    	
    	$('#modifyBtn').click( function() {

    		var comma 				= '';
    		var customerId			= "<c:out value='${customer.customerId}'/>";
    		var customerName		= $('#customerName').val();
    		var sex 				= $('#sex').val();
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
    		    	sex : sex,
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
						}).then(function(){
							location.href = '<c:url value="/customer/customerList"/>';
						});
					}
    		    }
    		});	
    	});
    	
    	$('#listBtn').click( function() {
    		location.href = '<c:url value="/customer/customerList"/>';
    	});

    });
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
				<form name="saveForm" method="post">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-border card-warning">
                            <div class="card-heading">
                            	<h4 class="m-t-0 header-title"><b><spring:message code="customer.basicInformation"/></b></h4>
                            </div>
                        	
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-6">
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.customerName"/><span class="text-danger">*</span></label>
											<div class="col-md-10 input-group">
												<div class="input-group-prepend">
													<span class="input-group-text bg-custom text-white b-0"><i class="fa fa-user"></i></span>
												</div>
												<input type="text" class="form-control" id="customerName" name="customerName" value="<c:out value='${customer.customerName}'/>" required="" />
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.sex"/></label>
											<div class="col-md-10">
	                                            <select class="form-control" id="sex" name="sex">
	                                            <c:forEach var="item" items="${sexList}">
                                                    <option value="<c:out value='${item.codeId}'/>" <c:if test="${tem.codeId eq customer.sex}">checked</c:if> ><c:out value='${item.codeName}'/></option>
												</c:forEach>
	                                            </select>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.dateOfBirth"/></label>
											<div class="col-md-10 input-group">
												<input type="text" class="form-control" id="dateOfBirth" name="dateOfBirth" value="<c:out value='${customer.dateOfBirth}'/>">
												<div class="input-group-append">
													<span class="input-group-text bg-custom text-white b-0"><i class="mdi mdi-calendar"></i></span>
												</div>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.cellphoneNumber"/><span class="text-danger">*</span></label>
											<div class="col-md-10">
												<input type="text" class="form-control" id="cellphoneNumber" name="cellphoneNumber" value="<c:out value='${customer.cellphoneNumber}'/>" required="">
											</div>
										</div>
                                    </div>

                                    <div class="col-lg-6">
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.postalCode"/></label>
											<div class="col-md-10 input-group">
												<input type="text" class="form-control" id="postalCode" name="postalCode" value="<c:out value='${customer.postalCode}'/>" maxlength="5">
												<div class="input-group-append">
													<span class="input-group-text bg-custom text-white b-0"><i class="fa fa-envelope-o" id="postalIcon"></i></span>
												</div>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.address"/></label>
											<div class="col-md-10">
												<input type="text" class="form-control" id="address" name="address" value="<c:out value='${customer.address}'/>">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.joinDate"/></label>
											<div class="col-md-10 input-group">
												<input type="text" class="form-control" id="joinDate" name="joinDate" value="<c:out value='${customer.joinDate}'/>">
												<div class="input-group-append">
													<span class="input-group-text bg-custom text-white b-0"><i class="mdi mdi-calendar"></i></span>
												</div>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.membershipLevel"/></label>
											<div class="col-md-10">
	                                            <select class="form-control" id="membershipLevel" name="membershipLevel">
	                                            <c:forEach var="item" items="${membershipLvList}">
                                                    <option value="<c:out value='${item.codeId }'/>" <c:if test='${item.codeId eq customer.membershipLevel}'>selected</c:if> ><c:out value='${item.codeName}'/></option>
												</c:forEach>
	                                            </select>
											</div>
										</div>
									</div>
								</div>									
									
								<div class="row">
									<div class="col-md-12">									
										<div class="form-group row">
											<label class="col-md-1 control-label"><spring:message code="customer.visitPath"/></label>
											<div class="col-md-11 radio radio-warning m-t-0">
												<c:forEach var="item" items="${visitPathList}">
			                                    <label class="m-r-10 w-xlg">
            			                            <input type="radio" name="visitPath" value="<c:out value='${item.codeId}'/>" <c:if test='${item.codeId eq customer.visitPath}'>checked</c:if> >
                        			                <span class="cr"><i class="cr-icon mdi mdi-checkbox-blank-circle"></i></span>
                                        			<c:out value='${item.codeName}'/>
												</label>
												</c:forEach>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-1 control-label"><spring:message code="customer.interests"/></label>
											<div class="col-md-11 checkbox checkbox-warning m-t-0">
												<c:forEach var="item" items="${interestsList}">
			                                    <label class="m-r-10 w-xlg">
			                                        <input type="checkbox" name="interests" value="<c:out value='${item.codeId}'/>" <c:if test='${fn:contains(customer.interests, item.codeId)}'>checked</c:if> >
			                                        <span class="cr"><i class="cr-icon fa fa-check"></i></span>
													<c:out value='${item.codeName}'/>
			                                    </label>
			                                    </c:forEach>
											</div>
										</div>
                                        
                                    </div> <!-- end col -->
                                </div>
                                <!-- end row -->

                            </div>
                        </div>
                    </div><!-- end col -->
                </div>
                <!-- end row -->

                <div class="row">
                    
                    <div class="col-md-12">
                        <div class="card card-border card-warning">
                            <div class="card-heading">
                            	<h4 class="m-t-0 header-title"><b><spring:message code="customer.detailInformation"/></b></h4>
                            </div>
                        
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.skinType"/></label>
											<div class="col-md-10 radio radio-warning m-t-0">
												<c:forEach var="item" items="${skinTypeList}">
			                                    <label class="m-r-10 w-xlg">
            			                            <input type="radio" name="skinType" value="<c:out value='${item.codeId}'/>" <c:if test='${item.codeId eq customer.skinType}'>checked</c:if> >
                        			                <span class="cr"><i class="cr-icon mdi mdi-checkbox-blank-circle"></i></span>
                                        			<c:out value='${item.codeName}'/>
												</label>
												</c:forEach>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.pregnant"/></label>
											<div class="col-md-10 radio radio-warning m-t-0">
			                                    <label class="m-r-10 w-xlg">
			                                        <input type="radio" name="pregnant" value="N" <c:if test='${customer.pregnant eq "N"}'>checked</c:if> >
			                                        <span class="cr"><i class="cr-icon mdi mdi-checkbox-blank-circle"></i></span>
													<spring:message code="customer.none"/>
			                                    </label>
			                                    <label class="m-r-10 w-xlg">
			                                        <input type="radio" name="pregnant" value="Y" <c:if test='${customer.pregnant eq "Y"}'>checked</c:if> >
			                                        <span class="cr"><i class="cr-icon mdi mdi-checkbox-blank-circle"></i></span>
													<spring:message code="customer.exist"/>
			                                    </label>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.manageExperience"/></label>
											<div class="col-md-10 radio radio-warning m-t-0">
			                                    <label class="m-r-10 w-xlg">
			                                        <input type="radio" name="manageExperience" value="N" <c:if test='${customer.manageExperience eq "N"}'>checked</c:if> >
			                                        <span class="cr"><i class="cr-icon mdi mdi-checkbox-blank-circle"></i></span>
													<spring:message code="customer.none"/>
			                                    </label>
			                                    <label class="m-r-10 w-xlg">
			                                        <input type="radio" name="manageExperience" value="Y" <c:if test='${customer.manageExperience eq "Y"}'>checked</c:if> >
			                                        <span class="cr"><i class="cr-icon mdi mdi-checkbox-blank-circle"></i></span>
													<spring:message code="customer.exist"/>
			                                    </label>			                                    
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label">매장</label>
											<div class="col-md-10">
												<input type="text" class="form-control" id="otherStoreName" name="otherStoreName" value="<c:out value='${customer.otherStoreName}'/>" <c:if test='${empty customer.manageExperience || customer.manageExperience eq "N"}'>readonly</c:if> >
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label">프로그램</label>
											<div class="col-md-10">
												<input type="text" class="form-control" id="otherStoreProgram" name="otherStoreProgram" value="<c:out value='${customer.otherStoreProgram}'/>" <c:if test='${empty customer.manageExperience || customer.manageExperience eq "N"}'>readonly</c:if> >
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.skinProblem"/></label>
											<div class="col-md-10 checkbox checkbox-warning m-t-0">
												<c:forEach var="item" items="${skinProblemList}">
			                                    <label class="m-r-10 w-xlg">
			                                        <input type="checkbox" name="skinProblems" value="<c:out value='${item.codeId}'/>" <c:if test='${fn:contains(customer.skinProblems, item.codeId)}'>checked</c:if> >
			                                        <span class="cr"><i class="cr-icon fa fa-check"></i></span>
			                                        <c:out value="${item.codeName}"/>
			                                    </label>
			                                    </c:forEach>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.problemOccurTime"/></label>
											<div class="col-md-10 checkbox checkbox-warning m-t-0">
												<c:forEach var="item" items="${skinOcrTimeList}">
			                                    <label class="m-r-10 w-xlg">
			                                        <input type="checkbox" name="problemOccurTime" value="<c:out value='${item.codeId}'/>" <c:if test='${fn:contains(customer.problemOccurTime, item.codeId)}'>checked</c:if> >
			                                        <span class="cr"><i class="cr-icon fa fa-check"></i></span>
													<c:out value="${item.codeName}"/>
			                                    </label>
			                                    </c:forEach>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.pimpleOccurPoint"/></label>
											<div class="col-md-10 checkbox checkbox-warning m-t-0">
												<c:forEach var="item" items="${pimpleList}">
			                                    <label class="m-r-10 w-xlg">
			                                        <input type="checkbox" name="pimpleOccurPoint" value="<c:out value='${item.codeId}'/>" <c:if test='${fn:contains(customer.pimpleOccurPoint, item.codeId)}'>checked</c:if> >
			                                        <span class="cr"><i class="cr-icon fa fa-check"></i></span>
													<c:out value="${item.codeName}"/>
			                                    </label>
			                                    </c:forEach>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.troubleOccurTime"/></label>
											<div class="col-md-10 checkbox checkbox-warning m-t-0">
												<c:forEach var="item" items="${tbOcrTimeList}">
			                                    <label class="m-r-10 w-xlg">
			                                        <input type="checkbox" name="troubleOccurTime" value="<c:out value='${item.codeId}'/>" <c:if test='${fn:contains(customer.troubleOccurTime, item.codeId)}'>checked</c:if> >
			                                        <span class="cr"><i class="cr-icon fa fa-check"></i></span>
													<c:out value="${item.codeName}"/>
			                                    </label>
			                                    </c:forEach>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.allergy"/></label>
											<div class="col-md-10 checkbox checkbox-warning m-t-0">
												<c:forEach var="item" items="${allergyList}">
			                                    <label class="m-r-10 w-xlg">
			                                        <input type="checkbox" name="allergy" value="<c:out value='${item.codeId}'/>" <c:if test='${fn:contains(customer.allergy, item.codeId)}'>checked</c:if> >
			                                        <span class="cr"><i class="cr-icon fa fa-check"></i></span>
													<c:out value="${item.codeName}"/>
			                                    </label>
			                                    </c:forEach>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label">알레르기 명</label>
											<div class="col-md-10">
												<input type="text" class="form-control" id="allergyName" name="allergyName" value="<c:out value='${customer.allergyName}'/>" <c:if test='${empty customer.allergy || not fn:contains("ALG0099", item.codeId)}'>readonly</c:if> >
											</div>
										</div>										
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.intensity"/></label>
											<div class="col-md-10 radio radio-warning m-t-0">
												<c:forEach var="item" items="${intensityList}">
			                                    <label class="m-r-10 w-xlg">
            			                            <input type="radio" name="intensity" value="<c:out value='${item.codeId}'/>" <c:if test='${item.codeId eq customer.intensity}'>checked</c:if> >
                        			                <span class="cr"><i class="cr-icon mdi mdi-checkbox-blank-circle"></i></span>
                                        			<c:out value='${item.codeName}'/>
												</label>
												</c:forEach>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-md-2 control-label"><spring:message code="customer.etc"/></label>
											<div class="col-md-10">
												<textarea class="form-control" id="etc" name="etc" rows="5"><c:out value='${customer.etc}'/></textarea>
											</div>
										</div>
                                    </div>
                                </div>
                                <div>
                                	<button type="button" id="listBtn" class="btn btn-danger waves-effect waves-light m-t-20 m-r-10 float-right"><spring:message code="button.list"/></button>
                                	<button type="button" id="modifyBtn" class="btn btn-warning waves-effect waves-light m-t-20 m-r-10 float-right"><spring:message code="button.modify"/></button>                                	
                                </div>
                            </div>
                        </div>
                    </div> <!-- end col -->
                </div>
                <!-- end row -->
                </form>

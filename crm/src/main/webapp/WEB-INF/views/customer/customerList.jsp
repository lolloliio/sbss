<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script>
    $(document).ready(function () {
    	
    	//데이터 조회
	    var table = $("#customerTable").DataTable({
			"serverSide": true,
			"processing": true,
			"searching": true,
			"destroy": true,
	        "language" : {
	            "url" : "<c:url value='/resources/js/Korean.json'/>"
	        },
			"order" : [[ 1, "desc" ]],
	        ajax: {
				"type" : "POST",
				"url" : "<c:url value='/customer/selectCustomerList'/>",
			    "data" : function (data) {
					return JSON.stringify(data);
				},
				"dataType": "json",
				"contentType": "application/json; charset=utf-8",
				"dataSrc": "data"
	        },
	        columns: [
	        	{ data: "customerId", "visible": false},
	        	{ data: "chartId"},
	        	{ data: "customerName" },
	        	{ data: "cellphoneNumber" },
	        	{ data: "membershipLevelName" },
	        	{ data: "joinDate" },
	        	{ data: "birthday" },
	        ],
	        columnDefs: [
	        	{ targets: [2], className: 'dt-head-center dt-body-left'},
	        	{ targets: [1,3,4,5,6], className: 'dt-head-center dt-body-center'},
	        	{ targets: 0, width: "0%" },
	            { targets: 1, width: "10%" },
	            { targets: 2, width: "40%" },
	            { targets: 3, width: "15%" },
	            { targets: 4, width: "15%" },
	            { targets: 5, width: "10%" },
	            { targets: 6, width: "10%" },
			],
	    });
    	
	    $('#customerTable tbody').on('click', 'td', function (e) {
            var tdIndex = this.cellIndex;
            if (tdIndex != 0){
    	        var rowData = table.row($(this).closest('tr')).data();
				$("#customerId").val(rowData.customerId);
				$("#customerName").val(rowData.customerName);
	        	$("#listForm").submit();
            }
    	});
	    
	    $("#regBtn").click( function() {
	    	location.href = "<c:url value='/customer/customerRegistration'/>";
	    });
    });
        
</script>

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            <ol class="breadcrumb float-right p-0 m-0">
                                <li><a href="#"><spring:message code="customer.manageCustomer"/></a></li>
                                <li class="active"><spring:message code="customer.manageCustomer"/></li>
                            </ol>
                            <h4 class="page-title m-0"><spring:message code="customer.manageCustomer"/></h4>
                        </div>

                    </div>
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-border card-warning">
                            <div class="card-heading"></div>
                            <div class="card-body table-responsive">

                                <table id="customerTable"
                                        class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                    <tr>
                                    	<th><spring:message code="customer.customerId"/></th>
                                        <th><spring:message code="customer.rowNumber"/></th>
                                        <th><spring:message code="customer.name"/></th>
                                        <th><spring:message code="customer.cellphoneNumber"/></th>
                                        <th><spring:message code="customer.membershipLevel"/></th>
                                        <th><spring:message code="customer.joinDate"/></th>
                                        <th>금일생일</th>
                                    </tr>
                                    </thead>
                                </table>
                                <button type="button" id="regBtn" class="btn btn-warning waves-effect waves-light m-t-20 float-right"><spring:message code="button.reg"/></button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <form id="listForm" name="listForm" method="post" action="<c:url value='/customer/customerInformation'/>">
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                	<input type="hidden" id="customerId" name="customerId" value="0"/>
                	<input type="hidden" id="customerName" name="customerName" value=""/>
                </form>
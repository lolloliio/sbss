<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
    $(document).ready(function () {
    	
    	//데이터 조회
	    var table = $("#bookingTable").DataTable({
			"serverSide": true,
			"processing": true,
			"searching": false,
	        "language" : {
	            "url" : "<c:url value='/resources/js/Korean.json'/>"
	        },
			"order" : [[ 4, "desc" ],[5, "desc"]],
	        ajax: {
				"type" : "POST",
				"url" : "<c:url value='/booking/selectBookingList'/>",
			    "data" : function (data) {
					return JSON.stringify(data);
				},
				"dataType": "json",
				"contentType": "application/json; charset=utf-8",
				"dataSrc": "data"
	        },
	        columns: [
	        	{ data: "bookingId", "visible": false},
	        	{ data: "rnum" },
	        	{ data: "customerName" },
	        	{ data: "cellphoneNumber" },
	        	{ data: "bookingDate" },
	        	{ data: "bookingTime" },	        	
	        	{ data: "confirmDate" },
	        	{ data: "confirmTime" },
	        	{ data: "bookingStatusName" },
	        ],
	        columnDefs: [
	        	{ targets: [1,2,3,4,5,6,7,8], className: 'dt-head-center'},
	        	{ width: "0%", targets: 0 },
	            { width: "10%", targets: 1, className: 'dt-body-center' },
	            { width: "20%", targets: 2, className: 'dt-body-left' },
	            { width: "13%", targets: 3, className: 'dt-body-center' },
	            { width: "12%", targets: 4, className: 'dt-body-center' },
	            { width: "10%", targets: 5, className: 'dt-body-center' },
	            { width: "12%", targets: 6, className: 'dt-body-center' },
	            { width: "10%", targets: 7, className: 'dt-body-center' },
	            { width: "10%", targets: 8, className: 'dt-body-center' },
			],
	    });
	    
	    $('#bookingTable tbody').on('click', 'td', function (e) {
            var tdIndex = this.cellIndex;
            if (tdIndex != 0){
    	        var rowData = table.row($(this).closest('tr')).data();
				$("#bookingId").val(rowData.bookingId);
	        	$("#listForm").submit();
            }
    	});	    
    	
	    $("#regBtn").click( function() {
	    	location.href = "<c:url value='/booking/bookingRegistration'/>";
	    });
    });
        
</script>

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            <ol class="breadcrumb float-right p-0 m-0">
                                <li><a href="#"><spring:message code="booking.manageBooking"/></a></li>
                                <li class="active">예약 관리</li>
                            </ol>
                            <h4 class="page-title m-0">예약 관리</h4>
                        </div>

                    </div>
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-border card-warning">
                            <div class="card-heading"></div>
                            <div class="card-body table-responsive">

                                <table id="bookingTable"
                                        class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                    <tr>
                                    	<th><spring:message code="booking.bookingId"/></th>
                                    	<th>번호</th>
                                        <th><spring:message code="booking.customerName"/></th>
                                        <th><spring:message code="booking.cellphoneNumber"/></th>
                                        <th><spring:message code="booking.bookingDate"/></th>
                                        <th><spring:message code="booking.bookingTime"/></th>
                                        <th><spring:message code="booking.confirmDate"/></th>
                                        <th><spring:message code="booking.confirmTime"/></th>
                                        <th><spring:message code="booking.status"/></th>
                                    </tr>
                                    </thead>
                                </table>                                
                                <button type="button" id="regBtn" class="btn btn-warning waves-effect waves-light m-t-20 float-right"><spring:message code="button.reg"/></button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <form id="listForm" name="listForm" method="post" action="<c:url value='/booking/bookingInformation'/>">
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                	<input type="hidden" id="bookingId" name="bookingId" value="0"/>
                </form>
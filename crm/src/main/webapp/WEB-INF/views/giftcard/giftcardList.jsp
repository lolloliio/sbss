<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>

	var initTable = false;

    $(document).ready(function () {
    	
    	//데이터 조회
	    var table = $("#giftcardTable").DataTable({
			"serverSide": true,
			"processing": true,
			"searching": false,
			"destroy": true,
	        "language" : {
	            "url" : "<c:url value='/resources/js/Korean.json'/>"
	        },
			"order" : [[ 5, "desc" ]],
	        ajax: {
				"type" : "POST",
				"url" : "<c:url value='/giftcard/selectGiftcardList'/>",
			    "data" : function (data) {
					return JSON.stringify(data);
				},
				"dataType": "json",
				"contentType": "application/json; charset=utf-8",
				"dataSrc": "data"
	        },
	        columns: [
	        	{ data: "giftcardId", visible:false },
	        	{ data: "rnum" },
	        	{ data: "customerId", visible:false },
	        	{ data: "customerName" },
	        	{ data: "giftcardAmount"},
	        	{ data: "updateDate" },
	        ],
	        columnDefs: [
	        	{ targets: [1,3,4,5], className: 'dt-head-center'},
	        	{ width: "0%", targets: 0 },
	            { width: "20%", targets: 1, className: 'dt-body-center' },
	            { width: "0%", targets: 2 },
	            { width: "40%", targets: 3, className: 'dt-body-left' },
	            { width: "20%", targets: 4, className: 'dt-body-right' },
	            { width: "20%", targets: 5, className: 'dt-body-center' },
			],
	    });
    	
	    $('#giftcardTable tbody').on('click', 'td', function (e) {
            var tdIndex = this.cellIndex;
            var rowData = table.row($(this).closest('tr')).data();
            if (tdIndex != 0){    	        
    	        $("#listForm").attr("action", "<c:url value='/giftcard/giftcardHistoryList'/>");
    	        $("#giftcardId").val(rowData.giftcardId);
    	        $("#customerId").val(rowData.customerId);
    	        $("#customerName").val(rowData.customerName);
	        	$("#listForm").submit();
            }
    	});
	    
	    $('#regBtn').click(function(){
    		if(!initTable){
    			fn_customerList();
    		}    		
    		new Custombox.modal({
				content: {
					effect: 'fadein',
					target: '#con-close-modal'
				}    		
			}).open();
	    });	    
    	
    	$('.close').on('click', function (){
    		Custombox.modal.close();
    	});
	    
    });
    
	function fn_customerList(){
		initTable = true;    		
		//데이터 조회
	    table = $("#customerTable").DataTable({
			"serverSide": true,
			"processing": true,
			"searching": true,
			"lengthChange": false,
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
	        	{ data: "chartId" },
	        	{ data: "customerName" },
	        	{ data: "cellphoneNumber" },
	        	{ data: "franchiseeId", "visible": false},
	        	{ data: "franchiseeName", "visible": false},
	        ]
	    });
		
	    $('#customerTable tbody').on('click', 'td', function (e) {
            var tdIndex = this.cellIndex;
            if (tdIndex != 0){
       	        var rowData = table.row($(this).closest('tr')).data();
    	        $("#listForm").attr("action", "<c:url value='/giftcard/giftcardHistoryList'/>");
    	        $("#customerId").val(rowData.customerId);
    	        $("#customerName").val(rowData.customerName);
	        	$("#listForm").submit();
            }
    	});
	}    
        
</script>

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            <ol class="breadcrumb float-right p-0 m-0">
                                <li><a href="#"><spring:message code="gift.manageGiftcard"/></a></li>
                                <li class="active"><spring:message code="gift.customerGiftcard"/></li>
                            </ol>
                            <h4 class="page-title m-0"><spring:message code="gift.customerGiftcard"/></h4>
                        </div>

                    </div>
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-border card-warning">
                            <div class="card-heading"></div>
                            <div class="card-body table-responsive">

                                <table id="giftcardTable"
                                        class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                    <tr>
                                    	<th><spring:message code="gift.giftcardId"/></th>
                                    	<th><spring:message code="gift.rowNumber"/></th>
                                    	<th><spring:message code="gift.customerId"/></th>
                                        <th><spring:message code="gift.customerName"/></th>
                                        <th><spring:message code="gift.amount"/></th>
                                        <th><spring:message code="gift.lastUpdateDate"/></th>
                                    </tr>
                                    </thead>
                                </table>
                                
				                <div class="row">
				                	<div class="col-lg-12">
										<button type="button" id="regBtn" class="btn btn-warning waves-effect waves-light m-t-20 m-r-10 float-right"><spring:message code="button.reg"/></button>
                                	</div>
				                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
                
                <div id="con-close-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog" style="width:800px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title mt-0">고객 정보</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <table id="customerTable"
                                        class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                    <tr>
                                    	<th><spring:message code="booking.customerId"/></th>
                                        <th><spring:message code="booking.number"/></th>
                                        <th><spring:message code="booking.name"/></th>
                                        <th><spring:message code="booking.cellphoneNumber"/></th>
                                        <th><spring:message code="booking.franchiseeId"/></th>
                                        <th><spring:message code="booking.franchiseeName"/></th>
                                    </tr>
                                    </thead>
                                </table>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal" onclick="Custombox.modal.close();">닫기</button>                                
                            </div>
                        </div>
                    </div>
                </div><!-- /.modal -->                
                
                <form id="listForm" name="listForm" method="post" action="">
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                	<input type="hidden" id="giftcardId" name="giftcardId" value="0"/>
                	<input type="hidden" id="customerId" name="customerId" value="0"/>
                	<input type="hidden" id="customerName" name="customerName" value=""/>
                </form>
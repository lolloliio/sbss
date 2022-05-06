<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
    $(document).ready(function () {
    	
    	//데이터 조회
	    var table = $("#skincareTable").DataTable({
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
				"url" : "<c:url value='/skincare/selectSkincareList'/>",
			    "data" : function (data) {
					return JSON.stringify(data);
				},
				"dataType": "json",
				"contentType": "application/json; charset=utf-8",
				"dataSrc": "data"
	        },
	        columns: [
	        	{ data: "skincareId"},
	        	{ data: "customerId" },
	        	{ data: "customerName" },
	        	{ data: "createDate"},
	        	{ data: "programName" },
	        	{ data: "paidAmount" },
	        	{ data: "unpaidAmount" },
	        	{ data: "totalCycle" },
	        	{ data: "skincareStatus" }
	        ]
	    });
    	
	    $('#skincareTable tbody').on('click', 'td', function (e) {
            var tdIndex = this.cellIndex;
            if (tdIndex != 0){
    	        var rowData = table.row($(this).closest('tr')).data();
				$("#customerId").val(rowData.skincareId);
				$("#skincare").val(rowData.skincareId);
	        	$("#listForm").submit();
            }
    	});
	    
    });
        
</script>

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            <ol class="breadcrumb float-right p-0 m-0">
                                <li><a href="#">피부 관리</a></li>
                                <li class="active">피부 관리 목록</li>
                            </ol>
                            <h4 class="page-title m-0">피부 관리 목록</h4>
                        </div>

                    </div>
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-border card-warning">
                            <div class="card-heading"></div>
                            <div class="card-body table-responsive">

                                <table id="skincareTable"
                                        class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                    <tr>
                                    	<th>번호</th>
                                    	<th>고객 아이디</th>
                                        <th>고객명</th>                                    
                                        <th>관리프로그램</th>
                                        <th>등록일자</th>
                                        <th>결제금액</th>
                                        <th>미수금액</th>
                                        <th>회차</th>
                                        <th>상태</th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
                <form id="listForm" name="listForm" method="post" action="<c:url value='/customer/customerInformation'/>">
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                	<input type="hidden" id="skincareId" name="skincareId" value="0"/>
                </form>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>

	var table;

    $(document).ready(function () {
    	
    	//데이터 조회
		table = $("#productTable").DataTable({
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
				"url" : "<c:url value='/product/selectProductList'/>",
			    "data" : function (data) {
					return JSON.stringify(data);
				},
				"dataType": "json",
				"contentType": "application/json; charset=utf-8",
				"dataSrc": "data"
	        },
	        columns: [
	        	{ data: "productId", "visible": false },
	        	{ data: "rnum" },
	        	{ data: "productType", "visible" : false },
	        	{ data: "productTypeName" },
	        	{ data: "productName" },
	        	{ data: "price" },
	        	{ data: "useStatus", "visible": false },
	        	{ data: "useStatusName" },
	        	{ data: "memo", "visible": false },
	        ],
	        columnDefs: [
	        	{ targets: [4], className: 'dt-head-center dt-body-left'},
	        	{ targets: [1,3,7], className: 'dt-head-center dt-body-center'},
	        	{ targets: [5], className: 'dt-head-center dt-body-right'},
	        	{ targets: 0, width: "0%" },
	            { targets: 1, width: "10%" },
	            { targets: 2, width: "0%" },
	            { targets: 3, width: "20%" },
	            { targets: 4, width: "50%" },
	            { targets: 5, width: "10%" },
	            { targets: 6, width: "0%" },
	            { targets: 7, width: "10%" },
	            { targets: 8, width: "0%" },
			],
	    });
    	
	    $('#productTable tbody').on('click', 'td', function (e) {
            var tdIndex = this.cellIndex;
            if (tdIndex != 0){
    	        var rowData = table.row($(this).closest('tr')).data();
    	   		$("#rnum").html(rowData.rnum);
    	   		$("#productId").val(rowData.productId);
    	   		$("#productName").val(rowData.productName);
    	   		$("#productType").val(rowData.productType);
    	   		$("#price").val(rowData.price);
    	   		$("#memo").val(rowData.memo);
    	   		$("#useStatus").val(rowData.useStatus);
    	   		
    	    	$("#saveBtn").hide();
    			$("#modifyBtn").show();
            }
    	});
	    
	    $('#saveBtn').click(function(){

	    	var productName = $("#productName").val();
	    	var productType = $("#productType").val();
	    	var price = $("#price").val();
	    	var memo = $("#memo").val();
	    	var useStatus = $("#useStatus").val();
	    	
    		$.ajax({
    		    url: '<c:url value="/product/insertProductInformation"/>',
    		    type: 'POST',
				dataType: 'json',
    		    data: {
    		    	productName : productName,
    		    	productType : productType,
    		    	price : price,
    		    	memo : memo,
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

	    	var productId = $("#productId").val();
	    	var productName = $("#productName").val();
	    	var productType = $("#productType").val();
	    	var price = $("#price").val();
	    	var memo = $("#memo").val();
	    	var useStatus = $("#useStatus").val();
	    	
    		$.ajax({
    		    url: '<c:url value="/product/updateProductInformation"/>',
    		    type: 'POST',
				dataType: 'json',
    		    data: {
    		    	productId : productId,
    		    	productName : productName,
    		    	productType : productType,
    		    	price : price,
    		    	memo : memo,    		    	
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
	    	   
    });
    
    function fn_clear(){
    	$("#rnum").html("");
    	$("#productId").val(0);
    	$("#productName").val("");
    	$("#productType").val("");
    	$("#price").val(0);
    	$("#memo").val("");
    	$("#useStatus").val("");
    	
    	$("#saveBtn").show();
		$("#modifyBtn").hide();
    }
        
</script>
			<form data-parsley-validate="">
                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            <ol class="breadcrumb float-right p-0 m-0">
                                <li><a href="#"><spring:message code="program.manageProgram"/></a></li>
                                <li class="active"><spring:message code="product.manageProduct"/></li>
                            </ol>
                            <h4 class="page-title m-0"><spring:message code="product.manageProduct"/></h4>
                        </div>

                    </div>
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-border card-warning">
                            <div class="card-heading"></div>
                            <div class="card-body table-responsive">

								<h5 class="m-t-0 m-b-20 font-600"><spring:message code="product.productList"/></h5>

                                <table id="productTable"
                                        class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                    <tr>
                                    	<th><spring:message code="product.productId"/></th>
                                        <th><spring:message code="product.rowNumber"/></th>
                                        <th><spring:message code="product.productTypeCode"/></th>
                                        <th><spring:message code="product.productType"/></th>
                                        <th><spring:message code="product.productName"/></th>
                                        <th><spring:message code="product.price"/></th>
                                        <th><spring:message code="product.useStatusCode"/></th>
                                        <th><spring:message code="product.useStatus"/></th>
                                        <th><spring:message code="product.memo"/></th>
                                    </tr>
                                    </thead>
                                </table>
                                
								<h5 class="m-t-30 m-b-20 font-600"><spring:message code="product.productDetail"/></h5>                                
                                
								<div class="row">
									<div class="col-sm-12">
				                        <div class="card card-border">
				                            <div class="card-body">
								                <div class="row">
								                	<div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-2 control-label"><spring:message code="product.rowNumber"/></label>
															<div class="col-md-10">
																<span id="rnum"></span>
																<input type="hidden" id="productId" name="productId" value="0"/>
															</div>
														</div>
								                	</div>
												</div>
												<div class="row">
								                	<div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-2 control-label"><spring:message code="product.productType"/><span class="text-danger">*</span></label>
															<div class="col-md-10">
					                                            <select class="form-control" id="productType" name="productType">
					                                            	<option value=""><spring:message code='common.select'/></option>
																<c:forEach var="item" items="${productTypeList}">
				                                                    <option value="<c:out value='${item.codeId}'/>" ><c:out value='${item.codeName}'/></option>
																</c:forEach>
					                                            </select>
															</div>
														</div>
								                	</div>
												</div>
												<div class="row">
								                	<div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-2 control-label"><spring:message code="product.productName"/><span class="text-danger">*</span></label>
															<div class="col-md-10">
																<input type="text" class="form-control" id="productName" name="productName" value="" required="" />
															</div>
														</div>
								                	</div>
								                </div>
								                <div class="row">
								                	<div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-2 control-label"><spring:message code="product.price"/><span class="text-danger">*</span></label>
															<div class="col-md-10">
																<input type="text" class="form-control" id="price" name="price" value="" required="" />
															</div>
														</div>
								                	</div>				                
								                </div>
								                <div class="row">
								                	<div class="col-lg-12">
														<div class="form-group row">
															<label class="col-md-2 control-label"><spring:message code="product.memo"/></label>
															<div class="col-md-10">
																<textarea class="form-control" id="memo" name="memo" rows="5"></textarea>
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
										<button type="button" id="modifyBtn" class="btn btn-danger waves-effect waves-light m-r-10 float-right" style="display:none"><spring:message code="button.modify"/></button>
                                		<button type="button" id="saveBtn" class="btn btn-danger waves-effect waves-light m-r-10 float-right"><spring:message code="button.save"/></button>
                                		<button type="button" id="clearBtn" class="btn btn-warning waves-effect waves-light m-r-10 float-right"><spring:message code="button.clear"/></button>
                                	</div>
				                </div>
                            </div>
						</div>
					</div>
				</div>
			</form>
                
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!doctype html>
<html lang="ko">
 
    <head>
        <meta charset="utf-8" />
        <title><spring:message code="main.title"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="format-detection" content="telephone=no"/>

        <!-- App favicon -->
        <%-- <link rel="shortcut icon" href="<c:url value='/resources/images/favicon.ico'/>"> --%>

        <!-- App css -->
        <link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value='/resources/css/icons.css'/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet" type="text/css" />
        
        <script src="<c:url value='/resources/js/common.js'/>"></script>
        <script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
        
        <!-- Sweet Alert -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.33.1/sweetalert2.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.33.1/sweetalert2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script>
        
        <!-- Plugins css-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.9/css/bootstrap-select.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.9/js/bootstrap-select.js"></script>
        
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/locales/bootstrap-datepicker.ko.min.js"></script>
        
        <link href="https://cdnjs.cloudflare.com/ajax/libs/clockpicker/0.0.7/bootstrap-clockpicker.min.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/clockpicker/0.0.7/bootstrap-clockpicker.min.js"></script>
		
		<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
		<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script> 
		<script src="https://cdn.datatables.net/plug-ins/1.10.19/api/fnFilterClear.js"></script>
		
        <!-- DataTables -->
        <link href="<c:url value='/resources/plugins/datatables/jquery.dataTables.min.css'/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value='/resources/plugins/datatables/buttons.bootstrap4.min.css'/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value='/resources/plugins/datatables/fixedHeader.bootstrap4.min.css'/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value='/resources/plugins/datatables/responsive.bootstrap4.min.css'/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value='/resources/plugins/datatables/scroller.bootstrap4.min.css'/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value='/resources/plugins/datatables/dataTables.colVis.css'/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value='/resources/plugins/datatables/dataTables.bootstrap4.min.css'/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value='/resources/plugins/datatables/fixedColumns.dataTables.min.css'/>" rel="stylesheet" type="text/css"/>		
		
		<link href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" rel="stylesheet" type="text/css" />
		<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
		
        <!--calendar css-->
        <link href="<c:url value='/resources/js/fullcalendar/core/main.min.css'/>" rel="stylesheet" />
        <script src="<c:url value='/resources/js/fullcalendar/core/main.min.js'/>"></script>
        <link href="<c:url value='/resources/js/fullcalendar/daygrid/main.min.css'/>" rel="stylesheet" />
        <script src="<c:url value='/resources/js/fullcalendar/daygrid/main.min.js'/>"></script>
        <link href="<c:url value='/resources/js/fullcalendar/timegrid/main.min.css'/>" rel="stylesheet" />
        <script src="<c:url value='/resources/js/fullcalendar/timegrid/main.min.js'/>"></script>
        <link href="<c:url value='/resources/js/fullcalendar/list/main.min.css'/>" rel="stylesheet" />
        <script src="<c:url value='/resources/js/fullcalendar/list/main.min.js'/>"></script>                
        <script src="<c:url value='/resources/js/fullcalendar/interaction/main.min.js'/>"></script>
        <script src="<c:url value='/resources/js/fullcalendar/moment/main.min.js'/>"></script>
        <script src="<c:url value='/resources/js/fullcalendar/core/ko.js'/>"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
		
        <link href="https://cdnjs.cloudflare.com/ajax/libs/custombox/4.0.3/custombox.min.css" rel="stylesheet" type="text/css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/custombox/4.0.3/custombox.legacy.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/custombox/4.0.3/custombox.min.js"></script>
        		
        <script>
        
        	$.ajaxSetup({
        		beforeSend:function(xhr){
        			xhr.setRequestHeader("AJAX", true);
        			xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
        		},
        		error:function(xhr, status, error){
        			if(xhr.status == 401){
        	            Swal.fire({
        	            	title : '<spring:message code="error.accessDenied"/>',
    						type: 'error',
    						confirmButtonColor: '#ff9800'
    					}).then(function(){
    						location.href = "<c:url value='/'/>";
    					});        				
        			}else if(xhr.status == 403){
        	            Swal.fire({
        	            	title : '<spring:message code="error.errorAuthorization"/>',
    						type: 'error',
    						confirmButtonColor: '#ff9800'
    					}).then(function(){
    						location.href = "<c:url value='/'/>";
    					});        				
        			}else{
        	            Swal.fire({
        	            	title : '<spring:message code="error.errorOccurred"/>',
    						text: xhr.responseJSON.errorMessage,
    						type: 'error',
    						confirmButtonColor: '#ff9800'
    					});
        			}
        		}
        	});
        
        	function fn_logout(){
				document.logoutForm.submit();
			}
        </script>
        
    </head>
    
<body>

	<tiles:insertAttribute name="header"/>
	
	<div class="wrapper">
		<div class="container-fluid">		
			<tiles:insertAttribute name="content"/>
		</div>
		
		<!-- Footer -->
		<footer class="footer">
			<tiles:insertAttribute name="footer"/>
		</footer>			
		<!-- End Footer -->

	</div>
	<!-- end wrapper -->

	<form name="logoutForm" action="<c:url value='/login/logout'/>" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>

	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/resources/js/waves.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.slimscroll.js'/>"></script>
	
	<!-- Counter js  -->
	<script src="<c:url value='/resources/plugins/waypoints/jquery.waypoints.min.js'/>"></script>
	<script src="<c:url value='/resources/plugins/counterup/jquery.counterup.min.js'/>"></script>	
	
	<!-- App js -->
	<script src="<c:url value='/resources/js/jquery.core.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.app.js'/>"></script>

</body>
 
</html>
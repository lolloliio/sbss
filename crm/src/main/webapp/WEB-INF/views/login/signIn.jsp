<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <!-- App favicon -->
        <link rel="shortcut icon" href="<c:url value='/resources/images/favicon.ico'/>">

        <!-- App css -->
        <link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value='/resources/css/icons.css'/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet" type="text/css" />

        <!-- Sweet Alert -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.33.1/sweetalert2.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.33.1/sweetalert2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script>

        <script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
        <script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>

        <script src="<c:url value='/resources/js/modernizr.min.js'/>"></script>
		<script>
			var errorMsg = '<c:out value="${errorMsg}"/>';
	    	$(document).ready(function () {
	    		if(errorMsg != ""){
	            	Swal.fire({
           			  type: 'error',
           			  text: errorMsg,
           			  showConfirmButton: false,
           			  timer: 2000
	            	});
	    		}
	    	});
		</script>
	
    </head>

    <body class="bg-transparent">

    <!-- HOME -->
    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">

                    <div class="wrapper-page">

                        <div class="m-t-40 account-pages">
                            <div class="text-center account-logo-box">
                                <h2 class="text-uppercase">
                                    <a href="index.html" class="text-success">
                                        <span><img src="<c:url value='/resources/images/sbss_logo2.png'/>" alt="" height="80"></span>
                                    </a>
                                </h2>
                                <!--<h4 class="text-uppercase font-bold m-b-0">Sign In</h4>-->
                            </div>
                            <div class="account-content">
                                <form class="form-horizontal" action="<c:url value='login'/>" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <div class="form-group m-b-25">
                                        <div class="col-12">
                                            <label for="emailaddress">이메일 주소</label>
                                            <input class="form-control input-lg" type="email" id="emailaddress" name="email" value="<c:out value='${email}'/>" required="" placeholder="john@naver.com">
                                        </div>
                                    </div>

                                    <div class="form-group m-b-25">
                                        <div class="col-12">
                                            <a href="page-recoverpw.html" class="text-muted float-right" tabindex="-1">비밀번호를 잃어버렸습니까?</a>
                                            <label for="password">비밀번호</label>
                                            <input class="form-control input-lg" type="password" id="password" name="password" required="" placeholder="비밀번호를 입력해 주세요">
                                        </div>
                                    </div>

                                    <div class="form-group m-b-20">
                                        <div class="col-12">
                                            <div class="checkbox checkbox-custom">
                                                <label>
                                                    <input type="checkbox" id="rememberMe" name="rememberMe" value="Y">
                                                    <span class="cr"><i class="cr-icon fa fa-check"></i></span>
													이메일 주소 저장
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group account-btn text-center m-t-10">
                                        <div class="col-12">
                                            <button class="btn w-lg btn-rounded btn-lg btn-warning waves-effect waves-light" type="submit">로그인</button>
                                        </div>
                                    </div>

                                </form>

                                <div class="clearfix"></div>

                            </div>
                        </div>
                        <!-- end card-box-->


                        <div class="row m-t-50">
                            <div class="col-sm-12 text-center">
                                <p class="text-muted">계정이 없습니까? <a href="<c:url value='/login/signUp'/>" class="text-dark m-l-5">가입하기</a></p>
                            </div>
                        </div>

                    </div>
                    <!-- end wrapper -->

                </div>
            </div>
        </div>
        </section>
        <!-- END HOME -->
    
        <!-- jQuery  -->
        <script src="<c:url value='/resources/js/waves.js'/>"></script>
        <script src="<c:url value='/resources/js/jquery.slimscroll.js'/>"></script>

        <!-- App js -->
        <script src="<c:url value='/resources/js/jquery.core.js'/>"></script>
        <script src="<c:url value='/resources/js/jquery.app.js'/>"></script>

    </body>
    
</html>
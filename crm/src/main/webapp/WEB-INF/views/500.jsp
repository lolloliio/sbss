<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="ko">

    <head>
        <meta charset="utf-8" />
        <title><spring:message code="main.title"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<meta content="sound body sound skin" name="description" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <!-- App favicon -->
        <link rel="shortcut icon" href="<c:url value='/resources/images/favicon.ico'/>">

        <!-- App css -->
        <link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value='/resources/css/icons.css'/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet" type="text/css" />

        <script src="<c:url value='/resources/js/modernizr.min.js'/>"></script>

    </head>


    <body class="bg-transparent">

        <!-- HOME -->
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 text-center">

                        <div class="wrapper-page">
                            <img src="<c:url value='/resources/images/sbss_logo2.png'/>" alt="" height="80">
                            <br/>
                            <img src="<c:url value='/resources/images/icons/globe.svg'/>" alt="globe.svg" height="60" class="m-t-50">
                            <h1 style="font-size: 30px;" class="text-uppercase text-dark m-t-30">일시적 오류가 발생했습니다.</h1>
                            <p class="text-muted m-t-30">서비스 이용에 불편을 끼쳐드려 죄송합니다.<br/>동일한 증상이 반복되는 경우 관리자에게 문의 바랍니다.</p>

                            <a class="btn btn-info waves-effect waves-light m-t-20" href="<c:url value='/'/>">홈으로 이동</a>
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <!-- END HOME -->
    

        <!-- jQuery  -->
        <script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
        <script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
        <script src="<c:url value='/resources/js/waves.js'/>"></script>
        <script src="<c:url value='/resources/js/jquery.slimscroll.js'/>"></script>

        <!-- App js -->
        <script src="<c:url value='/resources/js/jquery.core.js'/>"></script>
        <script src="<c:url value='/resources/js/jquery.app.js'/>"></script>

    </body>
</html>
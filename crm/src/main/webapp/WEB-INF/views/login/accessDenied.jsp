<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!doctype html>
<html lang="ko">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Concept - Bootstrap 4 Admin Dashboard Template</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/vendor/fonts/circular-std/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/vendor/fonts/fontawesome/css/fontawesome-all.css'/>">
</head>

<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper p-0">
        <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
        <nav class="navbar navbar-expand dashboard-top-header bg-white">
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- brand logo -->
                <!-- ============================================================== -->
                <div class="dashboard-nav-brand">
                    <a class="dashboard-logo" href="<c:url value='/'/>">Concept</a>
                </div>
                <!-- ============================================================== -->
                <!-- end brand logo -->
                <!-- ============================================================== -->
            </div>
        </nav>
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="bg-light text-center">
            <div class="container">
                <div class="row">
                    <div class="offset-xl-2 col-xl-8 offset-lg-2 col-lg-8 col-md-12 col-sm-12 col-12">
                        <div class="error-section">
                            <img src="<c:url value='/resources/images/error-img.png'/>" alt="" class="img-fluid">
                            <div class="error-section-content">
                                <h1 class="display-3">Access Denied</h1>
                                <p> The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>
                                <a href="<c:url value='/'/>" class="btn btn-secondary btn-lg">Back to homepage</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <div class="bg-white p-3">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 text-dark text-center">
                            Copyright Â© 2018 Concept. All rights reserved. Dashboard by <a href="https://colorlib.com/wp/">Colorlib</a>.
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- end wrapper -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="<c:url value='/resources/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
    <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.js'/>"></script>
    <script src="<c:url value='/resources/vendor/slimscroll/jquery.slimscroll.js'/>"></script>
    <script src="<c:url value='/resources/js/main-js.js'/>"></script>
</body>
 
</html>
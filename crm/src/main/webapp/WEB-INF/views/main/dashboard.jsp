<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            
                            <ol class="breadcrumb float-right m-0 p-0">
                                <li>
                                    <a href="#">Codefox</a>
                                </li>
                                <!--<li>-->
                                    <!--<a href="#">Dashboard</a>-->
                                <!--</li>-->
                                <li class="active">
                                    Dashboard
                                </li>
                            </ol>
                            <h4 class="page-title m-0">Welcome <sec:authentication property="principal.username"/> !</h4>
                        </div>

                    </div>
                </div>
                <!-- end row -->

                <div class="row">

                    <div class="col-xl-3 col-md-6">
                        <div class="card widget-box-two widget-two-purple">
                            <div class="card-body">
                                <i class="mdi mdi-chart-line widget-two-icon"></i>
                                <div class="wigdet-two-content">
                                    <p class="m-0 text-uppercase text-white font-600 font-secondary text-overflow" title="Statistics">Statistics</p>
                                    <h2 class="text-white"><span data-plugin="counterup">65841</span> <small><i class="mdi mdi-arrow-up text-white"></i></small></h2>
                                    <p class="text-white m-0"><b>10%</b> From previous period</p>
                                </div>
                            </div>
                        </div>
                    </div><!-- end col -->

                    <div class="col-xl-3 col-md-6">
                        <div class="card widget-box-two widget-two-info">
                            <div class="card-body">
                                <i class="mdi mdi-access-point-network widget-two-icon"></i>
                                <div class="wigdet-two-content">
                                    <p class="m-0 text-white text-uppercase font-600 font-secondary text-overflow" title="User Today">User Today</p>
                                    <h2 class="text-white"><span data-plugin="counterup">52142</span> <small><i class="mdi mdi-arrow-up text-white"></i></small></h2>
                                    <p class="text-white m-0"><b>5.6%</b> From previous period</p>
                                </div>
                            </div>
                        </div>
                    </div><!-- end col -->

                        <div class="col-xl-3 col-md-6">
                        <div class="card widget-box-two widget-two-pink">
                            <div class="card-body">
                                <i class="mdi mdi-timetable widget-two-icon"></i>
                                <div class="wigdet-two-content">
                                    <p class="m-0 text-uppercase text-white font-600 font-secondary text-overflow" title="Request Per Minute">Request Per Minute</p>
                                    <h2 class="text-white"><span data-plugin="counterup">2365</span> <small><i class="mdi mdi-arrow-up text-white"></i></small></h2>
                                    <p class="text-white m-0"><b>7.02%</b> From previous period</p>
                                </div>
                            </div>
                        </div>
                    </div><!-- end col -->

                    <div class="col-xl-3 col-md-6">
                        <div class="card widget-box-two widget-two-success">
                            <div class="card-body">
                                <i class="mdi mdi-cloud-download widget-two-icon"></i>
                                <div class="wigdet-two-content">
                                    <p class="m-0 text-white text-uppercase font-600 font-secondary text-overflow" title="New Downloads">New Downloads</p>
                                    <h2 class="text-white"><span data-plugin="counterup">854</span> <small><i class="mdi mdi-arrow-up text-white"></i></small></h2>
                                    <p class="text-white m-0"><b>9.9%</b> From previous period</p>
                                </div>
                            </div>
                        </div>
                    </div><!-- end col -->

                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-xl-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title m-t-0 m-b-30">Last 30 days statistics</h4>

                                <div class="">
                                    <div id="donut-chart" class="ct-chart ct-golden-section dash-chart"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title m-t-0 m-b-30">Total Revenue share</h4>
                                <div>
                                    <div id="combine-chart" class="ct-chart ct-golden-section dash-chart"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title m-t-0 m-b-30">Total Revenue share</h4>
                                <div class="">
                                    <div id="roated-chart" class="ct-chart ct-golden-section dash-chart"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end row -->


                <div class="row">
                    <div class="col-xl-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title m-t-0 m-b-20">Recent Projects</h4>

                                <div class="table-responsive">
                                    <table class="table m-b-0">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Project Name</th>
                                            <th>Start Date</th>
                                            <th>Due Date</th>
                                            <th>Status</th>
                                            <th>Assign</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Codefox Admin v1</td>
                                                <td>01/01/2017</td>
                                                <td>26/04/2017</td>
                                                <td><span class="badge badge-info">Released</span></td>
                                                <td>Coderthemes</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Codefox Frontend v1</td>
                                                <td>01/01/2017</td>
                                                <td>26/04/2017</td>
                                                <td><span class="badge badge-success">Released</span></td>
                                                <td>Coderthemes</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Codefox Admin v1.1</td>
                                                <td>01/05/2017</td>
                                                <td>10/05/2017</td>
                                                <td><span class="badge badge-pink">Pending</span></td>
                                                <td>Coderthemes</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>Codefox Frontend v1.1</td>
                                                <td>01/01/2017</td>
                                                <td>31/05/2017</td>
                                                <td><span class="badge badge-purple">Work in Progress</span></td>
                                                <td>Coderthemes</td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>Codefox Admin v1.3</td>
                                                <td>01/01/2017</td>
                                                <td>31/05/2017</td>
                                                <td><span class="badge badge-warning">Coming soon</span></td>
                                                <td>Coderthemes</td>
                                            </tr>
                                            <tr>
                                                <td>6</td>
                                                <td>Codefox Admin v1</td>
                                                <td>01/01/2017</td>
                                                <td>26/04/2017</td>
                                                <td><span class="badge badge-info">Released</span></td>
                                                <td>Coderthemes</td>
                                            </tr>
                                            <tr>
                                                <td>7</td>
                                                <td>Codefox Frontend v1</td>
                                                <td>01/01/2017</td>
                                                <td>26/04/2017</td>
                                                <td><span class="badge badge-success">Released</span></td>
                                                <td>Coderthemes</td>
                                            </tr>
                                            <tr>
                                                <td>8</td>
                                                <td>Codefox Admin v1.1</td>
                                                <td>01/05/2017</td>
                                                <td>10/05/2017</td>
                                                <td><span class="badge badge-pink">Pending</span></td>
                                                <td>Coderthemes</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card widget-box-three">
                                    <div class="card-body">
                                        <div class="bg-icon float-left">
                                            <i class="fi-server"></i>
                                        </div>
                                        <div class="text-right">
                                            <p class="text-uppercase font-14 m-b-10 font-600">Statistics</p>
                                            <h2 class="m-b-10"><span data-plugin="counterup">2,562</span></h2>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="card widget-box-three">
                                    <div class="card-body">
                                        <div class="bg-icon float-left">
                                            <i class="fi-briefcase"></i>
                                        </div>
                                        <div class="text-right">
                                            <p class="m-b-10 text-uppercase font-14 font-600">User Today</p>
                                            <h2 class="m-b-10"><span data-plugin="counterup">8,542</span></h2>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="card widget-box-three">
                                    <div class="card-body">
                                        <div class="bg-icon float-left">
                                            <i class="fi-inbox"></i>
                                        </div>
                                        <div class="text-right">
                                            <p class="m-b-10 text-uppercase font-14 font-600">Request Per Minute</p>
                                            <h2 class="m-b-10"><span data-plugin="counterup">6,254</span></h2>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="card widget-box-three">
                                    <div class="card-body">
                                        <div class="bg-icon float-left">
                                            <i class="fi-bar-graph-2"></i>
                                        </div>
                                        <div class="text-right">
                                            <p class="m-b-10 text-uppercase font-14 font-600">New Downloads</p>
                                            <h2 class="m-b-10"><span data-plugin="counterup">7,524</span></h2>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="card widget-user">
                                    <div class="card-body">
                                        <div>
                                            <img src="<c:url value='/resources/images/users/avatar-3.jpg'/>" class="img-fluid d-block rounded-circle" alt="user">
                                            <div class="wid-u-info">
                                                <h5 class="m-t-20 m-b-5">Chadengle</h5>
                                                <p class="text-muted m-b-0 font-14">coderthemes@gmail.com</p>
                                                <div class="user-position">
                                                    <span class="text-warning font-secondary">Admin</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="card widget-user">
                                    <div class="card-body">
                                        <img src="<c:url value='/resources/images/users/avatar-2.jpg'/>" class="img-fluid d-block rounded-circle" alt="user">
                                        <div class="wid-u-info">
                                            <h5 class="m-t-20 m-b-5"> Michael Zenaty</h5>
                                            <p class="text-muted m-b-0 font-14">coderthemes@gmail.com</p>
                                            <div class="user-position">
                                                <span class="text-info font-secondary">User</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->
                    </div>
                    <!-- end col -->

                </div>
                <!-- end row -->

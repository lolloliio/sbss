<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!-- Navigation Bar-->
        <header id="topnav">
            <div class="topbar-main navbar m-b-0 b-0">
                <div class="container-fluid">

                    <!-- LOGO -->
                    <div class="topbar-left">
                        <a href="<c:url value='/main/dashboard'/>" class="logo">
                            <img src="<c:url value='/resources/images/sbss_logo3.png'/>" alt="" height="40">                         
                        </a>
                    </div>
                    <!-- End Logo container-->

                    <div class="menu-extras">

                        <!-- Right(Notification) -->
                        <ul class="nav navbar-right list-inline">
                            <li class="d-none d-sm-inline-block list-inline-item">
                                <form role="search" class="app-search">
                                    <input type="text" placeholder="Search..." class="form-control">
                                    <a href=""><i class="fa fa-search"></i></a>
                                </form>
                            </li>
                            <li class="list-inline-item">
                                <div class="dropdown">
									<a href="#" class="right-menu-item dropdown-toggle" data-toggle="dropdown">
										<i class="dripicons-bell"></i>
										<span class="badge badge-pill badge-pink">4</span>
									</a>
	
									<ul class="dropdown-menu dropdown-menu-right dropdown-lg user-list notify-list">
										<li class="list-group notification-list m-b-0">
											<div class="slimscroll">
												<!-- list item-->
												<a href="javascript:void(0);" class="list-group-item">
													<div class="media">
														<div class="media-left p-r-10">
															<em class="fa fa-diamond bg-primary"></em>
														</div>
														<div class="media-body">
															<h5 class="media-heading">A new order has been placed A new order has been placed</h5>
															<p class="m-0">
																There are new settings available
															</p>
														</div>
													</div>
												</a>
	
												<!-- list item-->
												<a href="javascript:void(0);" class="list-group-item">
													<div class="media">
														<div class="media-left p-r-10">
															<em class="fa fa-cog bg-warning"></em>
														</div>
														<div class="media-body">
															<h5 class="media-heading">New settings</h5>
															<p class="m-0">
																There are new settings available
															</p>
														</div>
													</div>
												</a>
	
												<!-- list item-->
												<a href="javascript:void(0);" class="list-group-item">
													<div class="media">
														<div class="media-left p-r-10">
															<em class="fa fa-bell-o bg-custom"></em>
														</div>
														<div class="media-body">
															<h5 class="media-heading">Updates</h5>
															<p class="m-0">
																There are <span class="text-primary font-600">2</span> new updates available
															</p>
														</div>
													</div>
												</a>
	
												<!-- list item-->
												<a href="javascript:void(0);" class="list-group-item">
													<div class="media">
														<div class="media-left p-r-10">
															<em class="fa fa-user-plus bg-danger"></em>
														</div>
														<div class="media-body">
															<h5 class="media-heading">New user registered</h5>
															<p class="m-0">
																You have 10 unread messages
															</p>
														</div>
													</div>
												</a>
	
												<!-- list item-->
												<a href="javascript:void(0);" class="list-group-item">
													<div class="media">
														<div class="media-left p-r-10">
															<em class="fa fa-diamond bg-primary"></em>
														</div>
														<div class="media-body">
															<h5 class="media-heading">A new order has been placed A new order has been placed</h5>
															<p class="m-0">
																There are new settings available
															</p>
														</div>
													</div>
												</a>
	
												<!-- list item-->
												<a href="javascript:void(0);" class="list-group-item">
													<div class="media">
														<div class="media-left p-r-10">
															<em class="fa fa-cog bg-warning"></em>
														</div>
														<div class="media-body">
															<h5 class="media-heading">New settings</h5>
															<p class="m-0">
																There are new settings available
															</p>
														</div>
													</div>
												</a>
											</div>
										</li>
										<!-- end notification list -->
									</ul>
								</div>
                            </li>

                            <li class="dropdown user-box list-inline-item">
                                <a href="" class="dropdown-toggle waves-effect user-link" data-toggle="dropdown" aria-expanded="true">
                                    <img src="<c:url value='/resources/images/users/avatar-1.jpg'/>" alt="user-img" class="rounded-circle user-img">
                                </a>

                                <ul class="dropdown-menu dropdown-menu-right arrow-dropdown-menu arrow-menu-right user-list notify-list">
                                    <li><a href="javascript:void(0)" class="dropdown-item">Profile</a></li>
                                    <li><a href="javascript:void(0)" class="dropdown-item"><span class="badge badge-pill badge-info float-right">4</span>Settings</a></li>
                                    <li><a href="javascript:void(0)" class="dropdown-item">Lock screen</a></li>
                                    <li class="dropdown-divider"></li>
                                    <li><a href="javascript:fn_logout();" class="dropdown-item">Logout</a></li>
                                </ul>
                            </li>

                        </ul>
                        <div class="menu-item">
                            <!-- Mobile menu toggle-->
                            <a class="navbar-toggle">
                                <div class="lines">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </div>
                            </a>
                            <!-- End mobile menu toggle-->
                        </div>
                    </div>

                </div>
            </div>

            <div class="navbar-custom">
                <div class="container-fluid">
                    <div id="navigation">
                        <!-- Navigation Menu-->
                        <ul class="navigation-menu">
                            <li class="has-submenu">
                                <a href="<c:url value='/'/>"><i class="fi-air-play"></i> <span> 메인화면 </span> </a>
                            </li>
                            <li class="has-submenu">
                                <a href="#"><i class="fa fa-address-book-o"></i> <span> 고객 관리 </span> </a>
                                <ul class="submenu">
                                    <li><a href="<c:url value='/customer/customerList'/>">고객 관리</a></li>
                                    <li><a href="<c:url value='/customer/customerRegistration'/>">고객 등록</a></li>
                                </ul>
							</li>
                            <li class="has-submenu">
                                <a href="#"><i class="mdi mdi-book-open-variant"></i> <span> 예약 관리 </span> </a>
                                <ul class="submenu">
                                    <li><a href="<c:url value='/booking/bookingList'/>">예약 관리</a></li>
                                    <li><a href="<c:url value='/booking/bookingCalendar'/>">예약 현황 조회</a></li>
                                </ul>
							</li>
							<li class="has-submenu">
                                <a href="#"><i class="mdi mdi-book-open-variant"></i> <span> 할인 관리 </span> </a>
                                <ul class="submenu">
                                    <li><a href="<c:url value='/point/pointList'/>">포인트 관리</a></li>
                                    <li><a href="<c:url value='/giftcard/giftcardList'/>">기프트카드 관리</a></li>
                                </ul>
							</li>
							<li class="has-submenu">
								<a href="#"><i class="fa fa-skyatlas"></i> <span> 가맹점 관리 </span> </a>
                                <ul class="submenu">
                                    <li><a href="<c:url value='/franchisee/franchiseeList'/>">가맹점 관리</a></li>
                                    <li><a href="<c:url value='/employee/employeeList'/>">직원 관리</a></li>
                                </ul>
							</li>
							<li class="has-submenu">
								<a href="#"><i class="mdi mdi-settings"></i> <span> 코드 관리 </span> </a>
                                <ul class="submenu">
                                	<li><a href="<c:url value='/program/programGroupList'/>">프로그램 그룹 관리</a></li>
									<li><a href="<c:url value='/program/programList'/>">프로그램 관리</a></li>
									<li><a href="<c:url value='/program/programOptionList'/>">프로그램 옵션 관리</a></li>
									<li><a href="<c:url value='/product/productList'/>">상품 관리</a></li>
								</ul>
							</li>
                        </ul>
                        <!-- End navigation menu  -->
                    </div>
                </div>
            </div>
        </header>
        <!-- End Navigation Bar-->
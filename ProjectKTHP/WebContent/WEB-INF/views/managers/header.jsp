<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0">
    <title>Cho thuê phòng trọ, cho thuê nhà trọ, tìm phòng trọ</title>
    <base href="${pageContext.servletContext.contextPath}/">
	<!-- css -->
	<link rel="icon" href="<c:url value ="/resources/images/favicon.ico"/>" />
    <link href="<c:url value="/resources/css/site.min.css"/>" rel='stylesheet' type='text/css'/>
    <link href="<c:url value="/resources/css/select2.min.css"/>" rel='stylesheet' type='text/css'/>
    <link href="<c:url value="/resources/css/select.min.css"/>" rel='stylesheet' type='text/css'/>
    <link href="<c:url value="/resources/css/font-awesome.min.css"/>" rel='stylesheet' type='text/css'/>
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel='stylesheet' type='text/css'/>
    <link href="<c:url value="/resources/css/jquery-ui.min.css"/>" rel='stylesheet' type='text/css'/>
    <link href="<c:url value="/resources/css/upload.min.css"/>" rel='stylesheet' type='text/css'/>
    
    <!-- css -->
    <script src="<c:url value="/resources/js/jquery.min.js"/>" ></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap-growl.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jqueryval.min.js"/>"></script>
    <script src="<c:url value="/resources/js/lazyload.min.js"/>"></script>
    <script src="<c:url value="/resources/js/main.min.js?v=20200305"/>"></script>
    <script src="<c:url value="/resources/js/common.min.js?v=20200305"/>"></script>
    <script src="<c:url value="/resources/js/account.min.js?v=20200305"/>"></script>

		<script src="<c:url value="/resources/js/cityList1.min.js"/>"></script>
        <script src="<c:url value="/resources/js/cityList2.min.js"/>"></script>
        <script src="<c:url value="/resources/js/cityList3.min.js"/>"></script>
        <script src="<c:url value="/resources/js/cityList4.min.js"/>"></script>
        <script src="<c:url value="/resources/js/data.min.js?v=20200305"/>"></script>
        <script src="<c:url value="/resources/js/search_h.min.js?v=20200305"/>"></script>
    
		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=UA-42682349-1"></script>
		<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments);}
		  gtag('js', new Date());
		
		  gtag('config', 'UA-42682349-1');
		</script>
    
</head>
<body>
	<header class="header">
    	<div class="header-mobile visible-xs">
    		<ul>
	            <li>
	                <a href="quan-ly-tin.htm"><i class="fa fa-list"></i><span>Quản lý tin</span></a>
	            </li>
	            <li>
	                <a href="dang-tin.htm"><i class="fa fa-pencil-square-o"></i><span>Đăng tin </span></a>
	            </li>
        	</ul>
		</div>
		<div class="modal right fade" id="mobile_menu" tabindex="-1" role="dialog">
    		<div class="modal-dialog" role="document">
        		<div class="modal-content">
            		<div class="modal-body">
		                <div class="user-area clearfix">
		                    <div class="m-user-ava">
		                        <a href="tai-khoan.htm"><img src= "<c:url value = "/resources/images/default-user-avatar-blue.jpg"/>" ></a>
		                    </div>
		                    <div style="float:left;width:60%; text-align:center">
		                            <div class="user-action">
		                                <a href="tai-khoan.htm">${sessionScope.userInfo.maUser}</a>
		                            </div>
		                        <a href="dang-tin.htm" class="user-post"><strong><i class="fa fa-pencil-square-o"></i> Đăng tin</strong></a>
		                    </div>
		                    <div style="float:right;width:10%">
		
		                    </div>
		                </div>
		                <ul class="navbar-nav">
		                    <li class="mobile-menuhome"><a href="home.htm" rel="nofollow">Trang chủ</a></li>
		                    <li>
		                        <a href="cho-thue-phong-tro.htm" rel="nofollow">Cho thuê phòng trọ</a>
		                    </li>
		                    <li>
		                        <a href="cho-thue-can-ho.htm" rel="nofollow">Cho thuê căn hộ</a>
		                    </li>
		                    <li>
		                        <a href="cho-thue-nha-nguyen-can.htm" rel="nofollow">Nhà nguyên căn</a>
		                    </li>
		                    <li>
		                        <a href="tim-nguoi-o-ghep.htm" rel="nofollow">Tìm người ở ghép</a>
		                    </li>
	                        <li class="mobile-menuhelp"><span>Thông tin tài khoản</span></li>
	                        <li class="current-menu-item">
	                            <a href="tai-khoan.htm"><i class="fa fa-user"></i>Thông tin cá nhân</a>
	                        </li>		                       
	                        <li>
	                            <a href="quan-ly-tin.htm"><i class="fa fa-list-alt"></i>Quản lý tin</a>
	                        </li>

	                        <li>
	                            <a href="thoat.htm" title="Thoát"><i class="fa fa-sign-out" aria-hidden="true"></i> Thoát</a>
	                        </li>
		                </ul>
            		</div>
        		</div>
    		</div>
		</div>
        <div class="navbarTop hidden-xs">
            <div class="container">
                <div class="pull-left">
                </div>
                <div class="pull-right">       
					<div class="user_welcome">
					    <div class="welcome_user_text">Xin chào, <strong><a rel="nofollow" href="tai-khoan.htm" class="text-blue">${sessionScope.userInfo.userName}</a></strong></div>
				        <div class="dropdown user_welcome_dropdown">
				            <button class="btn dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				                Quản lý tài khoản
				                <span class="caret"></span>
				            </button>
				            <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
				                <li>Mã tài khoản: <strong>${sessionScope.userInfo.maUser}</strong></li>
				                <li role="separator" class="divider"></li>
				                <li><a rel="nofollow" href="dang-tin.htm" title="Đăng tin"><i class="fa fa-plus-circle" aria-hidden="true"></i> Đăng tin</a></li>
				                <li><a rel="nofollow" href="quan-ly-tin.htm" title="Quản lý tin"><i class="fa fa-list-alt" aria-hidden="true"></i> Quản lý tin đăng</a></li>
				                <li><a rel="nofollow" href="tai-khoan.htm"><i class="fa fa-user" aria-hidden="true"></i> Thông tin tài khoản</a></li>
				                <li role="separator" class="divider"></li>
				                <li><a rel="nofollow" href="thoat.htm" title="Thoát"><i class="fa fa-sign-out" aria-hidden="true"></i> Thoát</a></li>
				            </ul>
				        </div>
					</div>
                </div>
            </div>
        </div>
        <div class="header-banner">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <div class="logo">
                            <div class="pull-left">
                                <a href="home.htm" rel="home">
                                    <img src=" <c:url value = "resources/images/logo.png?v=20200501"/>" alt="">
                                </a>
                            </div>
                            <div class="navbar navbar-default pull-right">
                                <button type="button" class="navbar-toggle" data-toggle="modal" data-target="#mobile_menu">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-menu hidden-xs">
            <div class="container">
                <nav class="navbar">
					<ul class="navbar-nav">
					    <li class="menu-item-has-children current-menu-item">
					        <a href="home.htm" rel="nofollow">Trang chủ</a>
					    </li>
					    <li class="menu-item-has-children">
					        <a href="cho-thue-phong-tro.htm" rel="nofollow">Cho thuê phòng trọ</a>
					    </li>
					    <li class="menu-item-has-children">
					        <a href="cho-thue-can-ho.htm" rel="nofollow">Cho thuê căn hộ</a>
					    </li>
					    <li class="menu-item-has-children">
					        <a href="cho-thue-nha-nguyen-can.htm" rel="nofollow">Nhà nguyên căn</a>
					    </li>
					    <li class="menu-item-has-children">
					        <a href="tim-nguoi-o-ghep.htm" rel="nofollow">Tìm người ở ghép</a>
					    </li>
					    <li class="menu-item-has-children">
					        <a href="#" rel="nofollow">Hướng dẫn</a>
					    </li>
					    
					    <li>
					        <a href="dang-tin.htm" title="Đăng tin"><i class="fa fa-pencil-square-o"></i>Đăng tin</a>
					    </li>
					</ul>
                </nav>
            </div>
        </div>
    </header>
</body>
</html>
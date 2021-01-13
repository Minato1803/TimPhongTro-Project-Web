<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0">
    <title>Đăng ký tài khoản</title>
    
    <link rel="icon" href="<c:url value ="/resources/images/favicon.ico"/>" />
    <link href="<c:url value="/resources/css/site.min.css"/>" rel='stylesheet' type='text/css'/>
    <link href="<c:url value="/resources/css/select2.min.css"/>" rel='stylesheet' type='text/css'/>
    <link href="<c:url value="/resources/css/select.min.css"/>" rel='stylesheet' type='text/css'/>
    <link href="<c:url value="/resources/css/font-awesome.min.css"/>" rel='stylesheet' type='text/css'/>
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel='stylesheet' type='text/css'/>
    <link href="<c:url value="/resources/css/jquery-ui.min.css"/>" rel='stylesheet' type='text/css'/>
    <link href="<c:url value="/resources/css/upload.min.css"/>" rel='stylesheet' type='text/css'/>
    <link href="<c:url value="/resources/css/style_detail.css"/>" rel='stylesheet' type='text/css'/>
	<link href="<c:url value="/resources/css/select2.css"/>" rel='stylesheet' type='text/css'/>
	<link href="<c:url value="/resources/css/lightslider.css" />" rel='stylesheet' type='text/css'/>
	<link href="<c:url value="/resources/css/lightgallery.css"/>" rel='stylesheet' type='text/css'/>
</head>
<body>
    <header class="header">     
        <div class="navbarTop hidden-xs">
            <div class="container">
                <div class="pull-left">
                </div>
                <div class="pull-right">                
					<div class="user_welcome">
					        <a class="btn btn-login" href="dang-ky.htm" rel="nofollow"><i class="fa fa-user-plus"></i> Đăng ký</a>
					        <a class="btn btn-login" href="dang-nhap.htm" rel="nofollow"><i class="fa fa-sign-in"></i> Đăng nhập</a>
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
                                    <img src="<c:url value ="/resources/images/logo.png?v=20200501"/>" alt="">
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
        <!-- thanh bảng chọn -->
        <div class="header-menu hidden-xs">
            <div class="container">
                <nav class="navbar">                 
					<ul class="navbar-nav">
					    <li class="menu-item-has-children">
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
    <!-- trang hiển thị chính -->
    <div class="container">
		<div class="access_page">
    		<div class="page_header">
        		<h1 class="page_title">Đăng ký tài khoản</h1>
        		<hr />
    		</div>
    		<div class="page_content register_page">
	        	<div class="row">
		            	<div class="col-xs-12 col-sm-6 col-md-6">
							<form:form action="dang-ky.htm" modelAttribute="user">                   
								<div class="form-group">
			                        <label class="control-label" for="FullName">Tên tài khoản</label> 
			                        <span class="red_require">*</span>
			                        <form:errors style="color: red" path= "userName"/>
			                        <form:input class="form-control" path="userName"/>
			                    </div>
			                    <div class="form-group">
			                        <label class="control-label" for="Mobile">Số điện thoại</label> <span class="red_require">*</span>
			                        <form:errors style="color: red" path="std"/>
			                        <form:input class="form-control" path="std"/>
			                    </div>
			                    <div class="form-group">
			                        <label class="control-label" for="Password">Tạo mật khẩu</label> <span class="red_require">*</span>
			                        <form:errors style="color: red" path="passWord"/>
			                        <form:password class="form-control" path="passWord"/>
			                    </div>
			                    <div class="form-group">
			                    	<label class="control-label" for="Password">Xác nhận mật khẩu</label> <span class="red_require">*</span>
			                        <form:errors style="color: red" path="confirmPass"/>
			                        <form:password class="form-control" path="confirmPass"/>
			                    </div>
			                    <div class="btn_wrapper">
			                        <button type="submit" class="btn btn-success btn-block"><i class="fa fa-user-plus"></i> Đăng ký tài khoản</button>
			                    	<p class=" mgt-20" style="color: red">${message}</p>
			                    </div>
			                    
							</form:form>            
						</div>
		            <div class="col-xs-12 col-sm-1 col-md-1 hidden-xs">
		            </div>
		            <div class="col-xs-12 col-sm-5 col-md-5">
		                <div class="right">
		                    <p class="mgb-20">Đăng nhập bằng Facebook hoặc Google</p>
		                    <section id="socialLoginForm">
		                        <div id="socialLoginList">
			                        <p>
										<form action="#" method="post">            
											<button type="submit" class="btn btn-social btn-bg-facebook btn-block" title="Đăng nhập bằng Facebook">
											<i class="fa fa-facebook"></i> Đăng nhập bằng Facebook</button>
										</form>    
									</p>
			    					<p>
										<form action="#" method="post">            
											<button type="submit" class="btn btn-social btn-bg-google btn-block" title="Đăng nhập bằng Google">
											<i class="fa fa-google"></i> Đăng nhập bằng Google</button>
										</form>    
									</p>
								</div>
		                    </section>
		                    <div class="mgt-25">
		                        <p>Bạn đã có tài khoản? <a href="dang-nhap.htm">Đăng nhập ngay</a></p>
		                    </div>
		                </div>
		            </div>
	        	</div>
    		</div>
		</div>
    </div>
    
<jsp:include page="footer.jsp"></jsp:include>
        
    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>

    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

    <script src="<c:url value="/resources/js/bootstrap-growl.min.js"/>"></script>

    <script src="<c:url value="/resources/js/jqueryval.min.js"/>"></script>

    <script src="<c:url value="/resources/js/lazyload.min.js"/>"></script>

    <script src="<c:url value="/resources/js/main.min.js?v=20200305"/>"></script>

    <script src="<c:url value="/resources/js/common.min.js?v=20200305"/>"></script>

    <script src="<c:url value="/resources/js/account.min.js?v=20200305"/>"></script>


    
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-42682349-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-42682349-1');
</script>
</body>
</html>
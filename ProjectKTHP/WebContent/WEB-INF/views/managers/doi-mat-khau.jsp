<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Đổi mật khẩu</title>
    <base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
		<div class="access_page">
		    <div class="page_content intro_page clearfix">
		        <ul class="nav nav-tabs tab_huongdan" role="tablist">
				    <li><a href="quan-ly-tin.htm"><i class="fa fa-list-alt"></i> Quản lý tin</a></li>
				    <li class="active"><a href="tai-khoan.htm"><i class="fa fa-user"></i> Thông tin tài khoản</a></li>
				</ul>
        		<div class="tab-content">
            		<h4>ĐỔI MẬT KHẨU</h4>
            		<hr />
            		<div class="row user_profile_wrapper">
                		<div class="user_profile_left col-xs-12 col-md-8">
                    		<div class="user_profile_form">
								<form action="doi-mat-khau.htm" class="form-horizontal" method="post">
									<div class="form-group">
                                		<label class="control-label col-md-3">Mật khẩu cũ</label>
	                                	<div class="col-md-9">
	                                    	<input class="form-control" type="password" name="oldPass"/>
	                                	</div>
                            		</div>
		                            <div class="form-group">
		                                <label class="control-label col-md-3" for="newPass">Mật khẩu mới</label>
		                                <div class="col-md-9">
		                                    <input class="form-control" type="password" name="newPass"/>
		                                </div>
		                            </div>
		                            <div class="form-group">
		                                <label class="control-label col-md-3" for="confirmPass">Nhập lại mật khẩu</label>
		                                <div class="col-md-9">
		                                    <input class="form-control" type="password" name="confirmPass"/>
		                                </div>
		                            </div>
		                            <div class="form-group">
		                                <div class="col-md-offset-3 col-md-9">
		                                    <button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
		                                    <p class=" mgt-20" style="color: red">${message}</p>
		                                </div>
		                            </div>
								</form>                   
							</div>
                		</div>
            		</div>
        		</div>
    		</div>
		</div>
    </div>
 <jsp:include page="footer.jsp"></jsp:include>
    
    <script src="/scripts/jquery.min.js"></script>

    <script src="/scripts/bootstrap.min.js"></script>

    <script src="/scripts/bootstrap-growl.min.js"></script>

    <script src="/scripts/jqueryval.min.js"></script>

    <script src="/scripts/lazyload.min.js"></script>

    <script src="/scripts/main.min.js?v=20200305"></script>

    <script src="/scripts/common.min.js?v=20200305"></script>

    <script src="/scripts/account.min.js?v=20200305"></script>

    
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Quên mật khẩu</title>
    <base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
    <jsp:include page="../pages/header.jsp"></jsp:include>
    <div class="container">
		<div class="access_page">
    		<div class="page_header">
        		<h1 class="page_title">Qu&#234;n mật khẩu</h1>
        		<hr />
    		</div>
    	<div class="page_content register_page">
        	<div class="row">
            	<div class="col-xs-12 col-md-5">
                	<section id="forgotForm">
						<form action="quen-mat-khau.htm" method="post">                        
							<div class="form-group">
	                            <label class="control-label" for="Mobile">Email</label> <span class="red_require">*</span>
	                            <input class="form-control" name="to"/>
	                        </div>
	                        <div class="form-group">
	                            <button type="submit" class="btn btn-primary">Gửi mã xác thực</button>
	                            <p class=" mgt-20" style="color: red">${message}</p>
	                        </div>
	                        <div class="form-group"></div>
	                        
						</form>                
					</section>
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
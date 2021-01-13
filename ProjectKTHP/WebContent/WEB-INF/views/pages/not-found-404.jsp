<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Không tìm thấy trang</title>
</head>
<body>
   <c:choose>
		<c:when test="${empty sessionScope.userInfo.userName}">
			<jsp:include page="../pages/header.jsp"></jsp:include>
		</c:when>
		<c:when test="${not empty sessionScope.userInfo.userName}">
			<jsp:include page="../managers/header.jsp"></jsp:include>
		</c:when>
	</c:choose>
    <div class="container">
	    <div class="page_404">
			<h2 class="title">Rất tiếc, trang bạn truy cập không tồn tại</h2>
			<p>Có thể nội dung đã bị xóa hoặc liên kết bị sai. Bạn có thể tham khảo các link liên kết gợi ý bên dưới:</p>
		</div>     
    </div>
      <script src="<c:url value="/resources/js/select2.full.min.js"/>"></script>
      <script>$('.select2').select2()</script>
      <script>
          $(".view-more[data-toggle='collapse']").click(function () {
              if ($(this).text() == '=> Xem thêm') {
                  $(this).text('=> Thu gọn');
              } else {
                  $(this).text('=> Xem thêm');
              }
          });
      </script>
    
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
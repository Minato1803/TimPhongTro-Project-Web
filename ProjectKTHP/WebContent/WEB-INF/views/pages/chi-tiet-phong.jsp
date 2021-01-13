<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Chi tiết phòng</title>
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
		<h1 class="post-title-lg title-lg-vip5">${detail.tieuDe}</h1>
		<div class="page_content">
	    	<div class="row">
	        	<div class="col-xs-12 col-md-8 block-left pdr-0">
	            	<div class="view-detail">
	                	<div class="block-content">
	                    	<div class="block-content-meta">
	                            <div class="post_summary_wrapper hidden-xs">
	                                <div class="post_summary clearfix">
	                                    <div class="summary_row clearfix">
	                                        <div class="post_summary_left fullwidth">
	                                            <div class="summary_item_headline">Địa chỉ:</div>
	                                            <div class="summary_item_info">${detail.diaChi}</div>
	                                        </div>
	                                    </div>
	                                    <div class="summary_row clearfix">
	                                        <div class="post_summary_left">
	                                            <div class="summary_item_headline">Chuyên mục:</div>
	                                            <div class="summary_item_info">
		                                            <c:choose>
														<c:when test="${detail.loai == '1'}">
															<h2><a href="cho-thue-phong-tro.htm">Cho thuê phòng trọ</a></h2>
														</c:when>
														<c:when test="${detail.loai == '2'}">
															<h2><a href="cho-thue-can-ho.htm">Cho thuê căn hộ</a></h2>
														</c:when>
														<c:when test="${detail.loai == '3'}">
															<h2><a href="cho-thue-nha-nguyen-can">Cho thuê nhà nguyên căn</a></h2>
														</c:when>
														<c:when test="${detail.loai == '4'}">
															<h2><a href="tim-nguoi-o-ghep">Tìm người ở ghép</a></h2>
														</c:when>
													</c:choose>
	                                            </div>
	                                        </div>
	                                        <div class="post_summary_right">
	                                            <div class="summary_item_headline">Mã tin:</div>
	                                            <div class="summary_item_info">${detail.maPhong}</div>
	                                        </div>
	                                    </div>
	                                    <div class="summary_row clearfix">
	                                        <div class="post_summary_left">
	                                            <div class="summary_item_headline">Giá cho thuê:</div>
	                                            <div class="summary_item_info summary_item_info_price">${detail.giaThue} Triệu/tháng</div>
	                                        </div>
	                                        <div class="post_summary_right">
	                                            <div class="summary_item_headline">Diện tích:</div>
	                                            <div class="summary_item_info summary_item_info_price">${detail.dienTich} m&#178;</div>
	                                        </div>
	                                    </div>
	                                    <div class="summary_row clearfix">
	                                        <div class="post_summary_left">
	                                            <div class="summary_item_headline">Liên hệ:</div>
	                                            <div class="summary_item_info">${detail.lienHe}</div>
	                                        </div>
	                                        <div class="post_summary_right">
	                                        </div>
	                                    </div>
	                                    <div class="summary_row">
	                                        <div class="post_summary_left">
	                                            <div class="summary_item_headline">Điện thoại:</div>
	                                            <div class="summary_item_info summary_item_info_phone">
	                                                    <a href="tel:${detail.sdt}" class="js-get-phone" data-phone="${detail.sdt}"><i class="fa fa-phone" aria-hidden="true"></i> <span>${detail.sdt}</span></a>
	                                            </div>
	                                        </div>
	                                        <div class="post_summary_right">
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	
	                    	</div>
	                	</div>
	                	<div class="block-content" id="_motachitiet">
		                    <div class="post_summary_wrapper">
		                        <div class="post_summary-content">
		                            <span class="block_headline">Thông tin chi tiết</span>
		                            ${detail.ghiChu}
		                        </div>
		                    </div>
		                </div>
	                    <div class="block-content" id="_hinhanh">
	                        <div class="post_summary_wrapper">
	                            <div class="post_summary-content">
	                                <span class="block_headline">Hình ảnh</span>
	                                <div class="post-photos">
	                                <div id="slider">
	                                <c:choose>
	                                	<c:when test="${ empty detailImgs}">
	                                    	<img itemprop="image" src= "<c:url value = "/resources/images/default.jpg"/>" alt="${detail.tieuDe}" title="${detail.tieuDe}">
	                                    </c:when>
	                                	<c:when test="${ not empty detailImgs}">
	                                		<c:forEach var="item" varStatus="loop" items="${detailImgs}">                             
		                                      <img src= "<c:url value = "/files/${item.urlHinhAnh}"/>" alt="${detail.tieuDe}" title="${detail.tieuDe}" />
	                                  		</c:forEach>  
	                                	</c:when>
	                                </c:choose>
	                                </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
		                <div class="alert alert-warning post_report mgt-15">
		                    <p>Mọi thông tin trên website chỉ mang tính chất tham khảo. Chúng tôi luôn cố gắng cung cấp các thông tin đầy đủ, chính xác và minh bạch đến người xem, tuy nhiên quá trình kiểm duyệt vẫn có thể xảy ra sơ sót. Nếu bạn có phản hồi với tin đăng này (tin đã cho thuê, không liên lạc được, các trường hợp khác), vui lòng thông báo để Thuephongtro có thể xử lý.</p>
		                </div>
	            	</div>
	        </div>
	        <div class="col-xs-12 col-md-4 sidebar-right">	
	        	<jsp:include page="sideBarInfo.jsp"></jsp:include>
	        </div>
	    </div>
	</div>	
</div>
    
<jsp:include page="footer.jsp"></jsp:include>

    <script src="<c:url value="/resources/js/lightslider.min.js"/>"></script>
    <script src="<c:url value="/resources/js/lightgallery.min.js"/>"></script>
    <script src="<c:url value="/resources/js/lg-thumbnail.js"/>"></script>
    <script src="<c:url value="/resources/js/lg-fullscreen.js"/>"></script>
    <script src="<c:url value="/resources/js/lg-autoplay.js"/>"></script>
    <script src="<c:url value="/resources/js/lg-zoom.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.nivo.slider.pack.js"/>"></script>
    <script>
        $(document).ready(function () {
            $('#lightSlider').lightSlider({
                mode: 'slide',
                gallery: true,
                autoWidth: false,
                adaptiveHeight: false,
                item: 1,
                loop: true,
                slideMargin: 0,
                thumbItem: 3
            });
            $('#lightSlider').lightGallery();
        });
    </script>
    <script>Cufon.now();</script>
	<script>
	$(window).load(function () {
	    $('#slider').nivoSlider({
	        effect: 'sliceUpDown', //Specify sets like: 'fold,fade,sliceDown, sliceDownLeft, sliceUp, sliceUpLeft, sliceUpDown, sliceUpDownLeft'
	        slices: 17,
	        animSpeed: 500,
	        pauseTime: 6000,
	        startSlide: 0, //Set starting Slide (0 index)
	        directionNav: false, //Next & Prev
	        directionNavHide: false, //Only show on hover
	        controlNav: true, //1,2,3...
	        controlNavThumbs: false, //Use thumbnails for Control Nav
	        controlNavThumbsFromRel: false, //Use image rel for thumbs
	        controlNavThumbsSearch: '.jpg', //Replace this with...
	        controlNavThumbsReplace: '_thumb.jpg', //...this in thumb Image src
	        keyboardNav: true, //Use left & right arrows
	        pauseOnHover: true, //Stop animation while hovering
	        manualAdvance: false, //Force manual transitions
	        captionOpacity: 1, //Universal caption opacity
	        beforeChange: function () {
	            $('.nivo-caption').animate({
	                bottom: '-110'
	            }, 400, 'easeInBack')
	        },
	        afterChange: function () {
	            Cufon.refresh();
	            $('.nivo-caption').animate({
	                bottom: '-20'
	            }, 400, 'easeOutBack')
	        },
	        slideshowEnd: function () {} //Triggers after all slides have been shown
	    });
	    Cufon.refresh();
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Cho thuê phòng trọ, Tìm nhà trọ giá rẻ mới nhất 2020</title>
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
	    <div class="access_page pd0">
	        <div class="page_header">
	        	<h1>DANH SÁCH PHÒNG</h1>
	        </div>
			<hr/>
	        <div class="page_content">
	            <div class="row">
	            	<!-- list phòng trọ -->
	                <div class="col-xs-12 col-md-8 pdr-0">
	                    <div class="post-list">
	                    <c:choose>
	                    	<c:when test="${empty listP}">
	                    		<div class="pdb-20 pdt-20">
                                	<p>Hiện tại chưa có tin đăng trong khu vực này.</p>
                            	</div>
	                    	</c:when>
	                    	<c:when test="${not empty listP}">
			                  <div class="list-all-new">
				                  <c:forEach var="item" varStatus="loop" items="${listP}">
				                  	<div class="news-item item-vip5">
										<div class="news-thumb">
				          					<a href="detail-id-${item.maPhong}.htm">
				              					<c:choose>
				                                	<c:when test="${ empty item.ctHinhAnh}">
				                                    	<img src= "<c:url value = "/resources/images/default.jpg"/>" alt="${item.tieuDe}" class="lazyload">
				                                    </c:when>
				                                	<c:when test="${ not empty item.ctHinhAnh}">
				                                		<c:forEach var="itemimg" begin="0" end="0" varStatus="loop" items="${item.ctHinhAnh}">                             
					                                      <img src= "<c:url value = "/files/${itemimg.urlHinhAnh}"/>" alt="${item.tieuDe}" class="lazyload">
				                                  		</c:forEach>  
				                                	</c:when>
				                                </c:choose>
				          					</a>
										</div>
										<div class="news-info">
				          					<h4 class="news-title">
				              				<a href="detail-id-${item.maPhong}.htm" title="${item.tieuDe}"></a>
				              				</h4>
				          					<div class="news-desc">${item.ghiChu}</div>
				   							<div class="room-detail">
				       							<div class="localtion">
				           							<div class="clearfix">
				               							<span class="price"><b>${item.giaThue} Triệu/tháng</b></span>
				                  						<div class="rating">
				                             				<i class="fa fa-star"></i>
				                             				<i class="fa fa-star"></i>
				                             				<i class="fa fa-star"></i>
				                             				<i class="fa fa-star"></i>
				                             				<i class="fa fa-star"></i>
				                  						</div>
				           							</div>
				           							<div class="clearfix">
				               							<span>Diện tích: <b>${item.dienTich} m&#178;</b></span>
				               							<span class="mgl-10">Khu vực: <b><a href="#">${item.diaChi}</a></b></span>
				               							<div class="room-detail-item hidden-xs">
				               							</div>
				           							</div>
				       							</div>
				   							</div>
										</div>
									</div>
								</c:forEach>
			                  </div>
	                    	</c:when>
	                    </c:choose>
	                    </div>
	                </div>
	                <!-- list tìm kiếm -->
	                <div class="col-xs-12 col-md-4">
	                    <jsp:include page="sideBarInfo.jsp"></jsp:include>
	                    
	                    <div class="panel panel-default sidebar-box hidden-xs">
	                    	<div class="panel-body">
	                           <h2 class="title">Cho thuê phòng trọ</h2>
	                                <ul>
	                                        <li><h3><a title="Cho thuê phòng trọ Hồ Chí Minh" href="#">Cho thuê phòng trọ Hồ Chí Minh</a></h3></li>
	                                        <li><h3><a title="Cho thuê phòng trọ Hà Nội" href="#">Cho thuê phòng trọ Hà Nội</a></h3></li>
	                                        <li><h3><a title="Cho thuê phòng trọ Đà Nẵng" href="#">Cho thuê phòng trọ Đà Nẵng</a></h3></li>
	                                        <li><h3><a title="Cho thuê phòng trọ Đồng Nai" href="#">Cho thuê phòng trọ Đồng Nai</a></h3></li>
	                                        <li><h3><a title="Cho thuê phòng trọ Bình Dương" href="#">Cho thuê phòng trọ Bình Dương</a></h3></li>
	                                        <li><h3><a title="Cho thuê phòng trọ Bà Rịa Vũng Tàu" href="#">Cho thuê phòng trọ Bà Rịa Vũng Tàu</a></h3></li>
	                                        <li><h3><a title="Cho thuê phòng trọ Cần Thơ" href="#">Cho thuê phòng trọ Cần Thơ</a></h3></li>
	                                        <li><h3><a title="Cho thuê phòng trọ Hải Phòng" href="#">Cho thuê phòng trọ Hải Phòng</a></h3></li>
	                                        <li><h3><a title="Cho thuê phòng trọ Thừa Thiên Huế" href="#">Cho thuê phòng trọ Thừa Thiên Huế</a></h3></li>
	                                </ul>
	                          </div>
	                     </div>
	                    <div class="panel panel-default sidebar-box hidden-xs">
	    					<div class="panel-body">
	        					<div class="title">Xem theo giá</div>
							        <ul class="half">
							            <li>
							                <a rel="nofollow" href="#">Dưới 1 triệu</a>
							            </li>
							            <li>
							                <a rel="nofollow" href="#">Từ 1 - 2 triệu</a>
							            </li>
							            <li>
							                <a rel="nofollow" href="#">Từ 2 - 3 triệu</a>
							            </li>
							            <li>
							                <a rel="nofollow" href="#">Từ 3 - 5 triệu</a>
							            </li>
							            <li>
							                <a rel="nofollow" href="#">Từ 5 - 7 triệu</a>
							            </li>
							            <li>
							                <a rel="nofollow" href="#">Từ 7 - 10 triệu</a>
							            </li>
							            <li>
							                <a rel="nofollow" href="#">Từ 10 - 15 triệu</a>
							            </li>
							            <li>
							                <a rel="nofollow" href="#">Từ 15 - 20 triệu</a>
							            </li>
							            <li>
							                <a rel="nofollow" href="#">Trên 20 triệu</a>
							            </li>
							            <li>
							                <a rel="nofollow" href="#">Thỏa thuận</a>
							            </li>
							        </ul>
	    						</div>
						</div>
	                    <div class="panel panel-default sidebar-box hidden-xs">
	    					<div class="panel-body">
								<div class="title">Xem theo diện tích</div>
							        <ul class="half">
							            <li>
							                <a rel="nofollow" href="#">Dưới 20 m<sup>2</sup></a>
							            </li>
							            <li>
							                <a rel="nofollow" href="#">Từ 20 - 30m<sup>2</sup></a>
							            </li>
							            <li>
							                <a rel="nofollow" href="#">Từ 30 - 50m<sup>2</sup></a>
							            </li>
							            <li>
							                <a rel="nofollow" href="#">Từ 50 - 60m<sup>2</sup></a>
							            </li>
							            <li>
							                <a rel="nofollow" href="#">Từ 60 - 70m<sup>2</sup></a>
							            </li>
							            <li>
							                <a rel="nofollow" href="#">Từ 70 - 80m<sup>2</sup></a>
							            </li>
							            <li>
							                <a rel="nofollow" href="#">Từ 80 - 90m<sup>2</sup></a>
							            </li>
							            <li>
							                <a rel="nofollow" href="#">Từ 90 - 100m<sup>2</sup></a>
							            </li>
							            <li>
							                <a rel="nofollow" href="#">Trên 100m<sup>2</sup></a>
							            </li>
							            <li>
							                <a rel="nofollow" href="#">Không xác định</a>
							            </li>
							        </ul>
	    					</div>
						</div>
	                </div>
	            </div>
	        </div>
	    </div>
    
    </div>
    
	<jsp:include page="footer.jsp"></jsp:include>
  
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
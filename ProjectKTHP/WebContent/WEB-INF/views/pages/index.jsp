<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset= "UTF-8">
    <title>Tìm Phòng Trọ</title>
    <base href="${pageContext.servletContext.contextPath}/">
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
   		<jsp:include page="searchbar.jsp"></jsp:include>
	    <div class="access_page">
		    <div class="page_header">
		        <h1 class="page_title font20">Cho thuê phòng trọ, tìm nhà trọ nhanh chóng</h1>
		    </div>
		    <div class="row">
		    	<div class="col-xs-12 col-md-8 pdr-0">
	                <div class="row">
	                    <div class="col-xs-12 col-md-3">
	                        <h2 class="titleVip">
	                            TOP TÌM KIẾM NỔI BẬT
	                        </h2>
	                    </div>
	                </div>
	    			<div class="panel panel-default post-list">
	        			<div class="panel-body">
		            		<div class="list-all-new">
			                	<div class="row" style="margin-top:-15px">
			                		<c:forEach var="item" varStatus="loop" items="${listP}">
				                        <div class="col-xs-12 col-md-6">
				                            <div class="news-item item-vip5">
				                                <div class="news-thumb"> <!-- tiêu đề -->
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
				                                    <h3 class="news-title">
				                                        <a href="detail-id-${item.maPhong}.htm" title="${item.tieuDe}"></a>
				                                    </h3>
				                                    <div class="area mgt-5">
				                                        <span><i class="fa fa-area-chart"></i> <b>${item.dienTich} m&#178;</b></span> <span class="rating" style="color: #fc0">
				                                                <i class="fa fa-star"></i>
				                                                <i class="fa fa-star"></i>
				                                                <i class="fa fa-star"></i>
				                                                <i class="fa fa-star"></i>
				                                                <i class="fa fa-star"></i>
				                                        </span>
				                                    </div>
				                                    <div class="localtion">
				                                        <span><i class="fa fa-map-marker"></i> <b><a href="#">${item.diaChi}</a></b></span>
				                                    </div>
				                                    <div class="price mgt-5">
				                                        <span>${item.giaThue} Triệu/tháng</span>
				                                    </div>
				                                </div>
				                            </div>
				                        </div>
			                        </c:forEach>
								</div>
		                    </div>
	                    </div>
	                </div>
		    	</div>
	        	<div class="col-xs-12 col-md-4">
	                <div class="sidebar-box">
	                    <h3 class="sidebarbox-title">
	                        <span>Danh mục cho thuê</span>
	                    </h3>
	                    <div class="sidebarbox-body">
	                        <ul class="box-lastnews">
	                           <li><a title="Cho thuê phòng trọ Hồ Chí Minh" href="#">Cho thuê phòng trọ Hồ Chí Minh</a></li>
	                           <li><a title="Cho thuê phòng trọ Hà Nội" href="#">Cho thuê phòng trọ Hà Nội</a></li>
	                           <li><a title="Cho thuê phòng trọ Đà Nẵng" href="#">Cho thuê phòng trọ Đà Nẵng</a></li>
	                           <li><a title="Cho thuê phòng trọ Đồng Nai" href="#">Cho thuê phòng trọ Đồng Nai</a></li>
	                           <li><a title="Cho thuê phòng trọ Bình Dương" href="#">Cho thuê phòng trọ Bình Dương</a></li>
	                           <li><a title="Cho thuê phòng trọ Bà Rịa Vũng Tàu" href="#">Cho thuê phòng trọ Bà Rịa Vũng Tàu</a></li>
	                           <li><a title="Cho thuê phòng trọ Cần Thơ" href="#">Cho thuê phòng trọ Cần Thơ</a></li>
	                           <li><a title="Cho thuê phòng trọ Hải Phòng" href="#">Cho thuê phòng trọ Hải Phòng</a></li>
	                           <li><a title="Cho thuê phòng trọ Thừa Thiên Huế" href="#">Cho thuê phòng trọ Thừa Thiên Huế</a></li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="sidebar-box">
				        <h3 class="sidebarbox-title">
				            <span>Tin tức mới</span>
				        </h3>  
	    			</div>
	                <div class="sidebar-box">
				        <h3 class="sidebarbox-title">
				            <span>Có thể bạn quan tâm</span>
				        </h3>
				        <div class="sidebarbox-body">
				            <ul class="box-lastnews">
				                    <li><a href="#" title="{Chia sẻ} Kinh doanh cho thuê phòng trọ có phải đóng thuế gì hay không?">{Chia sẻ} Kinh doanh cho thuê phòng trọ có phải đóng thuế gì hay không?</a></li>
				                    <li><a href="#" title="Những điều cần lưu ý trong việc quản lý nhà trọ">Những điều cần lưu ý trong việc quản lý nhà trọ</a></li>
				                    <li><a href="#" title="Cẩn thận khi đi tìm thuê phòng trọ, nhà trọ với sinh viên mới">Cẩn thận khi đi tìm thuê phòng trọ, nhà trọ với sinh viên mới</a></li>
				                    <li><a href="#" title="Những điều bạn nên biết để bảo đảm quyền lợi khi đi thuê phòng trọ">Những điều bạn nên biết để bảo đảm quyền lợi khi đi thuê phòng trọ</a></li>
				                    <li><a href="#" title="Lưu ý 3 chiêu trò lừa đảo cho thuê phòng trọ, nhà trọ giá rẻ">Lưu ý 3 chiêu trò lừa đảo cho thuê phòng trọ, nhà trọ giá rẻ</a></li>
				            </ul>
	        			</div>
	    			</div>
        		</div>
    		</div>
		</div>
		<div class="key-word">
		    <div class="keyword-wrapper">
		        <div class="row">
		            <div class="col-xs-12 col-sm-6 col-md-3">
		                <div class="keyword_item">
		                    <h2><a href="#" title="Cho thuê phòng trọ">Cho thuê phòng trọ</a></h2>
		                    <ul>
		                        <li>
		                            <a href="#" title="Cho thuê phòng trọ Hồ Chí Minh">Cho thuê phòng trọ Hồ Chí Minh</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Cho thuê phòng trọ Hà Nội">Cho thuê phòng trọ Hà Nội</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Cho thuê phòng trọ Đà Nẵng">Cho thuê phòng trọ Đà Nẵng</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Cho thuê phòng trọ Đồng Nai">Cho thuê phòng trọ Đồng Nai</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Cho thuê phòng trọ Bình Dương">Cho thuê phòng trọ Bình Dương</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Cho thuê phòng trọ Bà Rịa Vũng Tàu">Cho thuê phòng trọ Bà Rịa Vũng Tàu</a>
		                        </li>
		                    </ul>
		                </div>
		            </div>
		            <div class="col-xs-12 col-sm-6 col-md-3">
		                <div class="keyword_item">
		                    <h2><a href="#" title="Nhà nguyên căn">Nhà nguyên căn</a></h2>
		                    <ul>
		                        <li>
		                            <a href="#" title="Cho thuê nhà Hồ Chí Minh">Cho thuê nhà Hồ Chí Minh</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Cho thuê nhà Hà Nội">Cho thuê nhà Hà Nội</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Cho thuê nhà Đà Nẵng">Cho thuê nhà Đà Nẵng</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Cho thuê nhà Đồng Nai">Cho thuê nhà Đồng Nai</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Cho thuê nhà Bình Dương">Cho thuê nhà Bình Dương</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Cho thuê nhà Bà Rịa Vũng Tàu">Cho thuê nhà Bà Rịa Vũng Tàu</a>
		                        </li>
		                    </ul>
		                </div>
		            </div>
		            <div class="col-xs-12 col-sm-6 col-md-3">
		                <div class="keyword_item">
		                    <h2><a href="#" title="Cho thuê căn hộ">Cho thuê căn hộ</a></h2>
		                    <ul>
		                        <li>
		                            <a href="#" title="Cho thuê căn hộ Hồ Chí Minh">Cho thuê căn hộ Hồ Chí Minh</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Cho thuê căn hộ Hà Nội">Cho thuê căn hộ Hà Nội</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Cho thuê căn hộ Đà Nẵng">Cho thuê căn hộ Đà Nẵng</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Cho thuê căn hộ Đồng Nai">Cho thuê căn hộ Đồng Nai</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Cho thuê căn hộ Bình Dương">Cho thuê căn hộ Bình Dương</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Cho thuê căn hộ Bà Rịa Vũng Tàu">Cho thuê căn hộ Bà Rịa Vũng Tàu</a>
		                        </li>
		                    </ul>
		                </div>
		            </div>
		            <div class="col-xs-12 col-sm-6 col-md-3">
		                <div class="keyword_item">
		                    <h2><a href="#" title="Tìm người ở ghép">Tìm người ở ghép</a></h2>
		                    <ul>
		                        <li>
		                            <a href="#" title="Tìm người ở ghép Hồ Chí Minh">Tìm người ở ghép Hồ Chí Minh</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Tìm người ở ghép Hà Nội">Tìm người ở ghép Hà Nội</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Tìm người ở ghép Đà Nẵng">Tìm người ở ghép Đà Nẵng</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Tìm người ở ghép Đồng Nai">Tìm người ở ghép Đồng Nai</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Tìm người ở ghép Bình Dương">Tìm người ở ghép Bình Dương</a>
		                        </li>
		                        <li>
		                            <a href="#" title="Tìm người ở ghép Bà Rịa Vũng Tàu">Tìm người ở ghép Bà Rịa Vũng Tàu</a>
		                        </li>
		                    </ul>
		                </div>
		            </div>
        		</div>
    		</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
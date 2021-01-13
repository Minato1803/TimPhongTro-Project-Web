<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sửa tin đăng</title>
    <base href="${pageContext.servletContext.contextPath}/">
    <style type="text/css">.thumb-image{float:left;width:100px;position:relative;padding:5px;}.selectedItem{border:2px solid blue;}</style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
		<div class="access_page">
    	<h1 class="title_page">Sửa tin đăng</h1>
    	<div class="page-post">
        	<div class="row">
            	<div class="col-xs-12 col-md-4 block-right sidebar_huongdan">
                	<div class="hidden-xs">
                    	<div class="block_huongdandangtin">
                        	<div class="block_huongdandangtin_header"> Hướng dẫn đăng tin</div>
	                        <div class="block_huongdandangtin_body">
	                            <ul>
	                                <li><strong>Thông tin có dấu <span class="red_require">*</span> là bắt buộc.</strong></li>
	                                <li><strong>Nội dung phải viết bằng tiếng Việt có dấu</strong></li>
	                                <li><strong>Tiêu đề tin không dài quá 100 kí tự</strong></li>
	                                <li>Các bạn nên điền đầy đủ thông tin vào các mục để tin đăng có hiệu quả hơn.</li>
	                                <li>Tin đăng có hình ảnh rõ ràng sẽ được xem và gọi gấp nhiều lần so với tin rao không có ảnh.</li>
	                                <li>Lưu ý: sửa tin cần đăng lại hình ảnh mới.</li>
	                            </ul>
	                        </div>
                    	</div>
                	</div>
            	</div>
            	<div class="col-xs-12 col-md-8 block-left dang_tin">
				<form:form action="sua-tin.htm" class="form frm-dangtin" enctype="multipart/form-data" modelAttribute="detail">                    
					<div class="form_step step1">
                        <div class="group_fields">
                            <h3 class="form_title">Thông tin cơ bản</h3>
                            <div class="group_fields_body">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <label class="control-label">Tiêu đề tin <span class="red_require">*</span></label>
                                            <form:errors style="color: red" path= "tieuDe"/>
                                            <form:input class="form-control text-box single-line" path="tieuDe"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-xs-12">
                                            <label class="control-label">Chuyên mục <span class="red_require">*</span></label>
                                            <form:errors style="color: red" path= "loai"/>
                                            <form:select path="loai" class="form-control" name="type">
        										<form:option value="" label="--Chọn loại tin--"/>
        										<form:options items="${sessionScope.listType}"/>
    										</form:select>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <label class="control-label">Diện tích <span class="red_require">*</span></label>
                                            <form:errors style="color: red" path= "dienTich"/>
                                            <div class="input-group">
                                                <form:input class="form-control text-box single-line" path="dienTich"/>
                                                <span class="input-group-addon" id="basic-addon2">m²</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="clearfix">
                                                <div class="pull-left"><label class="control-label">Giá cho thuê <span class="red_require">*</span></label></div>
                                                <div class="pull-right"><span id="lblPrice" style="font-size:13px;color:#f3051b"></span></div>
                                                <form:errors style="color: red" path= "giaThue"/>
                                            </div>
                                            <form:input class="form-control text-box single-line" placeholder="VD: 2 triệu 500 nghìn thì nhập 2.5" path="giaThue"/>
                                        </div>
                                        <div class="col-sm-6">
                                            <label class="control-label">Đơn vị giá <span class="red_require">*</span></label>
                                            <input class="form-control" value="Triệu/tháng" placeholder="Triệu/tháng" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-xs-12">
                                            <label class="control-label">Tỉnh/Thành <span class="red_require">*</span></label>
                                            <form:select path="" class="form-control">
		                    					<form:option value="" label="--Chọn thành Phố--"/>
		                    					<form:options items="${sessionScope.listTP}" itemValue="MaTP" itemLabel="TenTP"/>
		                    				</form:select>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <label class="control-label">Quận/Huyện <span class="red_require">*</span></label>
                                            <form:select path="" class="form-control">
					            				<form:option value="" label="--Chọn quận huyện--"/>
												<form:options items="${sessionScope.listQ}" itemValue="MaQuan" itemLabel="TenQuan"/>
					        				</form:select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-xs-12">
                                            <label class="control-label">Đường/Phố</label>
                                            <form:select path="maDuong.maDuong" class="form-control">
	                    						<form:option value="" label="--Chọn đường phố--"/>
					            				<form:options items="${sessionScope.listD}" itemValue="MaDuong" itemLabel="TenDuong"/>
					        				</form:select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Địa chỉ <span class="red_require">*</span></label>
                                    <form:errors style="color: red" path= "diaChi"/>
		                            <form:input class="form-control text-box single-line" path="diaChi"/>
                                </div>
                            </div>
                        </div>
                        <div class="group_fields">
                            <h3 class="form_title">Thông tin mô tả</h3>
                            <div class="group_fields_body">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <label class="control-label">Nội dung <span class="red_require">*</span></label>
                                            <form:errors style="color: red" path= "ghiChu"/>
                                            <form:textarea class="form-control edtior-noidung" cols="20" rows="8" path="ghiChu"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="group_fields">
                            <h3 class="form_title">Thông tin liên hệ</h3>
                            <div class="group_fields_body">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-xs-12">
                                            <label class="control-label">Tên liên hệ <span class="red_require">*</span></label>
                                            <form:errors style="color: red" path= "lienHe"/>
		                                    <form:input placeholder="${sessionScope.userInfo.fullName}" value="${sessionScope.userInfo.fullName}" class="form-control text-box single-line" path="lienHe" disable="true"/>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <label class="control-label">Di động <span class="red_require">*</span></label>
											<form:errors style="color: red" path= "sdt"/>
											<form:input placeholder="${sessionScope.userInfo.sdt}" value="${sessionScope.userInfo.sdt}" class="form-control text-box single-line" path="sdt" disable="true"/> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="group_fields">
                            <h3 class="form_title">Hình ảnh</h3>
                            <div class="group_fields_body">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-12">
                                             <div class="clearfix ui-sortable default-theme">
                                               	<label for="fileUpload">
                                               		<img src= "<c:url value = "/resources/images/icon_upload2.png"/>" width="100" height="100" style="cursor: pointer;">
												</label>
                                               	<input type="file" name="files" multiple="multiple" id="fileUpload" accept="image/*" style="display: none; visibility: none;">
                                               	<div id="image-holder"></div>
                                           	</div>		                                            	
                                            <p class="help-block">
                                                Tối đa 3 ảnh. Dung lượng không quá 6MB<br />
                                            </p>
                                   		</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-12 text-center">
                                <button type="submit" class="btn btn-primary">Sửa tin</button>
                                <button type="button" class="btn btn-default mgl-5" onclick="location='quan-ly-tin.htm'" style="width:150px">Hủy</button>
                            </div>
                        </div>
                    </div>
				</form:form>              
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

    
    <script src="/scripts/jquery-ui.min.js"></script>
    <script src="/scripts/select2.full.min.js"></script>
    <script>$('.select2').select2()</script>
    <script src="/scripts/cityList1.min.js"></script>
    <script src="/scripts/cityList2.min.js"></script>
    <script src="/scripts/cityList3.min.js"></script>
    <script src="/scripts/cityList4.min.js"></script>
    <script src="/scripts/data.min.js?v=20200305"></script>
    <script src="/scripts/post.min.js?v=20200305"></script>
    <script src="/scripts/upload.min.js?v=20200305"></script>
    
    <!-- script để upload và prviewfile https://stackoverflow.com/questions/37262498/upload-images-in-spring-mvc-using-javascript-for-preview -->
	
	<script>
		$(document).ready(function() {

	        $("#fileUpload").on('change', function() {
	          //Get count of selected files
	          var countFiles = $(this)[0].files.length;
	          var imgPath = $(this)[0].value;
	          var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
	          var image_holder = $("#image-holder");
	          image_holder.empty();
	          if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
	            if (typeof(FileReader) != "undefined") {
	              //loop for each file selected for uploaded.
	              for (var i = 0; i < countFiles; i++) 
	              {
	                var reader = new FileReader();
	                reader.onload = function(e) {
	                  $("<img />", {
	                    "src": e.target.result,
	                    "class": "thumb-image"
	                  }).appendTo(image_holder);
	                }
	                image_holder.show();
	                reader.readAsDataURL($(this)[0].files[i]);
	              }
	            } else {
	              alert("This browser does not support FileReader.");
	            }
	          } else {
	            alert("Pls select only images");
	          }
	        });
      });
	</script>
    
    <script>
        $(function () {
            $("#ddlPostCate").val(1);
            $("#ddlUnit").val(2);
            $("#ddlProvince").val('SG');
            $("#ddlProvince").trigger('change');
            $("#ddlDistrict").val(61);
            $("#ddlDistrict").trigger('change');
            $("#ddlWard").val(5848);
            if (5848 !== 0) {
                $("#ddlWard").trigger('change');
            }
            $("#ddlStreet").val(12099);
            if (12099 !== 0) {
                $("#ddlStreet").trigger('change');
            }
            var images = $('input[name="Images"]');
            $('#uploadimage').sortable({
                revert: false,
                items: '.upload-item',
                cursor: 'move',
                opacity: 0.5,
                containment: "parent",
                distance: 10,
                tolerance: 'pointer',
                sort: function (event, ui) {
                    var $target = $(event.target);
                    if (!/html|body/i.test($target.offsetParent()[0].tagName)) {
                        var top = event.pageY - $target.offsetParent().offset().top - (ui.helper.outerHeight(true) / 2);
                        ui.helper.css({ 'top': top + 'px' });
                    }
                },
                update: function (event, ui) {
                    sortable(images);
                }
            });
            var maxfile = 0;
            var number = getImageCount(images.val());
            var vipType = 5;
            if (vipType === 5) {
                maxfile = (6 - number);
            }
            else {
                maxfile = (16 - number);
            }
            loadupload(maxfile);
        });

        function loadupload(maxfile) {
            $('#uploadimage').wvtupload({ token: $('input[name="__RequestVerificationToken"]').val(), target: 'BDSGuestUploadNonFlash', maxFiles: maxfile, serverThumb: 'https://img.thuephongtro.com/images/thumb', serverUpload: 'https://img.thuephongtro.com', loadList: 1, postId: 166313 });
        }

        var getImageCount = function (list) {
            if (list == '') return 0;
            var arrListImage = list.split(",");
            return arrListImage.lenght;
        }
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
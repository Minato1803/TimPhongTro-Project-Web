<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

		<div class="searchbar_top hidden-xs">
		    <div class="searchbar_top_body">
		        <div class="box-search">
		        	<form:form action="searching.htm">
			            <h3 class="title">Tìm kiếm nhanh</h3>
			            <div class="bs-content">
			                <div class="row">
			                    <div class="col-xs-12 col-sm-6 col-md-2">
									 <form:select path="loai" class="form-control" name="type">
            							<form:option value="" label="--Chọn loại tin--"/>
            							<form:options items="${sessionScope.listType}" />
        							</form:select>
	                    		</div>
			                    <div class="col-xs-12 col-sm-6 col-md-2"> 
				                    <form:select path="TP" class="form-control">
				                    	<form:option value="" label="--Chọn thành Phố--"/>
				                    	<form:options items="${sessionScope.listTP}" itemValue="maTP" itemLabel="tenTP"/>
				                    </form:select>
			                    </div>
			                    <div class="col-xs-12 col-sm-6 col-md-2">
			                    	<form:select path="Quan" class="form-control">
							            <form:option value="" label="--Chọn quận huyện--"/>
											<form:options items="${sessionScope.listQ}" itemValue="maQuan" itemLabel="tenQuan"/>
							        </form:select>
			                    </div>
			                    <div class="col-xs-12 col-sm-6 col-md-2">
			                    	<form:select path="Duong" class="form-control">
			                    		<form:option value="" label="--Chọn đường phố--"/>
							            <form:options items="${sessionScope.listD}" itemValue="MaDuong" itemLabel="TenDuong"/>
							        </form:select>
			                    </div>
			                    <div class="col-xs-12 col-sm-6 col-md-2">
			                        <form:select path="gia" style="width:100%" class="form-control">
            							<form:option value="0" label="--Chọn giá thuê--"/>
            							<form:options items="${sessionScope.listPrice}"/>
        							</form:select>
			                    </div>
			                    <div class="col-xs-12 col-sm-6 col-md-2">
			                       <form:select path="dienTich" style="width:100%" class="form-control" name="dt">
            							<form:option value="0" label="--Chọn diện tích--"/>
            							<form:options items="${sessionScope.listArea}" />
        							</form:select>
			                    </div>
	                		</div>
	            		</div>
	            		 <div class="bs-search">
	            		 	<i class="fa fa-search"></i>
	            		 	<input type="submit" value="Tìm Kiếm" class="button">
			            </div>
			       </form:form>
        		</div>
    		</div>
		</div>

	
</body>
</html>
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
	
            	<div class="panel panel-default search-box">
            		<form:form action="searching.htm" modelAttribute="command">
	    				<div class="panel-heading">
	        				<div class="title" id="mbSearch">Tìm kiếm phòng trọ</div>
	    				</div>
	    				<div class="panel-body">
		        			<div class="list-group">
					             <form:select path="loai" class="form-control">
           							<form:option value="" label="--Chọn loại tin--"/>
           							<form:options items="${sessionScope.listType}" />
       							 </form:select>
		        			</div>
					        <div class="list-group">
					            <form:select path="TP" class="form-control">
			                    	<form:option value="" label="--Chọn thành Phố--"/>
			                    	<form:options items="${sessionScope.listTP}" itemValue="MaTP" itemLabel="TenTP"/>
				                </form:select>
					        </div>
					        <div class="list-group">
					            <form:select path="Quan" class="form-control">
						            <form:option value="" label="--Chọn quận huyện--"/>
						            <form:options items="${sessionScope.listQ}" itemValue="MaQuan" itemLabel="TenQuan"/>
						        </form:select>
					        </div>
					        <div class="list-group">
					           <form:select path="Duong" class="form-control">
		                    		<form:option value="" label="--Chọn đường phố--"/>
						            <form:options items="${sessionScope.listD}" itemValue="MaDuong" itemLabel="TenDuong"/>
						       </form:select>
					        </div>
					        <div class="list-group">
					            <form:select path="gia" style="width:100%" class="form-control">
           							<form:option value="0" label="--Chọn giá thuê--"/>
           							<form:options items="${sessionScope.listPrice}"/>
       							</form:select>
					        </div>
					        <div class="list-group">
					            <form:select path="dienTich" style="width:100%" class="form-control">
           							<form:option value="0" label="--Chọn diện tích--"/>
           							<form:options items="${sessionScope.listArea}" />
       							</form:select>
					        </div>
	            		 		<input type="submit" value="Tìm Kiếm" class="btn btn-primary btn_search" id="btnSearch">
	    				</div>
    				</form:form>
				</div>
</body>
</html>
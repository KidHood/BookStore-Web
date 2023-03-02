<%@page import="model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-with, initial-scale-1, skrink-to-fit=no">
<title>Thay đổi thông tin</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
	integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />           
 <link href="./css/style.css" rel="stylesheet">
</head>
	<style>
		.red{
			color: red;
		}
	</style>
<body>
     <%@include file ="../common/header.jsp" %>
        <c:if test="${acc == null}">
	<h1>Bạn chưa đăng nhập vui lòng truy cập <a href="${url}/index.jsp">Trang chủ</a> để đăng nhập!</h1>
        </c:if>
        
        <c:if test="${acc != null}">
	<div class="container content">
	<div class="text-center">
		<h1>THAY ĐỔI THÔNG TIN</h1>
		<div class="red" id="error">
                    ${requestScope.error}
		</div>
	</div>
		<form class="form" action="${url}/main-controller" method="post">
		<input type="hidden" name="action" value = "change-infor"> 
		<div class="row">
                    <div class="text-center"> <h3>Thông tin khách hàng</h3> </div>
			<div class="col-md-6">
				<div class="mb-3">
				  <label for="fullName" class="fullName">Họ và Tên</label>
				  <input type="text" class="form-control" id="fullName" placeholder="" name = "fullName" value="${acc.fullname}">
				</div>
                              
			</div>
                        <div class="col-md-6">
                              <div class="mb-3">
				  <label for="phoneNumber" class="phoneNumber">Điện thoại</label>
				  <input type="tel" class="form-control" id="phoneNumber" name = "phoneNumber" value="${acc.phone}">
				</div>
                        </div>
                        <input type="submit" class="btn btn-primary" value="Lưu thông tin"/>
                </div>
                </form>
	</div>
        </c:if>
       <%@include file ="../common/footer.jsp" %>
</body>
</html>
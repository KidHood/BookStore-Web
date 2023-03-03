<%-- 
    Document   : header
    Created on : Feb 13, 2023, 9:41:09 AM
    Author     : ADMIN
--%>
<%@page import="model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="url" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<c:set var="keyword" value="${requestScope.keyword}" />
<c:set var="searchBy" value="${requestScope.keyword}" />

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid"><!-- main-controller?action=search&txtsearch=&searchby=byname -->
			<a class="navbar-brand" href="${url}/main-controller?action=home&numberpage=1"> 
                           <img
                           src="<c:url value="/img/logo/logo_vanthong.png"/>" alt="Logo" height="24">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Trang chủ</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Combo
							giảm giá</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Thể loại </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Sách tâm lí</a></li>
							<li><a class="dropdown-item" href="#">Sách giáo khoa</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Sách trẻ em</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link disabled">Hết hàng</a>
					</li>
				</ul>
                                <div class ="d-flex">
                                    <form class="d-flex" role="search" action="${url}/main-controller" method="get">
                                    <input type="hidden" name="action" value ="search"> 
					<input class="form-control me-2" type="search"
						placeholder="Nội dung tìm kiếm" aria-label="Search" name="txtsearch" value="${keyword}">
                                        <select class="form-control me-2" name ="searchby">
                                            <option value="byname" ${searchBy == 'byname'?"selected='selected'":""}>By name</option>
                                            <option value="bycategories" ${searchBy == 'bycategories'?"selected='selected'":""}>By categories</option>
                                        </select>
					<button class="btn btn-success me-2" type="submit">Tìm</button>
                                    </form>
                                        <div class="contain-icon-cart me-2  rounded-circle">
                                            <span class="material-symbols-outlined  icon-cart "><a class="" href="${url}/main-controller?action=view-cart">shopping_cart</a></span>
                                            <c:set var="numProCar" value="${sessionScope.numProCart}" />
                                            <c:if test="${numProCar != null and numProCar > 0}" >
                                            <div class="numPro rounded-circle bg-danger d-flex justify-content-center align-items-center">${numProCar}</div>
                                            </c:if>
                                        </div>
                                            <c:set var="acc" value="${sessionScope.account}" />
                                        <c:if test="${acc == null}" >
						<a class="btn btn-primary" style = "white-space: nowrap;" href="${url}/common/login.jsp">
							Đăng nhập
						</a>
                                        </c:if>
					<c:if test="${acc != null}" >
						<ul class="navbar-nav me-auto mb-2 mb-lg-0 bg-infor">
							<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle btn btn-primary" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Tài khoản </a>
							<ul class="dropdown-menu  dropdown-menu-end">
							<li><a class="dropdown-item" href="${url}/main-controller?action=history-order">Đơn mua</a></li>
							<li><a class="dropdown-item" href="${url}/client/changeInfor.jsp">Thay đổi thông tin</a></li>
							<li><a class="dropdown-item" href="${url}/client/changePwd.jsp">Đổi mật khẩu</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="${url}/main-controller?action=logout">Đăng xuất</a></li>
						</ul></li>
							
						</ul>
				</div>	
					</c:if>
				
			</div>
		</div>
	</nav>

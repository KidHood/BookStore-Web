<%-- 
    Document   : bookDetail
    Created on : Feb 13, 2023, 11:53:52 AM
    Author     : ADMIN
--%>

<%@page import="model.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Chi tiết sách</title>
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
 <link href="<c:url value="/css/style_detail.css"/>" rel="stylesheet">
 <link href="<c:url value="/css/style.css"/>" rel="stylesheet"> 
    </head>
    <body>

        <!-- header-->
        <%@include file ="../common/header.jsp" %>
        <!-- end header -->   
        <c:set var="book" value="${requestScope.bookDetail}" />
        <c:if test="${book != null}" >
            <div class="container content">
            <div class="col-lg-8 border p-3 main-section bg-white">
                <div class="row hedding m-0 pl-3 pt-0 pb-3">
                    Chi tiết sản phẩm
                </div>
                <div class="row m-0">
                    <div class="col-lg-4 left-side-product-box pb-3">
                        <img src="<c:url value="productImage/${book.imgPath}" />" class="border p-3">
                    </div>
                    <div class="col-lg-8">
                        <div class="right-side-pro-detail border p-3 m-0">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h3><strong>${book.name}</strong></h3>
                                    <p class="m-0 p-0">${book.catename}</p>
                                </div>
                                <div class="col-lg-12">
                                    <p class="m-0 p-0 price-pro">${book.price} VND</p>
                                    <hr class="p-0 m-0">
                                </div>
                                <div class="col-lg-12 pt-2">
                                    <h5>Mô Tả</h5>
                                    <span>${book.decription}</span>
                                    <hr class="m-0 pt-2 mt-2">
                                </div>
                                <div class="col-lg-12">
                                    <p class="tag-section"><strong>Tag : </strong><a href="">${book.catename}</a></p>
                                </div>
                                <form action="${url}/main-controller">
                                    <input type="hidden" name="action" value="add-to-cart"/>
                                    <input type="hidden" name="bid" value="${book.id}"/>
                                <div class="col-lg-12">
                                    <h6>Số lượng :</h6>
                                    <input type="number" class="form-control text-center w-100" value="1" name="quantity">
                                </div>
                                <div class="col-lg-12 mt-3">
                                    <div class="row text-center">
                                        <div class="text-center">
                                            <input type="submit" class="btn btn-danger w-100" value="Thêm vào giỏ ">
                                        </div>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </c:if>
        <c:if test="${book == null}" >
            <h1 class="text-center">Không có sản phẩm để hiển thị</h1>
        </c:if>
        <!-- footer --> 
        <div >
        <%@include file ="../common/footer.jsp" %>
        </div>
        <!-- end footer --> 
    </body>
</html>

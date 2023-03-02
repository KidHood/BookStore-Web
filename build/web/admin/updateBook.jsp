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
 <link href="<c:url value="/css/styleAdmin.css"/>" rel="stylesheet">
 <link href="<c:url value="/css/style_detail.css"/>" rel="stylesheet">
    </head>
    <body >
        <div class="body">
        <div class="bg-text ">
            <!-- header-->
            <%@include file="headerAdminHome.jsp" %>
            <!-- end header -->   
            <c:set var="book" value="${requestScope.bookDetail}" />
            <div class="container mb-4 ">
                <div class="col-lg-8 border p-3 main-section bg-white">
                    <div class="row hedding m-0 pl-3 pt-0 pb-3">
                        Chi tiết sản phẩm
                    </div>
                    <div class="row m-0 text-dark">
                        <div class="col-lg-4 left-side-product-box pb-3">
                            <img src="<c:url value="productImage/${book.imgPath}" />"  alt="Ảnh sản Phẩm" class="border p-3">
                        </div>
                        <div class="col-lg-8">
                            <div class="right-side-pro-detail border p-3 m-0">
                                <div class="row">
                                 <form action="${url}/update-book" method="post" enctype="multipart/form-data">   
                                     <c:if test="${book == null }" >
                                         <input type ="hidden" name="newbook" value="yesa" />
                                     </c:if>
                                    <c:if test="${book != null}" >
                                        <input type ="hidden" name="bid" value="${book.id}" />
                                     </c:if>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                        <label for="bookname" class="fullName">Tên</label>
                                         <input type="text" class="form-control" id="bookname" placeholder="" name = "bookname" value="${book.name}">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                        <label for="price" class="">Giá</label>
                                         <input type="number" class="form-control" id="price" placeholder="" name = "price" value="${book.price}">
                                         </div>
                                        <hr class="p-0 m-0">
                                    </div>
                                    
                                    <div class="col-lg-12 pt-2">
                                        <div class="mb-3">
                                        <label for="decription" class="fullName">Mô tả</label>
                                         <textarea rows="4" cols="50" name="decription" class="form-control">${book.decription}</textarea>
                                         </div>
                                        <hr class="m-0 pt-2 mt-2">
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                        <label for="catename" class="fullName">Thể loại</label>
                                        <select class="form-control" name="cateName">
                                            <c:set var="listcate" value="${requestScope.listcate}" />
                                            <c:forEach items="${listcate.keySet()}" var="cateid">
                                                <option value="${listcate.get(cateid)}" ${(book.catename == listcate.get(cateid))?"selected='selected'":""}>${listcate.get(cateid)}
                                                </option>
                                            </c:forEach>
                                        </select>
                                        </div>
                                        <hr class="m-0 pt-2 mt-2">
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label for="fullName" class="fullName">File name:</label>
                                             <input type="file" class="form-control" name = "imgPath" >
                                        </div>
                                        <hr class="m-0 pt-2 mt-2">
                                    </div>
                                    <input type="hidden" name="bid" value="${book.id}"/>
                                    <div class="col-lg-12 mt-3">
                                        <div class="row text-center">
                                            <div class="text-center">
                                                <input type="submit" class="btn btn-danger w-100" value="Cập nhật">
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
        </div>
        <div>    
    </body>
</html>

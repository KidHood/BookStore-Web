<%-- 
    Document   : bookDetail
    Created on : Feb 13, 2023, 11:53:52 AM
    Author     : ADMIN
--%>

<%@page import="model.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
    </head>
    <body>

        <!-- header-->
        <%@include file ="header.jsp" %>
        <!-- end header -->   
        <%
            Object obj1 = request.getAttribute("bookDetail");
            Book book = (Book) obj1;
            if (book != null) {
        %>
        <div class ="container">
            <div class="row mt-4">
                <div class="col-md-4">
                    <img class="img-fluid" src="<%=book.getImgPath()%>" alt="Ảnh sách">
                </div>
                <div class="col-md-6">
                    <h3 class="text-center">Tên sách: <%=book.getName()%> </h3>
                    <h4>Thể loại: <%=book.getCatename()%></h4>
                    <p>Mô tả: <%=book.getDecription()%></p>
                    <h4>Giá: <del class="text-black-50"><%=book.getPrice() + 1000000%></del> 
                        <span class="text-danger"><%=book.getPrice()%> VND</span></h4>
                    <a href="<%=url%>/main-controller?action=add-to-cart&bid=<%=book.getId()%>" class="btn btn-primary">Thêm vào giỏ hàng</a>
                </div>
            </div>
        </div>
        <% } else{%>
        <h1> khong co gi de hien thi</h1>
        <% } %>
        <!-- footer --> 
        <%@include file ="footer.jsp" %>
        <!-- end footer --> 
    </body>
</html>

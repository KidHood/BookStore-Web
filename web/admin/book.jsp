<%-- 
    Document   : account
    Created on : Feb 22, 2023, 8:18:17 PM
    Author     : ADMIN
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tai Khoan</title>
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
 <link href="<c:url value="/css/styleAdmin.css"/>" rel="stylesheet">
</head>
    <body >
        <!-- bg-image p-5 text-center shadow-1-strong rounded mb-5 text-white -->
        <%@include file="headerAdminHome.jsp" %>
        <div class="body">
            <div class="bg-text contentadmin">
                <div class ="container">
                    <h1 class="text-center">Danh sách Sách</h1>
                    <h2 class="text-center text-danger">${requestScope.MSG}</h2>
                    <c:set var="list" value="${requestScope.lists}"/>
                    <a class="btn btn-success ml-auto" href="${url}/admin-controller?action=ViewBookDetail">Thêm Mới Sản Phẩm</a>
                    <c:if test="${list != null}">
                        <table class="table mt-4 text-white">
                            <tr class="">
                                <th scope="col">BOOK ID</th>
                                <th scope="col">TÊN</th>
                                <th scope="col">Giá</th>
                                <th scope="col">Thể Loại</th>
                                <th scope="col">TRẠNG THÁI</th>
                                <th scope="col">Hành động</th>
                            </tr>
                            <c:forEach items="${list}" var="book" >
                                <tr>
                                    <td>${book.id}</td>
                                    <td><a href="${url}/admin-controller?action=ViewBookDetail&bid=${book.id}">${book.name}</a></td>
                                    <td>${book.price}</td>
                                    <td>${book.catename}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${book.status == 1}">
                                                <p class="text-success fw-bold text-ouline">Còn hàng</p>
                                            </c:when>
                                             <c:when test="${book.status == 0}">
                                                 <p class="text-danger fw-bold text-ouline  ">Hết hàng</p>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                        <c:when test="${book.status == 1}">
                                            <a class="btn btn-danger" href="${url}/admin-controller?action=ChangeBookStatus&status=0&bookid=${book.id}">
                                                Hết hàng</a> 
                                        </c:when>
                                         <c:when test="${book.status == 0}">
                                            <a class="btn btn-success" href="${url}/admin-controller?action=ChangeBookStatus&status=1&bookid=${book.id}">
                                                Còn hàng</a> 
                                        </c:when>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                </div>
            </div>  
        </div>
        <!-- Footer -->
        <%@include file ="../common/footer.jsp" %>
	<!-- End footer -->  
    </body>
</html>

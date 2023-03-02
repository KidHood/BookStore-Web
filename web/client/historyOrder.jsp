<%-- 
    Document   : historyOrder
    Created on : Feb 13, 2023, 7:35:48 PM
    Author     : ADMIN
--%>

<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lịch sử mua hàng</title>
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
    <body>
        <%@include file ="../common/header.jsp" %>
        <div class="content">
            <h1 class="text-center">Đơn mua</h1>
            <h3 class="text-center" style="color:red;">${requestScope.MSG}</h3>
            <c:if test="${acc == null}" >
            <h1 class="text-center">Vui lòng đăng nhập để xem lịch sử mua hàng!</h1>
            </c:if>
             <c:if test="${acc != null}" >
            <div class="container text-center mt-4">
                <form action="${url}/main-controller" method="GET" >
                    <input type="hidden" name="action" value="filter-by-date" >
                    <label for="" class="" >Từ ngày</label>
                    <input class="me-4" type="date" name="datefrom" required="required" value="${requestScope.dateFrom}">
                    <label for="" class="">Đến ngày</label>
                    <input class="me-4" type="date" name="dateto" value="${requestScope.dateTo}" >
                    <button type="submit" class="btn btn-primary">Lọc</button>
                </form>
            </div>    
                <div class="container mt-4">
                <table class="table table-striped">
                    <tr>
                        <th scope="col">Orderid</th>
                        <th scope="col">Ngày mua hàng</th>
                        <th scope="col">Ngày ship</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">CHỌN</th>
                        <th scope="col">CHI TIẾT</th>
                    </tr>
                   <c:set var="list" value="${requestScope.historyorder}" />
                   <c:if test="${list != null}">
                       <c:set var="status" value="${['','Đang xử lý','Thành công','Bị hủy']}" />
                       <c:forEach items="${list}" var="ord" >
                            <tr>
                                <td>${ord.orderID}</td>
                                <td>${ord.orderDate}</td>
                                <td>${ord.shipDate}</td>
                                <td>${status[ord.status]}</td>
                                <c:if test="${ord.getStatus() == 1}" >
                                    <td><a href="${url}/main-controller?action=change-status&orderid=${ord.getOrderID()}&status=3">Hủy đơn hàng</a></td>
                                </c:if>
                                <c:if test="${ord.getStatus() == 3}" >
                                    <td><a href="${url}/main-controller?action=change-status&orderid=${ord.getOrderID()}&status=1">Mua lại</a></td>
                                </c:if>
                                <c:if test="${ord.getStatus() == 2}" >
                                    <td></td>
                                </c:if>
                                <td><a href="${url}/main-controller?action=view-order-detail&orderid=${ord.getOrderID()}">Chi tiết đơn hàng</a></td>
                           </tr>

                       </c:forEach>
                   </c:if>
                   <c:if test="${list == null}">
                    <h3 class="text-center"> Bạn không có đơn hàng nào </h3>
                   </c:if>
                </table>
            </c:if>
                </div>
        </div>
        <%@include file ="../common/footer.jsp" %>
    </body>
</html>

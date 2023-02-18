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
    </head>
    <body>
        <%@include file="../header.jsp" %>
        <% String msg = request.getAttribute("MSG") + "";
            msg = (msg.equals("null"))?"":msg;
            
            String dateTo = request.getAttribute("dateTo") + "";
            dateTo = (dateTo.equals("null"))?"":dateTo;
            
            String dateFrom = request.getAttribute("dateFrom") + "";
            dateFrom = (dateFrom.equals("null"))?"":dateFrom;
        %>
        <h1 class="text-center">Đơn mua</h1>
        <h3 class="text-center" style="color:red;"><%=msg %></h3>
        <% if(acc == null){%>
        <h1 class="text-center">Vui lòng đăng nhập để xem lịch sử mua hàng!</h1>
        <% }else{ %>
        <div class="container text-center mt-4">
            <form action="<%=url %>/main-controller" method="GET" >
                <input type="hidden" name="action" value="filter-by-date" >
                <label for="" class="" >Từ ngày</label>
                <input class="me-4" type="date" name="datefrom" required="required" value="<%=dateFrom %>">
                <label for="" class="">Đến ngày</label>
                <input class="me-4" type="date" name="dateto" value="<%=dateTo %>" >
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
                <% 
                    ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("historyorder");
                    if(list != null){
                        String[] status = {"","Đang xử lý","Thành công","Bị hủy"};
                        for(Order  or : list){
                        
               %> 
               <tr>
                    <th><%=or.getOrderID() %></th>
                    <th><%=or.getOrderDate() %></th>
                    <th><%=or.getShipDate() %></th>
                    <th><%=status[or.getStatus()] %></th>
                    <% if(or.getStatus() == 1){ %>
                    <th><a href="<%=url %>/main-controller?action=change-status&orderid=<%=or.getOrderID() %>&status=3">Hủy đơn hàng</th>
                    <% }else if(or.getStatus() == 3) { %>
                    <th><a href="<%=url %>/main-controller?action=change-status&orderid=<%=or.getOrderID() %>&status=1">Mua lại</th>
                    <% } %> 
                    <th><a href="<%=url %>/main-controller?action=view-order-detail&orderid=<%=or.getOrderID() %>">Chi tiết đơn hàng</a></th>
               </tr>
                
                <%
                        }
                    }else{
                %>
                <h3 class="text-center"> Bạn không có đơn hàng nào </h3>
                <% } %>
            </table>
        <% } %>
        <%@include file="../footer.jsp" %>
    </body>
</html>

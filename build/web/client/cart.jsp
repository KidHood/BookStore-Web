<%-- 
    Document   : order
    Created on : Feb 13, 2023, 2:36:05 PM
    Author     : ADMIN
--%>

<%@page import="java.util.Iterator"%>
<%@page import="database.BookDAO"%>
<%@page import="model.Book"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đơn hàng</title>
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
 <link href="<c:url value="/css/style.css"/>" rel="stylesheet">
 <style>
     .red{
         color: red;
     }
     .total_money{
           height: 40px;
           margin-bottom: 0;
       }
       .text_total{
           padding: 10px;
           background-color: white;
           color: #FF0000;
            margin-bottom: 0;
       }
 </style>
    </head>
    <body>
         <%@include file ="../common/header.jsp" %>
         <c:set var="cart" value="${sessionScope.cart}" />
          <div class ="text-center"><span style="color:green;">${requestScope.MSG}</span></div>
            <c:if test="${cart != null && cart.size() > 0}">
            <div class="content"> 
               <h1 class="text-center">Đơn hàng của tôi</h1>   
                <div class="container">
                    <table class="table  table-bordered table-dark ">
                        <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">TÊN</th>
                            <th scope="col">GIÁ</th>
                            <th scope="col">SỐ LƯỢNG</th>
                            <th scope="col">CHỌN</th>
                        </tr>
                        </thead>
                        <c:set var="total" value="0"/>
                        <c:forEach items="${cart.keySet()}" var="id">
                            <jsp:useBean id="boDAO" class="database.BookDAO" />
                            <jsp:useBean id="boTemp" class="model.Book" />
                            <jsp:setProperty name="boTemp" property="id" value="${id}"/>
                            <c:set var="book" value="${boDAO.selectById(boTemp)}" />
                            <c:set var="total" value="${total + (book.price * cart.get(id))}" />
                            <tr><form action="${url}/main-controller" method="post">
                                <td>${book.id}</td>
                                <td><a href="${url}/main-controller?action=view-book-detail&bid=${book.id}">${book.name}</a></td>
                                <td>${book.price}</td>
                                <td><input type="number" value="${cart.get(id)}" min="1" max="10" name="quantity"></td>
                                <td>
                                    <button type="submit" value="update-quantity" name="action" class="btn btn-success">Update</button>
                                    <button type="submit" value="remove-book-cart" name="action" class="btn btn-danger">X</button>
                                </td>
                                <input type="hidden" name="bookid" value="${book.id}">
                            </form>
                        </tr>
                    </c:forEach>
                    </table>
                       <div class="total_money">
                           <h5 class="float-end text_total">Total:${total} VND</h5>
                       </div>
                    <form action="${url}/main-controller" method="post">
                    <c:if test="${acc == null}" >
                        <div class="mb-3">
                            <label for="user" class="user">Họ và tên<span class = "red">* ${requestScope.namecheckout}</span> </label>
                            <input type="text" class="form-control" id="user" placeholder="" name ="fullname" required="required" value="${requestScope.fullName}" >
                          </div>
                          <div class="mb-3">
                            <label for="text" class="user">Số điện thoại<span class = "red">* ${requestScope.phonecheckout}</span> </label>
                            <input type="text" class="form-control" id="password" placeholder="" name ="phone" required="required" value="${requestScope.phone}" >
                          </div>
                    </c:if>
                        <button class=" w-100 btn btn-primary" type="submit">Mua hàng</button> 
                         <input type="hidden" name="action" value="checkout" />
                    </form>  
                </div>
            </div>
            </c:if>
            <c:if test="${cart == null or cart.size() == 0}" >
                <p class="background-cart"></p>
            </c:if>
                <div class="mt-4">
                    <%@include file ="../common/footer.jsp" %> 
                </div>
    </body>
</html>

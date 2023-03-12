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
   <link href="./css/style.css" rel="stylesheet">
   <style>
       .total_money{
           height: 40px;
           margin-bottom: 4px;
           
       }
       .text_total{
           padding: 10px;
           background-color: white;
           color: #FF0000;
       }
   </style>
    </head>
    <body>
         <%@include file ="../common/header.jsp" %>
         <div class="content">
            <c:if test="${acc == null}">
                <h1>Bạn chưa đăng nhập vui lòng truy cập <a href="${url}/common/login.jsp">Đăng nhập</a> để đăng nhập!</h1>
            </c:if>
            <c:if test="${acc != null}">
                <h1 class="text-center">Chi tiết đơn hàng</h1>   
                <div class ="text-center"><span style="color:green;">${requestScope.MSG}</span></div>
                <c:if test="${acc == null}" >
                <h1 class="text-center">Vui lòng đăng nhập để xem chi tiết đơn hàng!</h1>
                </c:if>
                <c:if test="${acc != null}" >
                    <c:set var="lists" value="${requestScope.lists}" />
                    <c:if test="${lists != null}" >
                        <div class="container">
                            <table class="table table-striped">
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">TÊN</th>
                                    <th scope="col">IMG</th> 
                                    <th scope="col">MÔ TẢ</th>
                                    <th scope="col">THỂ LOẠI</th>
                                    <th scope="col">GIÁ</th>
                                    <th scope="col">SỐ LƯỢNG</th>
                                </tr>
                                 <c:set var="total" value="0"/>
                                <c:forEach items="${lists.keySet()}" var="id">
                                    <jsp:useBean id="boDAO" class="database.BookDAO" />
                                    <jsp:useBean id="boTemp" class="model.Book" />
                                    <jsp:setProperty name="boTemp" property="id" value="${id}"/>
                                    <c:set var="book" value="${boDAO.selectById(boTemp)}" />
                                    <c:set var="total" value="${total + (book.price * lists.get(id))}" />
                                <tr><form action="${url}/main-controller" method="post">
                                    <td>${book.id}</td>
                                    <td><a href="${url}/main-controller?action=view-book-detail&bid=${book.id}">${book.name}</a></td>
                                    <td><img src="${url}/productImage/${book.imgPath}" style="height: 200px"/></td>
                                    <td><p>${book.decription}</p></td>
                                    <td>${book.catename}</td>
                                    <td>${book.price}</td>
                                    <td>${lists.get(id)}</td>
                                    <input type="hidden" name="bookid" value="${book.id}">
                                </form>
                                </tr>
                                </c:forEach>
                            </table>
                            <div class="total_money">
                                <h5 class="float-end text_total">Total:${total} VND</h5>
                            </div>
                        </div>
                     </c:if>
                    <c:if test="${lists == null}" >
                    <h1 class="text-center">Chi tiết đơn hàng đang được sử lí! Vui lòng quay lại sau</h1>
                    </c:if>
                </c:if>
            </c:if>
         </div>
        <%@include file ="../common/footer.jsp" %>
    </body>
</html>

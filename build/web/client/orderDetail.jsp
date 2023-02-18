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
    </head>
    <body>
        <%@include file="../header.jsp" %>
        <%
            String msg = request.getAttribute("MSG") + "";
            msg = (msg.equalsIgnoreCase("null"))?"":msg;
        %> 
        <h1 class="text-center">Chi tiết đơn hàng</h1>   
        <div class ="text-center"><span style="color:green;"><%=msg %></span></div>
        <%    
          //doc cart trong session
          HashMap<Integer, Integer> lists=(HashMap) request.getAttribute("lists");
          if(lists!=null && lists.size()>0){
        %>
        <div class="container">
            <table class="table table-striped">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">TÊN</th>
                    <th scope="col">GIÁ</th>
                    <th scope="col">SỐ LƯỢNG</th>
                </tr>
                <%
                    int total = 0;
                    for(int id : lists.keySet()){
                       BookDAO boDAO  = new BookDAO();
                       Book c = boDAO.selectById(new Book(id));
                       total += c.getPrice()* lists.get(id);
                %>
                <tr><form action="<%=url %>/main-controller" method="post">
                    <td><%= c.getId() %></td>
                    <td><a href="<%=url %>/main-controller?action=view-book-detail&bid=<%=c.getId() %>"><%= c.getName() %></a></td>
                    <td><%= c.getPrice()%></td>
                    <td><%= lists.get(id)%></td>
                    <input type="hidden" name="bookid" value="<%= c.getId() %>">
                </form>
                </tr>
                <%
                   }
                %>
            </table>
            
            <h5>Total:<%=total %> VND</h5>
        <%
          }else{
       %>
       <h1 class="text-center">Giỏ hàng trống:33</h1>
       <% } %>
       <%@include file="../footer.jsp" %>
    </body>
</html>

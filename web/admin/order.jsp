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
<link rel ="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src ="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 <style>
     #filter_date{
         display: none;
     }
     
     #filter_user_name{
         display: none;
     }
 </style>
</head>
    <body >
        <!-- bg-image p-5 text-center shadow-1-strong rounded mb-5 text-white -->
        <div class="body">
            <div class="bg-text content">
                <%@include file="headerAdminHome.jsp" %>
                <div class ="container">
                    <h1 class="text-center">Danh sách mua hàng</h1>
                    <h2 class="text-center text-danger">${requestScope.MSG}</h2>
                  <!--filter-->
                  <div>
                      <h4>Bộ lọc</h4>
                      <label>Ngày</label>
                      <input type="radio" name="filter" id="filterdate" onchange="showFilter()" required="required"
                             ${requestScope.action == "filterdate" ?"checked='checked'":""}/>
                      
                      <label>Tên user</label>
                      <input type="radio" name="filter" id="filterusername" onchange="showFilter()"
                             ${requestScope.action == "filterusername" ?"checked='checked'":""} />
                      
                      <div id="filter_date">
                          <form action="${url}/admin-controller" method="post">
                            <input type="hidden" name="action" value="UpdateOrder" />
                            <label>Từ</label>
                            <input type="date" name="fromdate" value="${requestScope.fromdate}"/>
                            <label>Đến</label>
                            <input type="date" name="todate" value="${requestScope.todate}"/>
                            <button class="btn btn-primary" name ="actionAdmin" type="submit" value="filterdate">Lọc</button>
                           </form>
                      </div>
                    <!-- khoi tao list acc de tao combobox-->
                    <jsp:useBean id="accDAO" class="database.AccountDAO" />
                    <c:set var="listAcc" value="${accDAO.selectAccidEmail()}" />
                    <!-- end tao list acc de tao combobox-->
                    
                      <div id="filter_user_name">
                        <div class="dropdown">
                            <input name="email" class = "form-control dropdown-toggle" id = "listbox" type = "text"
                                   data-toggle= "dropdown" placeholder = "Nhập email khách" value="${requestScope.email}">
                            <ul class ="dropdown-menu" id ="listItem" >
                                <c:forEach items="${listAcc.keySet()}" var="accid">
                                    <li> <a href="${url}/admin-controller?action=UpdateOrder&actionAdmin=filterusername&accid=${accid}&email=${listAcc.get(accid)}" class="link-item"> ${listAcc.get(accid)} </a> </li>
                                </c:forEach>
                            </ul>
                        </div>
                          
                      </div>
                        
                  </div>
                  <!--end filter-->
                    <c:set var="listOrder" value="${requestScope.listOrder}" />
                    <!-- khoi tao list acc de tao combobox-->
                    <c:set var="listAllAcc" value="${accDAO.selectAllAccidEmail()}" />
                    <!-- end tao list acc de tao combobox-->
                    <!--Lay list len khi ch filter-->
                    <c:if test="${listOrder == null}" >
                        <jsp:useBean id="orderDAO" class="database.OrderDAO" />
                        <c:set var="listOrder" value="${orderDAO.selectAll()}" />
                    </c:if>
                    <!--Edn lay lít len khi ch filter-->
                    <c:if test="${listOrder != null}">
                        <table class="table mt-4 text-white">
                            <tr class="">
                                 <th scope="col">Orderid</th>
                                <th scope="col">Ngày mua hàng</th>
                                <th scope="col">Ngày ship</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col">EMAIL</th>
                                <th scope="col">CHỌN</th>
                                <th scope="col">CHI TIẾT</th>
                            </tr>
                            <c:set var="status" value="${['','Đang xử lý','Thành công','Bị hủy']}" />
                            <c:forEach items="${listOrder}" var="ord" >
                                <form action="${url}/admin-controller" method="post">
                                    <input type="hidden" name="action" value="UpdateOrder" >
                                       <tr>
                                        <td>${ord.orderID}</td>
                                        <input type ="hidden" name="orderid" value="${ord.orderID}" />
                                        <td>${ord.orderDate}</td>
                                        <input type ="hidden" name="orderdate" value="${ord.orderDate}" />
                                        <td><input type="date" value="${ord.shipDate}" name="shipdate"/></td>
                                        <td><select name="status">
                                                <option value="1" ${ord.status == 1 ?"selected='selected'":""}>Đang sử lý</option>
                                                <option value="2" ${ord.status == 2 ?"selected='selected'":""}>Thành công</option>
                                                <option value="3" ${ord.status == 3 ?"selected='selected'":""}>Bị hủy</option>
                                            </select>
                                        </td>
                                        <td>${!listAllAcc.get(ord.accID).contains("@")?"Khách":listAllAcc.get(ord.accID)}</td>
                                        <td><button class="btn btn-success" name ="actionAdmin" value="update" type="submit">Cập nhật</button></td>
                                        <td><a href="${url}/admin-controller?action=ViewOrderDetail&email=${listAllAcc.get(ord.accID)}&orderid=${ord.orderID}">Chi Tiết</a></td>
                                    </tr>
                                </form>
                            </c:forEach>
                        </table>
                    </c:if>
                </div>
            </div>  
        </div>
    </body>
    <script type="text/javascript">
        const filterDate = document.getElementById("filterdate");
        const filterName =document.getElementById("filterusername");
        filterDateDiv = document.getElementById("filter_date");
        filterNameDiv = document.getElementById("filter_user_name");
        
        if(${requestScope.action == "filterdate"}){
            filterDateDiv.style.display = "block";
        }
        
        if(${requestScope.action == "filterusername"}){
            filterNameDiv.style.display = "block";
        }
        function showFilter(){
            if(filterDate.checked == true){
                filterDateDiv.style.display = "block";
                filterNameDiv.style.display = "none";
            }
            if(filterName.checked == true){
                filterDateDiv.style.display = "none";
                filterNameDiv.style.display = "block";
            }
        }
        
        $(document) .ready(function(){
        $("#listbox") .on("keyup", function() {
        var values = $(this) .val() .toLowerCase();
        $("#listItem li") .filter(function() {
        $(this) .toggle($(this) .text() .toLowerCase() .indexOf(values) > -1)
        });
        });
        });
    </script>
</html>

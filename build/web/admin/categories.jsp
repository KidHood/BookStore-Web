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
    <title>Quản lí thể loại</title>
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
  <style>
        #addNew{
            display:  none;
        }
    </style>
</head>
    <body >
         <%@include file="headerAdminHome.jsp" %>
        <!-- bg-image p-5 text-center shadow-1-strong rounded mb-5 text-white -->
        <div class="body">
            <div class="bg-text contentadmin">
                <div class ="container">
                    <h1 class="text-center">Danh sách thể loại</h1>
                    <h2 class="text-center text-danger">${requestScope.MSG}</h2>
                    <c:set var="listCata" value="${requestScope.listBook}" />
                    <c:set var="listNumBook" value="${requestScope.listNumBook}" />
                    <button class="btn btn-success"  id="btnAddNew" onclick="showAddNew()">Thêm mới thể loại</button>
                    <!--Tao them moi an-->
                    <div class="mt-2 row" id="addNew">
                        <div class=" col-md-4 ">
                            <form class="form-control" action="${url}/admin-controller" method="post">
                                <input type="hidden" name="action" value="UpdateCategories" />
                                 <label for="">Tên cate</label>
                                 <input class ="form-control"type="text" name="newcatename" required="required" name="newcatename" />
                                <button class="btn btn-primary mt-2 text-center " value="addNew"  name="actionAdmin">Thêm mới</button>
                            </form>
                        </div>
                    </div>
                    <!--Tao them moi an-->
                    <c:if test="${listCata != null}">
                        <table class="table mt-4 text-white">
                            <tr class="">
                                <th scope="col">CATA ID</th>
                                <th scope="col">TÊN</th>
                                <th scope="col">SỐ LƯỢNG SÁCH</th>
                                <th scope="col">HÀNH ĐỘNG</th>
                            </tr>
                            <c:forEach items="${listCata.keySet()}" var="id" >
                                <form action="${url}/admin-controller" method="post">
                                    <input type="hidden" name="action" value="UpdateCategories" />
                                <tr>
                                    <td>${id}</td>
                                    <input type="hidden" name="cateid" value="${id}" />
                                    <td><input class="form-control" type ="text" value="${listCata.get(id)}" name="catename"/></td>
                                    <td>${listNumBook.get(id)}</td>
                                    <td>
                                        <button class="btn btn-success" type="submit" value="update" name="actionAdmin">Cập nhật</button>
                                    </td>
                                </tr>
                                </form>
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
    <script type="text/javascript">
        const btnAdd = document.getElementById("btnAddNew");
        function showAddNew() {
            if(btnAdd.innerHTML.valueOf() == 'Thêm mới thể loại'){
                document.getElementById("addNew").style.display="block";
                btnAdd.innerHTML = "X";
                btnAdd.style.background = "red";
            }else if(btnAdd.innerHTML.valueOf() == 'X'){
                document.getElementById("addNew").style.display="none";
                btnAdd.innerHTML = "Thêm mới thể loại";
                btnAdd.style.background = "green";
            }
                
}
    </script>
</html>

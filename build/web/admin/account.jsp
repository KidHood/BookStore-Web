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
        <div class="body">
            <div class="bg-text content">
                <%@include file="headerAdminHome.jsp" %>
                <div class ="container">
                    <h1 class="text-center">Danh sách tài khoản</h1>
                    <h3 class="text-center text-danger">${requestScope.MSG}</h3>
                    <c:set var="list" value="${requestScope.lists}"/>
                    <c:if test="${list != null}">
                        <table class="table mt-4 text-white">
                            <tr class="">
                                <th scope="col">ACC ID</th>
                                <th scope="col">EMAIL</th>
                                <th scope="col">TÊN</th>
                                <th scope="col">SỐ SĐT</th>
                                <th scope="col">TRẠNG THÁI</th>
                                <th scope="col">VAI TRÒ</th>
                                <th scope="col">HÀNH ĐỘNG</th>
                            </tr>
                            <c:forEach items="${list}" var="acc" >
                                <tr>
                                    <td>${acc.accID}</td>
                                    <td>${acc.email}</td>
                                    <td>${acc.fullname}</td>
                                    <td>${acc.phone}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${acc.status == 1}">
                                                <p class="text-success fw-bold text-ouline">Hoạt động</p>
                                            </c:when>
                                             <c:when test="${acc.status == 0}">
                                                 <p class="text-danger fw-bold text-ouline  ">Bị chặn</p>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${acc.role == 0}">
                                                <p>Khách hàng</p>
                                            </c:when>
                                             <c:when test="${acc.role == 1}">
                                                <p>Admin</p>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${acc.status == 1}">
                                                <a class="btn btn-danger " href="${url}/admin-controller?action=ChangeAccountStatus&status=0&accid=${acc.accID}"
                                                   >Block</a>
                                            </c:when>
                                             <c:when test="${acc.status == 0}">
                                                <a class="btn btn-success" href="${url}/admin-controller?action=ChangeAccountStatus&status=1&accid=${acc.accID}">
                                                    Unblock</a>
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
    </body>
</html>

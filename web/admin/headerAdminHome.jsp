<%-- 
    Document   : headerAdminHome
    Created on : Feb 22, 2023, 11:14:00 AM
    Author     : ADMIN
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<c:set var="url" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
 <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
     <div class="container-fluid"><a href="${url}/admin/adminHome.jsp">
         <img src="<c:url value="/img/logo/logo_2.png"/>" ></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                      <a class="nav-link fs-3 text-dark" href="${url}/view-all-account">Manage Account</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link fs-3 text-dark" href="${url}/admin/categories.jsp">Manage Catagories</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link fs-3 text-dark" href="${url}/view-all-book">Manage Book</a>
                    </li>
                     <li class="nav-item">
                      <a class="nav-link fs-3 text-dark" href="${url}/admin/order.jsp">Manage Order</a>
                    </li>
                 </ul>
                <div class="d-flex ms-auto">
                   <ul class="navbar-nav me-auto mb-2 mb-lg-0 bg-infor">
                        <li class="nav-item dropdown"><a
                        class="nav-link dropdown-toggle btn btn-success" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"> Adminstrator</a>
                        <ul class="dropdown-menu  dropdown-menu-end">
                        <li><a class="dropdown-item" href="${url}/main-controller?action=logout">Đăng xuất</a></li>
                        </ul></li>
                    </ul>
                </div>
            </div>
     </div>
    </nav>
  

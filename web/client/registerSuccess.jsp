<%-- 
    Document   : registerSuccess
    Created on : Mar 2, 2023, 5:10:37 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                background-image: url(<c:url value="img/backgroud/backgroud_success.png"/>)  !important; 
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            top: 0;
            left: 0;
            width: 100vh;
            height: 100vh;

        }

        body::before {
            background-repeat: no-repeat;
            filter: blur(2px) brightness(60%) contrast(90%);
        }
        .centered {
            position: absolute;
            top: 25%;
            left: 50%;
            padding: 10px 10px;
            transform: translate(-50%, -50%);
            background-color: rgba(0,0,0,0.5);
            border: solid 2px;
            color:White;    
            font-size: 25px;
          }
          
          .text{
              text-decoration: none;
              color:#C5E90B;
          }
        </style>
    </head>
    <body>
        <c:set var="url" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
        <div class="centered">
            <p>Đăng kí thành công! Vui lòng quay lại trang <strong><a href="${url}/common/login.jsp" class="text">Đăng nhập</a></strong><p>
        </div>
        <script>
         setTimeout(function(){
            window.location.href = "${url}/common/login.jsp";
         }, 5000);
      </script>
    </body>
</html>

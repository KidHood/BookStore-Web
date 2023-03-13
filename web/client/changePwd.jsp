<%@page import="model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đổi mật khẩu</title>
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
<link rel="stylesheet" href="https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/docs-app/css/dist/mdb5/standard/core.min.css">   
<link rel='stylesheet' id='roboto-subset.css-css'  href='https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/docs-app/css/mdb5/fonts/roboto-subset.css?ver=3.9.0-update.5' type='text/css' media='all' />
 <link href="<c:url value="/css/style.css"/>" rel="stylesheet">
 <link href="<c:url value="/css/style_detail.css"/>" rel="stylesheet">
  <link href="<c:url value="${url}/css/style_register.css" />" rel="stylesheet">
</head>
<style>
	.red{
		color:red;
	}
</style>
<body>
      <%@include file ="../common/header.jsp" %>
      <div class="container content">
            <c:if test="${acc == null}">
                <h1>Bạn chưa đăng nhập vui lòng truy cập <a href="${url}/common/login.jsp">Đăng nhập</a> để đăng nhập!</h1>
            </c:if>
            <c:if test="${acc != null}">
             <div class="mask d-flex align-items-center h-100 gradient-custom-3  mt-4">
                <div class="container h-100">
                  <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                      <div class="card" style="border-radius: 15px;">
                        <div class="card-body p-5">
                          <h2 class="text-uppercase text-center mb-5">Đổi Mật Khẩu</h2>
                          <div class="red text-center" id="error">
                            ${requestScope.error}
                            </div>
                          <form class="form" action="${url}/main-controller" method="post">
                            <input type="hidden" name="action" value = "change-pwd"> 
                           <div class="form-outline mb-4">
                              <input type="password" id="password" class="form-control form-control-lg input-change" name ="currentPwd" required="required"/>
                              <label class="form-label" for="form3Example4cg">Mật khẩu kiện tại <span class="red">${requestScope.password}</span></label>
                            </div>
                            <div class="form-outline mb-4">
                              <input type="password" id="newPwd" class="form-control form-control-lg input-change"  name="newPwd" onkeyup="checkPwd()" required="required"/>
                              <label class="form-label" for="form3Example4cg">Mật khẩu <span class="red">${requestScope.password}</span></label>
                            </div>

                            <div class="form-outline mb-4">
                              <input type="password" id="confirmPwd" class="form-control form-control-lg input-change"  name="confirmPwd" onkeyup="checkPwd()" required="required" />
                              <label class="form-label" for="form3Example4cdg">Mật khẩu nhập lại <span class="red" id="msg"></span></label>
                            </div>


                            <div class="d-flex justify-content-center">
                              <button 
                                class="btn btn-primary btn-block btn-lg " type="submit" id="submit">Thay đổi</button>
                            </div>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
        </c:if>
    </div>
        <%@include file ="../common/footer.jsp" %>
        <script src="<c:url value="${url}/js/jsFormRegister.js"/>"></script>
</body>
	<script type="text/javascript">
		function checkPwd(){
			pwd = document.getElementById("newPwd").value;
			confirmPwd = document.getElementById("confirmPwd").value;
			if(pwd != confirmPwd){
				document.getElementById("msg").innerHTML = "Mật khẩu không khớp!";
				return false;
			}else{
				document.getElementById("msg").innerHTML = "";
			}
			
		}
	</script>
</html>
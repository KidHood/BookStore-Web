<%@page import="model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<style>
	.red{
		color:red;
	}
</style>
<body>
     <%@include file="../header.jsp" %>
	<% 
		
		if(acc == null){
	%>
	<h1>Bạn chưa đăng nhập vui lòng truy cập <a href="<%=url %>/index.jsp">Trang chủ</a> để đăng nhập!</h1>
	<%	
		}else{
			String error = request.getAttribute("error") + "";
			if(error.equals("null")){
				error = "";
			}
	%>
	<main class="container">
         <div class="text-center"><h1>ĐỔI MẬT KHẨU</h1></div>
	<span class="red">
		<%=error %>
	</span>
	<form action="<%=url %>/main-controller" method="post">
	<input type="hidden" name="action" value = "change-pwd"> 
	  <div class="form-group">
	    <label for="currentPwd">Mật khẩu hiện tại</label>
	    <input type="password" class="form-control" id="currentPwd" aria-describedby="currentPwd" name ="currentPwd" required="required">
	  </div>
	  <div class="form-group">
	    <label for="newPwd">Mật khẩu mới</label>
	    <input type="password" class="form-control" id="newPwd" name="newPwd" onkeyup="checkPwd()" required="required">
	  </div>
	  <div class="form-group">
	    <label for="confirmPwd">Mật khẩu nhập lại <span class="red" id="msg"></span></label>
	    <input type="password" class="form-control" id="confirmPwd" name="confirmPwd" onkeyup="checkPwd()" required="required">
	  </div>
	  <button type="submit" class="btn btn-primary mt-1">Lưu mật khẩu</button>
	</form>
	</main>
	<%		} %>
        <%@include file="../footer.jsp" %>
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
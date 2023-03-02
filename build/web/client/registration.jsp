<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-with, initial-scale-1, skrink-to-fit=no">
<title>Đăng kí</title>
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
</head>
	<style>
		.red{
			color: red;
		}
	</style>
<body>
     <%@include file ="../common/header.jsp" %>
	<div class="container content">
	<div class="text-center mt-4">
		<h1>ĐĂNG KÝ TÀI KHOẢN</h1>
		<div class="red" id="error">
                    ${requestScope.error}
		</div>
	</div>
		<form class="form" action="${url}/main-controller" method="post">
		<input type="hidden" name="action" value = "register"> 
		<div class="row">
			<div class="col-md-6">
				<h3>Tài khoản</h3>
				<div class="mb-3">
				  <label for="user" class="user">Tên đăng nhập<span class = "red">*</span></label>
                                  <input type="text" class="form-control" id="user" placeholder="" name ="user" required="required" value="${requestScope.user}">
				</div>
				<div class="mb-3">
				  <label for="password" class="user">Mật khẩu<span class = "red">*</span></label>
				  <input type="password" class="form-control" id="password" placeholder="" name ="password" required="required" onkeyup="checkPassword()">
				</div>
				<div class="mb-3">
				  <label for="comfirmPwd" class="comfirmPwd">Nhập lại mật khẩu<span class = "red">*</span><span class="red" id="msg"></span></label>
				  <input type="password" class="form-control" id="comfirmPwd" placeholder="" name="comfirmPwd" required="required" onkeyup="checkPassword()">
				</div>
                        </div>
                        <div class="col-md-6">
				<h3>Thông tin khách hàng</h3>
				<div class="mb-3">
				  <label for="fullName" class="fullName">Họ và Tên</label>
                                  <input type="text" class="form-control" id="fullName" placeholder="" name = "fullName" value="${requestScope.fullName}">
				</div>
                                <div class="mb-3">
				  <label for="fullName" class="fullName">Số điện thoại</label>
                                  <input type="text" class="form-control" id="phone" placeholder="" name = "phone" value="${requestScope.phone}">
				</div>
				
			</div>
				<div class="mb-3">
				  <label for="agreeTerms" class="email"><a>Đồng ý với điều khoản của công ty</a><span class="red">*</span></label>
				  <input type="checkbox" class="form-check-input" id="agreeTerms" name = "agreeTerms" required="required" onchange="checkAgreeTerms()">
				</div>
                                <input class="btn btn-primary form-control disabled" type="submit" value="Đăng ký" id="submit" >
		</form>
            </div>
        </div>                       
      <%@include file ="../common/footer.jsp" %>
</body>
	<script type="text/javascript">
	function checkPassword(){
			 password = document.getElementById("password").value;
			 confirmpwd = document.getElementById("comfirmPwd").value;
			if(password != confirmpwd){
				document.getElementById("msg").innerHTML = "Mật khẩu không khớp!";
				return false;
			}else{
				document.getElementById("msg").innerHTML = "";
			}
	}

        
	function checkAgreeTerms(){
		agreeTerms = document.getElementById("agreeTerms");
                const btnTerm = document.querySelector("#submit");
		if(agreeTerms.checked == true)
			btnTerm.classList.remove('disabled');
		else{
			btnTerm.classList.add('disabled');
		}
			
	}
	</script>
</html>
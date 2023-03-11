<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d"%>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/docs-app/css/dist/mdb5/standard/core.min.css">   
<link rel='stylesheet' id='roboto-subset.css-css'  href='https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/docs-app/css/mdb5/fonts/roboto-subset.css?ver=3.9.0-update.5' type='text/css' media='all' />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />           
 <link href="../css/style.css" rel="stylesheet">
 <link href="<d:url value="../css/style_register.css" />" rel="stylesheet">
</head>
	<style>
		.red{
			color: red;
		}
	</style>
<body>
     <%@include file ="../common/header.jsp" %>
	<div class=" content">
            <section class="vh-100 bg-image"
              style="background-image: url('../img/backgroud/backgroud_admin2.png');">
              <div class="mask d-flex align-items-center h-100 gradient-custom-3  mt-4">
                <div class="container h-100">
                  <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                      <div class="card" style="border-radius: 15px;">
                        <div class="card-body p-5">
                          <h2 class="text-uppercase text-center mb-5">Tạo tài khoản</h2>
                          <div class="red text-center" id="error">
                            ${requestScope.error}
                            </div>
                          <form class="form" action="${url}/main-controller" method="post">
                            <input type="hidden" name="action" value = "register"> 
                            <div class="form-outline mb-4">
                                <input type="email" id="form3Example1cg" class="form-control form-control-lg input-change "  name ="user" required="required" value="${requestScope.txtemail}" />
                                <label class="form-label" for="form3Example1cg">Email của bạn <span class="red">${requestScope.email}</span></label>
                            </div>

                            <div class="form-outline mb-4">
                              <input type="text" id="form3Example2cg" class="form-control form-control-lg input-change" name = "fullName" value="${requestScope.txtname}" />
                              <label class="form-label" for="form3Example3cg">Tên của bạn</label>
                            </div>
                             <div class="form-outline mb-4">
                              <input type="text" id="form3Example3cg" class="form-control form-control-lg input-change" name = "phone" value="${requestScope.txtphone}"  />
                              <label class="form-label" for="form3Example3cg">Số điện thoại <span class="red">${requestScope.phone}</span></label>
                            </div>
                            <div class="form-outline mb-4">
                              <input type="password" id="password" class="form-control form-control-lg input-change" name ="password"  onkeyup="checkPassword()"/>
                              <label class="form-label" for="form3Example4cg">Mật Khẩu <span class="red" id="msg"></span><span class="red">${requestScope.password}</span></label>
                            </div>

                            <div class="form-outline mb-4">
                              <input type="password" id="comfirmPwd" class="form-control form-control-lg input-change" name="comfirmPwd" onkeyup="checkPassword()" />
                              <label class="form-label" for="form3Example4cdg">Mật khẩu nhập lại <span class="red" id="msg"></span></label>
                            </div>

                            <div class="form-check d-flex justify-content-center mb-5">
                              <input class="form-check-input me-2" type="checkbox" value=""  id="agreeTerms" name = "agreeTerms" required="required" onchange="checkAgreeTerms()"/>
                              <label class="form-check-label" for="form2Example3g">
                                Đồng ý với điều khoản của công ty <a href="#!" class="text-body"><u>Điều khoản dịch vụ</u></a>
                              </label>
                            </div>

                            <div class="d-flex justify-content-center">
                              <button 
                                class="btn btn-primary btn-block btn-lg  disabled" type="submit" id="submit">Đăng ký</button>
                            </div>

                            <p class="text-center text-muted mt-5 mb-0">Đã có tài khoản <a href="${url}/common/login.jsp"
                                class="fw-bold text-body"><u>Đăng nhập đây</u></a></p>

                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </section>
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
        
        if(${requestScope.txtemail != null}){
            document.getElementById("form3Example1cg").classList.add('active');
        }
        if(${requestScope.txtname != null}){
            document.getElementById("form3Example2cg").classList.add('active');
        }
        if(${requestScope.txtphone != null}){
            document.getElementById("form3Example3cg").classList.add('active');
        }
        var inputItems = document.querySelectorAll('.input-change').forEach((el =>{
            el.oninput = (e) => {
                if(e.target.value != ''){
                    e.target.classList.add('active');
                } else {
                    e.target.classList.remove('active');
                }
            }
                
        }))
        
        
	</script>
</html>
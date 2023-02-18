<%@page import="model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>BookStore</title>
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
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">

</head>
<body>
    <jsp:include page="header.jsp"/>
    <%
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();
    %>
	<!-- End Navbar -->
	<!-- Page content -->
	<div class="container mt-4">
		<div class="row">
			<!-- Menu left -->
                        <!--
			<div class="col-lg-3">
				<div class="list-group ">
					<a href="#" class="list-group-item list-group-item-action">
						Sách tâm lí học </a> <a href="#"
						class="list-group-item list-group-item-action">Sách tài chính</a> <a
						href="#" class="list-group-item list-group-item-action">Sách cho trẻ em</a>
				</div>
			</div>
                        -->
			<!-- End Menu left -->

			<!-- Slider and Products -->
			<div class="container">
				<!-- Slider -->
				<div id="carouselExampleIndicators" class="carousel slide mb-4"
					data-bs-ride="true">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="<%=url%>/img/myslider/1.png" class="d-block w-100" alt="..." style="height: 300px">
						</div>
						<div class="carousel-item">
							<img src="<%=url%>/img/myslider/2.png" class="d-block w-100" alt="..." style="height: 300px">
						</div>
						<div class="carousel-item">
							<img src="<%=url%>/img/myslider/3.png" class="d-block w-100" alt="..." style="height: 300px">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<!-- End Slider -->
				<!-- Products -->
                                <div class="row container-card" style="justify-content: center;">
					
                                            <% 
                                                ArrayList<Book> list = (ArrayList<Book>) request.getAttribute("list");
                                                if(list != null) {
                                                    
                                                for(Book book : list){
                                            %> 
                                            <div class="card" style="width: 18rem;">
                                                <img class="card-img-top" src="<%=book.getImgPath() %>" alt="Card image cap">
                                                <div class="card-body">
                                                    <h5 class="card-title"><a href="<%=url %>/main-controller?action=view-book-detail&bid=<%=book.getId() %>"><%=book.getName() %></a></h5>
                                                  <h6><%=book.getPrice() %> VND</h6>
                                                  <p class="card-text"><%=book.getCatename() %></p>
                                                  <a href="<%=url %>/main-controller?action=add-to-cart&bid=<%=book.getId() %>" class="btn btn-primary btn-add-cart">Add to cart</a>
                                                </div>
                                             </div> 
                                            <%                      } } %>
					
				</div>
				<!-- End Products -->
			</div>
			<!-- End Slider and Products -->
		</div>
	</div>
	<!-- End Page content -->

	<!-- Footer -->
        <%@include file="footer.jsp" %>
	<!-- End footer -->
        <%
          //doc msg tu trang addtocartservlet
          String msg=(String)request.getAttribute("MSG");
          if(msg!=null){
        %>
        <script>
           alert("Thêm thành công vào giỏ hàng")    ;
        </script>
        <%
          }
        %>
</body>
<script>

</script>
</html>
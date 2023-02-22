<%@page import="model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
 <link href="<c:url value="/css/style.css"/>" rel="stylesheet">
</head>
<body>
    <jsp:include page="common/header.jsp"/>
    <c:set var="url" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
	<!-- End Navbar -->
	<!-- Page content -->
	<div class="container mt-4">
		<div class="row">
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
							<img src="${url}/img/myslider/1.png" class="d-block w-100" alt="..." style="height: 300px">
						</div>
						<div class="carousel-item">
							<img src="${url}/img/myslider/2.png" class="d-block w-100" alt="..." style="height: 300px">
						</div>
						<div class="carousel-item">
							<img src="${url}/img/myslider/3.png" class="d-block w-100" alt="..." style="height: 300px">
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
                                <c:set var="list" value="${requestScope.list}" />
                                <c:if test="${list != null}"  >
                                    <c:forEach items="${list}" var ="book">
                                        <div class="card" style="width: 18rem;">
                                            <img class="card-img-top" src="${book.getImgPath()}" alt="Card image cap">
                                            <div class="card-body">
                                                <h5 class="card-title"><a href="${url}/main-controller?action=view-book-detail&bid=${book.id}">${book.name}</a></h5>
                                              <h6>Price: ${book.getPrice()} VND</h6>
                                              <p class="card-text">${book.name}</p>
                                              <a href="${url}/main-controller?action=add-to-cart&bid=${book.id}" class="btn btn-primary btn-add-cart">Add to cart</a>
                                            </div>
                                         </div> 
                                    </c:forEach>
                                </c:if>
				</div>
				<!-- End Products -->
			</div>
			<!-- End Slider and Products -->
		</div>
	</div>
	<!-- End Page content -->
        
        <!--begin page number -->
        <c:set var="numPage" value="${requestScope.numpage}" />
        <div class="mt-4 d-flex">
            <nav aria-label="..." class="justify-content-center m-auto">
                <ul class="pagination">
                    <c:if test="${numPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="${url}/main-controller?action=home&numberpage=${numPage-1}">Trước</a>
                          </li>
                    </c:if>
                  <li class="page-item active">
                    <span class="page-link">
                      ${numPage}
                      <span class="sr-only">(current)</span>
                    </span>
                  </li>
                  <li class="page-item"><a class="page-link" href="${url}/main-controller?action=home&numberpage=${(numPage+1)}">
                          ${(numPage + 1) }</a></li>
                  <li class="page-item"><a class="page-link" href="${url}/main-controller?action=home&numberpage=${(numPage+2)}">
                          ${(numPage + 2)}</a></li>
                </ul>
            </nav>
        </div>
         <!--end page number -->
        
	<!-- Footer -->
        <%@include file ="../common/footer.jsp" %>
	<!-- End footer -->
        <style>
            .footer{
                position: relative;
            }
        </style>
        <c:set var="msg" value="${requestScope.MSG}" />
        <c:if test="${msg != null}" >
        <script>
           alert("Thêm thành công vào giỏ hàng")    ;
        </script>
        </c:if>
</body>
<script>

</script>
</html>
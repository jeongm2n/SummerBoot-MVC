<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file="./common/header.jsp" %>
    <link rel="stylesheet" href="${path}/resources/assets/css/custom_lee.css">
</head>
<body>
	<% String file_repo = "/summerboot2/resources/assets/img/"; %>
	
	<section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3 mb-5">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">지점 정보</h1>
                </div>
            </div>
            <c:forEach var="list" items="${washList }">
            <div class="row">
                <div class="mb-4">
                    <div class="card h-100">
                        <img src="<%=file_repo %>${list.img}" class="card-img-top washList" alt="...">
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between star">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                </li>
                                <li class="h3 text-decoration-none text-dark text-right">${list.name }</li>
                            </ul>
                            <div class="list">
	                            <i class="fa fa-map-marker-alt"></i>
	   	                        <span class="card-text h3" onclick = "map('${list.no }');" style="cursor: pointer;">${list.address } </span>
                            </div>
                            <div class="list">
	                            <i class="fa fa-clock"></i>
	   	                        <span class="card-text h3 h3">
	                           		 AM 9:00 ~ PM 12:00
	   	                        </span>
   	                        </div>
   	                        <div class="list">
	                            <i class="fa fa-phone"></i>
	                            <span class="card-text h3">
	                           		 02-2205-0109
	   	                        </span>
   	                        </div>
                            <p class="text-muted pt-4">Reviews (24)</p>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </section>
    
    <%@ include file="./common/footer.jsp" %>
</body>
</html>

<script>
	function map(store) {
		window.open("http://localhost:8060/summerboot2/branch/map?store=" + store, 'name(about:blank)', 'width=500, height=500');
	}
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="${path}/resources/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/assets/img/favicon.ico">
    
    <link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/templatemo.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/custom.css">

    <link rel="stylesheet" href="${path}/resources/assets/css/fontawesome.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Handjet:wght@300&family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Handjet:wght@700;800;&family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />

</head>

<body>
	<% String user_id = (String)session.getAttribute("user_id"); %>

	<nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-washboot logo medium h1 align-self-center" href="#">
                WashBoot
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
							<a class="nav-link" href="${path}/WEB-INF/views/washList.jsp">지점</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="about.html">예약</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="shop.html">세차용품</a>
                        </li>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 me-3 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                        </div>
                    </div>
                    <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                        <i class="fa fa-fw fa-search text-dark mr-2"></i>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                        <% if(user_id != null) { %>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">7</span>
                   		<% } else { %>
                   		<span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span>
                   		<% } %>
                    </a>
					<% if(user_id != null) { %>
                    <ul class="navbar-nav flex-row align-items-center justify-content-end">
						<li class="nav-item dropdown">
						  <a class="nav-icon-hover menu" href="#" id="drop2" data-bs-toggle="dropdown" aria-expanded="false">
					        <i class="fa fa-fw fa-user text-dark mr-3"></i>
						  </a>
						  <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
						    <div class="message-body">
						      <a href="#" class="d-flex align-items-center gap-2 dropdown-item">
						        <i class="fa fa-user fs-6"></i><span>내 정보</span>
						      </a>
						      <a href="#" class="d-flex align-items-center gap-2 dropdown-item">
						        <i class="fa fa-calendar-check fs-6"></i><span>예약확인</span>
						      </a>
						      <a href="#" class="d-flex align-items-center gap-2 dropdown-item">
						        <i class="fa fa-wallet fs-6"></i><span>주문확인</span>
						      </a>
						      <a href="${path }/member/logout" class="btn btn-join mx-3 mt-2 d-block" style="color:#FD8008">Logout</a>
						    </div>
						  </div>
						</li>
					</ul>
                    	<% } else { %>
                    <a class="nav-icon position-relative text-decoration-none" href="login">
                        <i class="fa fa-fw fa-user text-dark mr-3"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span>
                    </a>
                    	<% } %>
                </div>
            </div>

        </div>
    </nav>
</body>
</html>
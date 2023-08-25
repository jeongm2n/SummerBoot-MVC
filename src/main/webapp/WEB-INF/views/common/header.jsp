<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

	<title>Wash Boot</title>
    <jsp:include page="/WEB-INF/common.jsp" />
    <link rel="stylesheet" href="${path}/resources/assets/css/custom_ryu.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/custom_lee.css">
</head>

	<% String user_id = (String)session.getAttribute("user_id"); %>
    <!--Start Top -->
    <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
        <div class="container text-light">
            <div class="w-100 d-flex justify-content-between">
                <div>Wash Boot에 오신걸 환영합니다!
                    <%--                로그인시 '아이디님'표시하기--%>
                </div>
            </div>
        </div>
    </nav>
    <!--End Top -->

    <!--Start Nav -->
	<nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-washboot logo medium h1 align-self-center" href="${path}">
                Wash Boot
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
							<a class="nav-link" href="${path}/branch/list">지점</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${path}/reservation/reservation1">예약</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${path}/shop/main/전체,1,0">세차용품</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${path}/community/faq">커뮤니티</a>
                        </li>
                    </ul>
                </div>
                <!--로그인버튼-->
                
                <!--로그인버튼-->
                <div class="navbar align-self-center d-flex">
					<% if(user_id != null) { %>
					<a class="nav-icon position-relative text-decoration-none" href="${path}/cart/my_cart">
                        <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                       <!--  <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">7</span> -->
                    </a>
                    <ul class="navbar-nav flex-row align-items-center justify-content-end">
						<li class="nav-item dropdown">
						  <a class="nav-icon-hover menu" href="#" id="drop2" data-bs-toggle="dropdown" aria-expanded="false">
					        <i class="fa fa-fw fa-user text-dark mr-3"></i>
						  </a>
						  <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
						    <div class="message-body">
						      <a href="${path}/member/my_info" class="d-flex align-items-center gap-2 dropdown-item">
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
                    <div>
                    <form action="${path }/member/login" method="get"><button class="login_btn" type="submit">로그인
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
                            <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
                        </svg>
                    </button></form>
              	  </div>
                   	<% } %>
                </div>
            </div>

        </div>
    </nav>
</html>
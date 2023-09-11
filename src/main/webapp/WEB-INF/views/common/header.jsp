<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

	<title>Wash Boot</title>
    <link rel="stylesheet" href="${path}/resources/assets/css/custom_ryu.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/custom_lee.css">
    <% String user_id = (String)session.getAttribute("user_id"); %>
    <script>
    	function gomyres(){
    		const date = new Date();
			const realMonth = date.getMonth()+1; 
			const realToDay = date.getDate();

			const currentMonth = realMonth >= 10 ? realMonth : "0" + realMonth;
			const currentDate = date.getDate() >= 10 ? date.getDate() : "0" +date.getDate();
			
			const nowdate = currentMonth + "-" + currentDate;
			
			const hour = String(date.getHours()).padStart(2,"0");
			const minutes = String(date.getMinutes()).padStart(2,"0");
			
			const nowtime = hour + ":" + minutes;
			
    		location.href="${path }/reservation/chkmyres?user_id=<%=user_id%>&date="+nowdate+"&nowtime="+nowtime;
    	}
    </script>
</head>
	<div style="position:fixed;z-index:100;width:100%;top:0;">
	    <!--Start Top -->
	    <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
	        <div class="container text-light">
	            <div class="w-100 d-flex justify-content-between">
	                <div>
	                    <%
							if (user_id != null) {
						%>
								Wash Boot에 오신걸 환영합니다! <%=user_id%>님
						<%
							} else {
						%>
							Wash Boot에 오신걸 환영합니다!
	                    <%
							}
	                    %>
	                </div>
	            </div>
	        </div>
	    </nav>
	    <!--End Top -->
	
	    <!--Start Nav -->
		<nav class="navbar navbar-expand-lg navbar-light shadow" style="height: 13%;background:white;">
	        <div class="container d-flex justify-content-between align-items-center">
	
	            <a class="navbar-brand logo medium align-self-center" href="${path}">
	            <img src="${path}/resources/assets/img/Logo5.png" style="width:27%;"></a>
	            
	
	            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	                <span class="navbar-toggler-icon"></span>
	            </button>
	
	            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
	                <div class="flex-fill">
	                    <ul class="nav-menu">
	                        <li class="nav-item">
	                            <a class="nav-link" href="${path}/shop/main/전체,1,0">세차용품</a>
	                        </li>
	                        <li class="nav-item">
	                            <a class="nav-link" href="${path}/community/qna">커뮤니티</a>
	                        </li>
	                    </ul>
	                </div>
	           </div>
				<!--로그인버튼-->
				<% if(user_id != null) { %>
				<div class="navbar align-self-center" style="width:20%;justify-content: space-around;">
					<a class="nav-icon position-relative text-decoration-none" href="${path}/cart/my_cart">
						<i class="fa fa-fw nav-fa fa-cart-arrow-down text-dark mr-1"></i>
					</a>
					<ul class="navbar-nav flex-row">
						<li class="nav-item dropdown">
							<a class="nav-icon-hover menu" href="#" id="drop2" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="fa fa-fw nav-fa fa-user text-dark mr-3"></i>
							</a>
							<div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
								<div class="message-body">
									<a href="${path}/member/my_info" class="d-flex align-items-center gap-2 dropdown-item">
										<i class="fa fa-user fs-6"></i><span>내 정보</span>
									</a>
									<a href="#" onclick="gomyres();" class="d-flex align-items-center gap-2 dropdown-item">
									<i class="fa fa-calendar-check fs-6"></i><span>예약확인</span>
									</a>
	                              	<a href="${path}/member/check_pur" class="d-flex align-items-center gap-2 dropdown-item">
										<i class="fa fa-wallet fs-6"></i><span>주문확인</span>
									</a>
									<a href="${path }/member/logout" class="btn btn-join mx-3 mt-2 d-block" style="color:#FD8008">Logout</a>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<% } else { %>
				<div style="width:20%;">
					<button class="btn-join" onclick="location.href='${path }/member/login'">로그인</button>
				</div>
				<% } %>
	
			</div>
		</nav>
	</div>
</html>

<style>
	.nav-menu {
	    display: flex;
	    list-style: none;
	    flex-wrap: wrap;
	    margin-right:10%;
	    justify-content: flex-end;
	    margin-bottom: 0;
	}
	.nav-item {
		width:40%;
	}
	.nav-link {
	    font-family: 'IBM Plex Sans KR', sans-serif;
    	font-size: 22px !important
	}
	
	.nav-fa{font-size:1.2rem !important;}
</style>
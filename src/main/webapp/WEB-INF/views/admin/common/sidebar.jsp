<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-washboot sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${path}/admin/">
                <div class="sidebar-brand-icon rotate-n-15">
                    <img src="${path}/resources/assets/img/carwash.png" width="35px;">
                </div>
                <div class="sidebar-brand-text mx-3">WASHBOOT</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="${path}/admin/">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                회원관리
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link" href="${path}/admin/userList">
                    <i class="fas fa-fw fa-user"></i>
                    <span>회원리스트</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                지점관리
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseStores"
                    aria-expanded="true" aria-controls="collapseStores">
                    <i class="fas fa-fw fa-store"></i>
                    <span>지점</span>
                </a>
                <div id="collapseStores" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${path}/admin/store/storeList?no=1">지점리스트</a>
                        <a class="collapse-item" href="${path}/admin/store/storeForm">지점 추가</a>
                    </div>
                </div>
            </li>
			
			<!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseReservation"
                    aria-expanded="true" aria-controls="collapseReservation">
                    <i class="fas fa-fw fa-calendar"></i>
                    <span>예약관리</span>
                </a>
                <div id="collapseReservation" class="collapse" aria-labelledby="headingPages"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">지점명:</h6>
                        <a class="collapse-item" href="${path}/admin/reservationList1?no=1&res_date=">양평로점</a>
                        <a class="collapse-item" href="${path}/admin/reservationList1?no=2&res_date=">경인로점</a>
                        <a class="collapse-item" href="${path}/admin/reservationList1?no=3&res_date=">천왕점</a>
                        <a class="collapse-item" href="${path}/admin/reservationList1?no=4&res_date=">가제1동점</a>
                        <a class="collapse-item" href="${path}/admin/reservationList1?no=5&res_date=">강동성안점</a>
                        <a class="collapse-item" href="${path}/admin/reservationList1?no=6&res_date=">성동마장점</a>
                        <a class="collapse-item" href="${path}/admin/reservationList1?no=7&res_date=">성북종암점</a>
                        <a class="collapse-item" href="${path}/admin/reservationList1?no=8&res_date=">은평갈현점</a>
                        <a class="collapse-item" href="${path}/admin/reservationList1?no=9&res_date=">관악봉천점</a>
                        <a class="collapse-item" href="${path}/admin/reservationList1?no=10&res_date=">용문점</a>
                    </div>
                </div>
            </li>
			
            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-fw fa-table"></i>
                    <span>지점별 매출</span></a>
            </li>
            
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

			<!-- Heading -->
            <div class="sidebar-heading">
                상품
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseProduct"
                    aria-expanded="true" aria-controls="collapseProduct">
                    <i class="fas fa-fw fa-store"></i>
                    <span>상품관리</span>
                </a>
                <div id="collapseProduct" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${path}/admin/productList">상품 조회</a>
                        <a class="collapse-item" href="${path}/admin/productForm">상품 등록</a>
                    </div>
                </div>
            </li>

              <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOrder"
                    aria-expanded="true" aria-controls="collapseOrder">
                    <i class="fas fa-fw fa-store"></i>
                    <span>주문관리</span>
                </a>
                <div id="collapseOrder" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${path}/admin/order/orderList">주문확인</a>
                    </div>
                </div>
            </li>

			<!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

			<!-- Heading -->
            <div class="sidebar-heading">
                문의
            </div>
			<li class="nav-item">
                <a class="nav-link" href="${path}/admin/community/inquiry">
                    <i class="fas fa-fw fa-comments"></i>
                    <span>문의관리</span>
                </a>
            </li>

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->    
        
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WASHBOOT 지점</title>
	<%@ include file="./common/header.jsp" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</head>
<body>
	<section class="container py-5">
        <div class="row text-center pt-5 pb-3">
            <div class="col-lg-6 m-auto">
                <h1 class="h1">Q & A</h1>
            </div>
        </div>
        <div class="row choose">
            <div class="pb-5 ch">
                <div class="services-icon-wap shadow" style="height: 65%;">
                    <h2 class="h5 mt-4 text-center" style="padding-top : 7%;">세차장</h2>
                </div>
            </div>

            <div class="pb-5 ch">
                <div class="services-icon-wap shadow" style="height: 70%;">
                    <h2 class="h5 mt-4 text-center" style="padding-top : 7%;">상품</h2>
                </div>
            </div>
        </div>
    </section>
    <!-- End Section -->
    
    <%@ include file="./common/footer.jsp" %>
</body>
</html>

<style>
	.choose {
		justify-content: center;
	}
	
	.ch {
		margin-right : 2%;
		width : 15%;
	}
</style>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common.jsp"%>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${path}/resources/assets/css/custom_seo.css">
</head>
<body>
<div class="card qrPopup">
	<img src="${path }/resources/assets/img/qr/${qrCode}" class="card-img-top qrImg">
<!-- 	<div class="card-body"> -->
<!-- 	</div> -->
</div>
</body>
</html>
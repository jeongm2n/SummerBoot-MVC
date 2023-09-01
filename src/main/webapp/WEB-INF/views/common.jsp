<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="ko">
<head>
    <title>Wash Boot</title>

    <link rel="apple-touch-icon" href="${path}/resources/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="${path}/resources/assets/img/favicon.ico">

    <link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/templatemo.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="${path}/resources/assets/css/fontawesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Handjet:wght@300&family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Handjet:wght@700;800;&family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js" crossorigin="anonymous" type="text/javascript"></script>
</head>
</html>

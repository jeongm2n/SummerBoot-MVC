<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="../resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/assets/css/templatemo.css">
    <link rel="stylesheet" href="../resources/assets/css/custom_seo.css">
<title>자리선택</title>
</head>
<body>
 <%
 		String shopName = (String)request.getParameter("shopName");
    	String date = (String)request.getParameter("date");
    	String startTime = (String)request.getParameter("startTime");
    	String useTime = (String)request.getParameter("useTime");
    %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> 
<%@ include file="../common/header.jsp" %>
    <div class="div-margin" style="text-align:center;width:75%;height:80px">
    	<span class="border border-4" style="display:inline-block;width:25%;height:50px;float:left">지점:<%=shopName %></span>
    	<span class="border border-4" style="display:inline-block;width:60%;height:80px;float:right">날짜:<%=date %>&nbsp;&nbsp;시간:<%=startTime %></span>
    </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
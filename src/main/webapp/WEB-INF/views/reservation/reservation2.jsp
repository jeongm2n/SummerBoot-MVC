<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   	<%@ include file="../common/header.jsp" %>
    <link rel="stylesheet" href="../resources/assets/css/custom_seo.css">
<title>자리선택</title>
</head>
<body>
 <%
 	int no = Integer.parseInt(request.getParameter("no"));
 	String shopName = (String)request.getParameter("no");
    String date = (String)request.getParameter("date");
    String startTime = (String)request.getParameter("startTime");
    String useTime = (String)request.getParameter("useTime");
%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> 
<div id="wrapper" style="text-align:center">
	<div style="padding-left:200px;padding-right:200px;display:inline-block">
		<div class="border border-4 div-margin">
	    	<table class="table table-borderless" style="text-align:center;width:100%;heigth:100px">
	    	<tr><th>지점명</th><th>선택날짜</th><th>예약시간</th><th>이용시간</th></tr>
	    	<tr><td><%=shopName %></td><td><%=date %></td><td><%=startTime %></td><td><%=useTime %></td></tr>
	    	</table>
	    </div>
	</div>
	
	<div style="padding-left:100px;padding-right:100px;margin-top:30px">
		<div class="row" style="width:100%;margin-bottom:10px">
			<div class="col-5" style="width:40%"><img style="width:100%" src="${path}/resources/assets/img/Line.png"/></div>
			<div class="col-2" style="width:20%"><font style="size:20pt">Entrance</font></div>
			<div class="col-5" style="width:40%"><img style="width:100%" src="${path}/resources/assets/img/Line.png"/></div>
		</div>
		<div style="width:100%;margin-bottom:20px;height:50px">
		<img class="float-end" style="width:100px;height:auto;"src="${path}/resources/assets/img/legend.png">
		</div>
		<div style="width:100%;height:1000px">
			<div style="width:50%;float:left;padding-right:400px">
			<c:forEach var="site" items="${sites }" begin="1" end="4" varStatus="status">
				<div class="float-start" style="width:200px">
				<c:if test="${site eq 0}">
				<img src="${path}/resources/assets/img/car_white.png" style="width:100%">site ${status.index }
				</c:if>
				<c:if test="${site eq 1}">
				<img src="${path}/resources/assets/img/car_orange.png" style="width:100%">site ${status.index }
				</c:if>
				</div>
			</c:forEach>
			</div>
			
			<div style="width:50%;float:right;padding-left:400px">
			<c:forEach var="site" items="${sites }" begin="5" end="8" varStatus="status">
				<div style="width:200px">
				<c:if test="${site==0}">
				<img src="${path}/resources/assets/img/car_white.png" style="width:100%">site ${status.index }
				</c:if>
				<c:if test="${site==1}">
				<img src="${path}/resources/assets/img/car_orange.png" style="width:100%">site ${status.index }
				</c:if>
				</div>
			</c:forEach>
			</div>
			
		</div>
	</div>
	
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
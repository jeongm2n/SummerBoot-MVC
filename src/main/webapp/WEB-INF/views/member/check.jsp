<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String[] product_id = request.getParameterValues("product_id");
		String[] product_name = request.getParameterValues("product_name");
		String[] quantity = request.getParameterValues("quantity");
		String[] price = request.getParameterValues("price");
		String pay = request.getParameter("total");
	
		System.out.println(product_id.length);
		
		for(int i=0; i<product_id.length; i++) {
	%>
			product_id : <%= product_id[i] %>
			product_name : <%= product_name[i] %>
			quantity : <%= quantity[i] %>
			price : <%= price[i] %>
	<%
		}
	%>
	
		total price : <%= pay %>
</body>
</html>
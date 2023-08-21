<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./common/head.jsp"%>
<title>예약 관리 페이지</title>
<script>
	function deleteres(res_no){
		if(!confirm('정말 삭제하시겠습니까?')){
			return false;
		}
		else{
			$.ajax({
				url : "deleteres",
				type : "post",
				data : {
					res_no : res_no,
				},
				async : false,
				success : function(data){
					alert("예약 번호 "+res_no+" 삭제 완료");
				},
				error: function(xhr, status, error) {
			        console.log("AJAX Error:", xhr.responseText);
			        console.log("Status:", status);
			        console.log("Error:", error);
			    }
			});
			return true;
		}
	}
</script>
</head>
<body id="page-top">
	<c:set var="file_repo" value="/summerboot2/resources/assets/img/"/>
	
	<div id="wrapper">
		<%@ include file="./common/sidebar.jsp" %>
		
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
        	<!-- Main Content -->
            <div id="content">
				<%@ include file="./common/topbar.jsp" %>
				<div class="container-fluid">
					 <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-washboot">예약리스트</h6>
                        </div>
	                    <div class="card-body">
	                    	<div class="table-responsive">
	                            <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
	                            <thead>
	                            <tr><th>예약번호</th><th>예약자 ID</th><th>예약날짜</th><th>세차구역</th><th>예약시간</th><th>사용시간</th><th></th></tr>
	                            </thead>
	                            <tbody>
	                            <c:choose>
		                            <c:when test="${empty resList }">
		                            	<tr><td colspan=7>예약 정보가 없습니다.</td></tr>
		                            </c:when>
		                            <c:when test="${!empty resList }">
		                            <c:forEach var="data" items="${resList }">
		                            	<tr>
		                            		<td>${data.res_no }</td><td>${data.member_id }</td><td>${data.res_date }</td><td>${data.site }</td>
		                            		<td>${data.startTime }</td><td>${data.useTime }</td>
		                      				<th><a href="#" onclick="return deleteres(${data.res_no });">삭제</a></th>
		                            	</tr>
		                            </c:forEach>
		                            </c:when>
	                            </c:choose>
	                            </tbody>
	                            </table>
	                        </div>
	                    </div>
                    </div>
				</div>
			</div>
        </div>
	</div>
	<%@ include file="./common/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./common/head.jsp"%>
<title>예약 관리 페이지</title>
	<link rel="stylesheet" href="${path}/resources/assets/css/admin_seo.css">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
					var result = parseInt(data);
					if(result==1){
						alert("예약번호 "+res_no+"의 삭제가 완료되었습니다.");
						location.reload();
					}else{
						alert("삭제에 실패했습니다.");
					}
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
	                    	<div>
	                    	<form action="${path}/admin/reservationList2" method="POST">
	                    		<table style="width:100%">
	                    		<tr><th style="width:10%"><span style="background-color:#FFDAB9;">예약날짜</span></th>
	                    		<td style="width:20%"><input type="text" name="res_date" value="${res_date }" id="datepicker">
	                    		<input type="hidden" name="no" value="${no }"></td>
	                    		<td><input type="submit" class="btn btn-primary" value="조회"></td></tr>
	                    		</table>
	                    	</form>
	                    	<hr>
	                    	</div>
	                    	<c:choose>
	                    	<c:when test="${empty res_date }">
	                    	<div>
	                    	<h2>예약날짜를 선택해주세요</h2>
	                    	</div>
	                    	</c:when>
	                    	<c:when test="${!empty res_date }">
	                    	<div class="table-responsive">
	                    	<table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
	                    		<c:choose>
		                            <c:when test="${empty resList }">
		                            	<tr><td colspan=6>예약 정보가 없습니다.</td></tr>
		                            </c:when>
		                            <c:when test="${!empty resList }">
		                            <thead>
		                            <tr><th></th><th>예약번호</th><th>예약자 ID</th><th>세차구역</th><th>시작시간</th><th>종료시간</th><th></th></tr>
		                            </thead>
		                            <c:forEach var="data" items="${resList }">
		                            <tbody>
		                            	<tr>
		                            		<td>${data.res_no }</td><td>${data.order_num }</td><td>${data.member_id }</td><td>${data.site }</td>
		                            		<td>${data.startTime }</td><td>${data.endTime }</td>
		                      				<th><a href="#" onclick="return deleteres(${data.res_no });">삭제</a></th>
		                            	</tr>
		                            </tbody>
		                            </c:forEach>
		                            </c:when>
	                            </c:choose>
	                    	</table>
	                    	</div>
	                    	</c:when>
	                    	</c:choose>
	                    </div>
                    </div>
				</div>
			</div>
        </div>
	</div>
	<%@ include file="./common/footer.jsp" %>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
<script>
$(function() {
    //input을 datepicker로 선언
    $("#datepicker").datepicker({
        dateFormat: 'mm-dd' //달력 날짜 형태
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
        ,changeYear: false //option값 년 선택 가능
        ,changeMonth: true //option값  월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
        ,buttonText: "선택" //버튼 호버 텍스트              
        ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
        ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
    });                          
});
</script>
</html>
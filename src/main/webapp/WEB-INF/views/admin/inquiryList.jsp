<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="./common/head.jsp"%>
	<link rel="stylesheet" href="${path}/resources/assets/css/custom_lee.css">
    <title>문의관리</title>
</head>

<body id="page-top">
    <!-- Page Wrapper -->
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
                            <h6 class="m-0 font-weight-bold text-washboot">문의관리</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>구분</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성날짜</th>
                                            <th>답변상태</th>
                                            <th>답변날짜</th>
                                            <th>비고</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
											<th width="3%">#</th>
                                            <th width="8%">구분</th>
                                            <th>제목</th>
                                            <th width=15%>작성자</th>
                                            <th width=15%>작성날짜</th>
                                            <th width="8%">답변상태</th>
                                            <th width=15%>답변날짜</th>
                                            <th>비고</th>
                                        </tr>
                                    </tfoot>
                                    <tbody class="inquiryTB">
                                    	<c:choose>
	                                    	<c:when test="${empty inquiry }">
	                                    		<tr>
		                                    		<td colspan="5" style="text-align:center;">등록된 문의가 없습니다.</td>
	                                    		</tr>
	                                    	</c:when>
	                                    	<c:when test="${!empty inquiry }">
			                            		<c:forEach var="list" items="${inquiry }">
		                                    		<c:set var="cnt" value="${cnt+1 }"/>
			                                        <tr class="inquiryTr">
			                                            <td class="inquiryTd">${cnt }</td>
			                                            <td class="inquiryTd">${list.category }</td>
			                                            <td class="inquiryTd">${list.title }</td>
			                                            <td class="inquiryTd">${list.writer }</td>
			                                            <td class="inquiryTd"><fmt:formatDate value="${list.ins_date }" pattern="YYYY/MM/dd HH:mm:ss" /></td>
			                                            <td class="inquiryTd">${list.state }</td>
			                                            <td class="inquiryTd"><c:if test="${list.state eq '답변완료'}"><fmt:formatDate value="${list.answer_date }" pattern="YYYY/MM/dd HH:mm:ss" /></c:if></td>
			                                            <td id="menuDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="position:relative;width:5%;text-align:center;">
		                                            		<i class="fas fa-fw fa-ellipsis-h" style="cursor:pointer;"></i>
		                                            		<div class="dropdown-menu dropdown-menu-right shadow" aria-labelledby="menuDropdown" style="top:0;min-width:10rem;">
				                                            	<c:if test="${list.state eq '답변대기' }">
																	<p class="dm-menu" onclick="answer(${list.q_no});">답변쓰기</p>
																	<hr style="margin:0.5rem">
			                                            		</c:if>
																<p class="dm-menu" onclick="inquiry_delete(${list.q_no}, '${list.writer }')">삭제</p>
															</div>
	                                            		</td>
			                                        </tr>
			                                        <tr class="store-hide">
														<td colspan="7">  
										                    <div class="card-body-inquiry">
												            	<div class="inquiry-answer" style="margin-bottom:3%;">
												            		<div class="h1" style="font-weight: bolder !important">Q</div>
												            		<div class="h4" style="padding-top:2%;">${list.content }</div>
												                </div>
												                <div class="inquiry-answer" <c:if test="${list.state eq '답변대기'}" >style="display:none;"</c:if>>
												                    <div class="h1" style="font-weight: bolder !important">A</div>
												            		<div class="h4" style="padding-top:2%;">${list.answer }</div>
												                </div>
											                </div>
														</td>  
													</tr>
				                            	</c:forEach>
			                            	</c:when>
                                    	</c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                <!-- /.container-fluid -->
			</div>
		</div>
	</div>
	<%@ include file="./common/footer.jsp" %>
</body>
</html>
<style>
	.dm-menu {
		margin-bottom:0;
		padding:0 8%;
		cursor:pointer;
	}
</style>

<script>
	function answer(no) {
		alert(no);
		window.open("${path}/admin/community/inquiryAnswer?q_no="+no, "name(about:blank)", "width=600, height=600");
	}
	
	function inquiry_delete(no, writer) {
		alert(no);
		alert(writer);
		if(confirm(writer + "님의 문의를 삭제하시겠습니까?")) {
			$.ajax({
				type:"post",
				enctype:"multipart/form-data",
				url:"${path}/admin/community/deleteInquiry",
				dataType:"text",
				data: {q_no : no},
				success:function (data){
					if(data=='delete') {
						alert(writer + "님의 문의 내용이 삭제되었습니다.");
						document.location.reload();
					} else if(data=='fail') {
						alert("오류로 해당 문의를 삭제하지 못했습니다.");
					}
				},
				error:function(request, error){
					alert("에러가 발생했습니다.");
					console.log("code : " + request.status + "\n" + "message : " + request.responseText +"\n" + "error : " + error	);
				}
			});
		} else {
			return;
		}
	}
	
	$(function(){
		var article = (".inquiryTB .store-show");
		
		$(".inquiryTB .inquiryTr .inquiryTd").click(function() {  
			var myArticle =$(this).parents().next("tr");  
			if($(myArticle).hasClass('store-hide')) {
				$(article).removeClass('store-show').addClass('store-hide');  
				$(myArticle).removeClass('store-hide').addClass('store-show');  
			} else {  
				$(myArticle).addClass('store-hide').removeClass('store-show');  
			}  
		});  
	});
</script>
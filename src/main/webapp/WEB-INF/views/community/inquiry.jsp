<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WASHBOOT 지점</title>
	<%@ include file="../common/header.jsp" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<link rel="stylesheet" href="${path}/resources/assets/css/custom_lee.css">
</head>
<body>
	<section class="container py-5">
		<div class="row text-center pt-5 pb-3">
			<div class="col-lg-6 m-auto">
				<h1 class="h1" id="title" style="font-weight:bolder !important;">Q&A</h1>
			</div>
		</div>
		
		<div class="row choose">
			<div class="pb-5 ch">
				<a class="h4 mt-4" href="${path}/community/faq">FAQ</a>
			</div>
		
			<div class="pb-5 ch">
				<a class="h4 mt-4 disabled" href="${path}/community/qna">Q&A</a>
			</div>
		</div>
		
		<div class="flex-sm-fill col-7 mx-auto searchG">
			<div style="margin-right:10px;">
				<select class="form-control" id="searchCon" name="searchCon" style="height:40px">
					<option value="0">검색조건</option>
					<option value="title" <c:if test="${searchCon eq 'title'}">selected</c:if>>제목</option>
					<option value="writer" <c:if test="${searchCon eq 'writer'}">selected</c:if>>작성자</option>
				</select>
			</div>
			<div class="input-group">
				<input type="text" class="form-control" id="inputMobileSearch" placeholder="Search" name="search" <c:if test="${search ne 'none'}"> value="${search }"</c:if>>
				<div class="input-group-text" id="search">
					<i class="fa fa-fw fa-search"></i>
				</div>
			</div>
		</div>
		
		<div class="row" style="justify-content: flex-end;margin-bottom:1%;">
			<input type="button" class="btn btn-join" id="write" value="글쓰기" style="width:7%;">
		</div>
		
		<div>
			<table class="table inquiryT">
				<thead>
					<tr>
						<th width="5%">#</th>
						<th width="8%">
							<select id="category" name="category" style="padding:0;border:none;font-size:18px;font-weight:bolder;">
								<option value="0">상담구분</option>
								<option value="car" <c:if test="${category eq 'car'}">selected</c:if>>세차문의</option>
								<option value="shop" <c:if test="${category eq 'shop'}">selected</c:if>>쇼핑문의</option>
								<option value="etc" <c:if test="${category eq 'etc'}">selected</c:if>>기타문의</option>
							</select>
						</th>
						<th width="42%">제목</th>
						<th width="15%">작성자</th>
						<th width="15%">작성시간</th>
						<th width="15%">
							<select id="state" name="state" style="padding:0;border:none;font-size:18px;font-weight:bolder;">
								<option value="0">답변상태</option>
								<option value="wait" <c:if test="${state eq 'wait'}">selected</c:if>>답변대기</option>
								<option value="complete" <c:if test="${state eq 'complete'}">selected</c:if>>답변완료</option>
							</select>
						</th>
					</tr>
				</thead>
				<tbody class="inquiryTB">
					<c:choose>
						<c:when test="${empty inquiryList }">
							<tr>
								<td colspan="6" style="text-align:center;">등록된 문의가 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty inquiryList }">
							<c:forEach var="list" items="${inquiryList }" varStatus="status">
								<c:set var="count" value="${count + 1}" />
								<tr class="inquiryTr">
									<td>${count }</td>
									<td>${list.category }</td>
									<td><c:if test="${list.secret eq 'Y'}"><i class="fa fa-lock"></i></c:if>${list.title }</td>
									<td class="writer">${list.writer }</td>
									<td><fmt:formatDate value="${list.ins_date }" pattern="YYYY/MM/dd" /></td>
									<td>${list.state }</td>
									<td class="secret" style="display:none;">${list.secret }</td>
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
		
		<div class="row">
			<ul class="pagination pagination-lg justify-content-center">
				<c:set var="current" value="${page }"/>
				<c:forEach var="page" begin="1" end="${pages }" step="1">
					<li class="page-item">
						<a class='page-link rounded-0 mr-3 border-top-0 border-left-0 <c:if test="${page eq current}">disabled</c:if>' href="${path}/community/qna?page=${page}">${page}</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</section>
	<!-- End Section -->

<%@ include file="../common/footer.jsp" %>
</body>
</html>

<style>
    .choose {
        justify-content: center;
        text-align:center;
    }
    
    .ch {
        width : 10%;
    }
	.h4 {
		font-size : 1.5rem !important;
	}
	tr {
		cursor: default;
    }
    .inquiry-select {
    	display : grid;
    	grid-template-columns:1fr;
    }
    .searchG {
    	display : grid;
    	grid-template-columns : 0.5fr 1.5fr;
    }
</style>

<script>
	$(document).ready(function() {
		var message = "${msg}";
		if (message == 4) {
			alert("오류로 문의 등록에 실패했습니다.");
			location.href="${path }/community/qnaWrite";
		} else if (message == 888) {
			alert("문의가 등록되었습니다.");
			location.href="${path }/community/qna";
		}
	});

	$(document).on('click', '#write', function() {
		var user_id = "<%=user_id %>";
		if(user_id == "null") {
			alert("로그인 후 이용해주세요.");
		} else {
			location.href = "${path}/community/qnaWrite"
		}
	});
	
	$(document).on('click', '#qna', function() {
		location.href = "${path}/community/qna"
	});
	
	$(function(){
		var article = (".inquiryTB .store-show");
		var user_id = "<%=user_id%>";
		
		$(".inquiryTB .inquiryTr").click(function() {  
			var td=$(this).children();
			var writer = td.eq(3).text();
			var secret = td.eq(6).text();
			if(user_id == writer || secret == "N") {
				var myArticle =$(this).next("tr");  
				if($(myArticle).hasClass('store-hide')) {
					$(article).removeClass('store-show').addClass('store-hide');  
					$(myArticle).removeClass('store-hide').addClass('store-show');  
				} else {  
					$(myArticle).addClass('store-hide').removeClass('store-show');  
				}  
			} else {
				alert("작성자만 볼 수 있는 글입니다.");
			}
		});  
	});
	
	$(document).on('change', '#category', function() {
		var category = $("#category").val();
		var search = $("#inputMobileSearch").val();
		var searchCon = $("#searchCon").val();
		var state = $("#state").val();
		var path = "${path }/community/qna?category="+category;
		if(search.length > 0) {
			path += "&search=" + search + "&searchCon=" + searchCon;
		}
		if(state!=0) {
			path += "&state=" + state;
		}
		location.href=path;
	});
	
	$(document).on('change', '#state', function() {
		var category = $("#category").val();
		var search = $("#inputMobileSearch").val();
		var searchCon = $("#searchCon").val();
		var state = $("#state").val();
		var path = "${path }/community/qna?category="+category;
		if(search.length > 0) {
			path += "&search=" + search + "&searchCon=" + searchCon;
		}
		if(state!=0) {
			path += "&state=" + state;
		}
		location.href=path;
	});
	
		
	$(document).on('click', '#search', function search() {
		var searchCon = $("#searchCon").val();
		var search = $("#inputMobileSearch").val();
		var category = $("#category").val();
		var state = $("#state").val();
		
		var path = "${path}/community/qna?search="+search + "&searchCon=" + searchCon;
		if(category!=0) {
			path += "&category=" + category;
		}
		if(state!=0) {
			path += "&state=" + state;
		}
		location.href=path;
	});
	
	
	function enterkey() {
		if (window.event.keyCode == 13) {
			search();
		}
	}
</script>
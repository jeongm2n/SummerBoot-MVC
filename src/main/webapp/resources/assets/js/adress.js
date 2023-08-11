//다음 지도 api 실행 및 검색한 정보를 보내주는 함수
function execDaumPostcode() {
    daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
			  $("#state").val(data.sido).prop("selected", true);
			  document.getElementById("postcode").value = data.zonecode;
			  document.getElementById("city").value = data.sigungu;
			  document.getElementById("city").value += data.bname1;
			  var roadAddress = data.roadAddress;
			  roadAddress = roadAddress.replace(data.sido,"");
			  roadAddress = roadAddress.replace(data.sigungu,"");
			  roadAddress = roadAddress.replace(data.bname1,"");
			  document.getElementById("street_add").value = roadAddress.trim();
            }
        }).open();
    });
}

function execDaumPostcode() {
    daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
			  $("#state").val(data.sido).prop("selected", true);
			  $('input[name=postcode]').attr('value',data.zonecode);
			  $('input[name=city]').attr('value',data.sigungu);
			  $('input[name=town]').attr('value',data.bname);
			  
			  var roadAddress = data.roadAddress;
			  roadAddress = roadAddress.replace(data.sido,"");
			  roadAddress = roadAddress.replace(data.sigungu,"");
			  roadAddress = roadAddress.replace(data.bname,"");
			  $('input[name=street_add]').attr('value',roadAddress.trim());
            }
        }).open();
    });
}

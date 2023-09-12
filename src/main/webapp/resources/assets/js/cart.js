	$(document).ready(function() {
		total();
	});

	function minus(id) {
		var val = $("#"+id+"-quan").html();
		val = (val=='1')?val:val-1;
		$("#"+id+"-quan").html(val);
		$("#"+id+"_hidden").val(val);
		
		var price = document.getElementById(id + "_price").value;
		$("#"+id+"_sum").html((price*val).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')); // 천단위 표시해서 값 변경
		$("#"+id+"_pay").val((price*val));
		update(id, val);
		total();
	}
	
	function plus(id) {
		var val = $("#"+id+"-quan").html();
		val++;
		$("#"+id+"-quan").html(val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		$("#"+id+"_hidden").val(val);
		
		var price = document.getElementById(id + "_price").value;
		$("#"+id+"_sum").html((price*val).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		$("#"+id+"_pay").val((price*val));
		update(id, val);
		total();
	}
	
	$(document).on('click', '.chk', function(){
		total();
	});
	
	function total() {
		var total = 0;
		$('input:checkbox[name=chkbox]').each(function () {
            if($(this).is(":checked")==true){
				console.log($(this).val());
                total += parseInt($("#"+$(this).val()+"_sum").html().replace(/,/g, ""));
                console.log("total>>>> " + total);
            }
        })
        $("#sum").html(total.toLocaleString('ko-KR'));
		var delivery = 0;
		if(total >= 30000 || total == 0) {
			delivery = 0;
		} else {
			delivery = 3000;
		}
		total += delivery;
		
        $("#total").html(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
        $("#delivery").text(delivery.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
        $("#pay").val(total);
	}
	
	
	function pass() {
		if($(".chk").is(":checked")) {
			$('input:checkbox[name=chkbox]').each(function () { // 체크되어있는 체크박스 확인
	            if($(this).is(":checked")==true){
	            } else {
	            	var name = $(this).val();
	            	$("input[class=" + name + "]").attr("disabled", true); // 체크되지 않은 상품은 결제창으로 넘어가지 않도록 처리!
	            }
	        });
			return true;
		} else {
			alert("선택한 상품이 없습니다.");
			return false;
		}
	}
	
	function allChk() {
		if($("#allC").is(":checked")) {
			$(".chk").prop("checked", true);
			total();
		} else {
			$(".chk").prop("checked", false);
			total();
		}
	}
    
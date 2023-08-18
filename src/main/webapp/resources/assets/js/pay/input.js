window.addEventListener('load', function() {
  var inp = document.querySelectorAll('input');
  for (var i = 0; i < inp.length; i++) {
    inp[i].addEventListener('change', function() {
      this.setAttribute("value", this.value);
    })
  }
})

function all_point(point){
	$('input[name=m_point]').attr('value',point);
	$('input[name=p_point]').attr('value',point);
	$('input[name=h_point]').attr('value',point);
}
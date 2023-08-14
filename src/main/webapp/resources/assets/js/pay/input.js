window.addEventListener('load', function() {
  var inp = document.querySelectorAll('input');
  for (var i = 0; i < inp.length; i++) {
    inp[i].addEventListener('change', function() {
      this.setAttribute("value", this.value);
    })
  }
})
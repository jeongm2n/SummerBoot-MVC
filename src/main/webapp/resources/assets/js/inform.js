function collapse(element) {
    var before = document.getElementsByClassName("active")[0]        
    if (before && document.getElementsByClassName("active")[0] != element) {  
        before.nextElementSibling.style.maxHeight = null;   
        before.classList.remove("active");               
    }
    element.classList.toggle("active");   

    var content = element.nextElementSibling;
    if (content.style.maxHeight != 0) {         
        content.style.maxHeight = null;        
    } else {
        content.style.maxHeight = content.scrollHeight + "px"; 
    }
}
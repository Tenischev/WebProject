function find(id){
    var s_el = document.getElementById(id);
    var search = s_el.value;
    var next_el = s_el.nextSibling;
    while (next_el.tagName != "HR"){
        next_el = next_el.nextSibling;
    }
    next_el = next_el.nextSibling;
    while (next_el.tagName != "HR"){
        if (next_el.tagName == "A"){
            var dd_text = next_el.firstChild.firstChild.nodeValue;
            if (-1 == dd_text.toLowerCase().indexOf(search.toLowerCase())){
                next_el.style.display='none';
            } else {
                next_el.style.display='';
            }
        }
        next_el = next_el.nextSibling;
    }
}
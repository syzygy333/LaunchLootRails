function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
    page_item = $(".find-panel");
    if (page_item.attr("class").include("equipped")) {
    $.ajax({
      type: "PATCH",
      url:  "/items/" + items[n].innerHTML
    });
  } else {
    $.ajax({
      type: "PATCH",
      url:  "/item/" + items[n].innerHTML
    });
  }
}


// $(".find-panel")
// page_item = $(".find-panel").first()
// page_item.attr("class")

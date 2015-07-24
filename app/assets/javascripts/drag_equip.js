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
    document.getElementById(data).getElementsByClassName
      ("button success")[0].click();
    document.getElementById(data).getElementsByClassName
      ("button secondary")[0].click();

  //   page_item = $(".find-panel");
  //   if (page_item.attr("class").includes("equipped")) {
  //   $.ajax({
  //     type: "PATCH",
  //     url: "/items/" + items[n].innerHTML
  //   });
  // } else {
  //   $.ajax({
  //     type: "PATCH",
  //     url: "/item/" + items[n].innerHTML
  //   });
  // }
}


// $(".find-panel")
// page_item = $(".find-panel").first()
// page_item.attr("class")
// document.getElementByClassName("tiny button").click();
// document.getElementById("save").click();

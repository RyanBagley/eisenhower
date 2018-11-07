window.addEventListener("load", function () {
  handleMatrix()
})

window.addEventListener("scroll", function () {
})

function handleMatrix() {
  $('.matrix .cell').on("click", function(){
    $('.matrix .cell').removeClass("selected")
    $(this).addClass("selected").children("input").prop("checked", true)
  })
}

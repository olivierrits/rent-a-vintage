import "bootstrap";
let btn_wrap = document.querySelector("#large-new-btn")
if(btn_wrap){

  btn_wrap.addEventListener("click", (event) =>
    document.querySelector("form").submit()
    )
}

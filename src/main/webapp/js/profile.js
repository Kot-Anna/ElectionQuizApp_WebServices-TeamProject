const back = document.querySelector(".btn-back");



back.addEventListener("click", goBack );



function goBack(){
window.history.back();
console.log("burada")
}
const scroll = document.querySelector(".scroll");

window.onscroll = function(){scrollUp()};

function scrollUp(){
	if(document.body.scrollTop > 200 || document.documentElement.scrollTop > 200){
		scroll.style.right = "30px";
	}else{
		scroll.style.right = "-70px";
	}
}

scroll.addEventListener("click", () => {
	document.body.scrollTop = "0";
	document.documentElement.scrollTop = "0";
})
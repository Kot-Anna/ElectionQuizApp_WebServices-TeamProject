const questions = document.querySelectorAll(".question-card");

questions.forEach((item, i) => {
	const val = item.getAttribute("data-val").split(";");
	
	item.querySelectorAll(".chart").forEach((b, index) => {
		b.querySelectorAll(".chart-wrap").forEach((w, wi) => {
			w.children[2].querySelector(".num").textContent = val[wi]
			const n = +w.children[2].querySelector(".num").textContent;
			if(n === 0){
				w.children[2].querySelector(".num").nextElementSibling.remove();
			}
			w.children[1].children[0].style.width = calculate(parseInt(val[wi]), questions.length)+"%";
		})
	})
})

function calculate(x,y){
	return (100 / y) * x;
	
}
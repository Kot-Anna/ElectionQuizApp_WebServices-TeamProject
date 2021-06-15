
const form = document.querySelector(".question-form");
const input = document.getElementById("question-input");


form.addEventListener("submit", (e) => {
	let errors = [];
	
	if(input.value === "" || input.value === null){
		errors.push("name required");
	}	
	
	if(errors.length > 0){
		e.preventDefault();
		showWarning("danger","Please enter a question");
	}
});


function showWarning(type, text) {
	let div = document.createElement("DIV");
	div.id = "warning";
	div.className = `fadein ${type}`;
	div.appendChild(document.createTextNode(text));

	document.body.appendChild(div);

	setTimeout(() => {
		document.getElementById("warning").classList.add("fadeout");
	}, 3000);

	setTimeout(() => {
		document.getElementById("warning").remove();
	}, 3600)
}
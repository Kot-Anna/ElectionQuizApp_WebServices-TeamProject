//add candidate fields
const fname = document.querySelector("#fname");
const lname = document.querySelector("#lname");
const city = document.querySelector("#city");
const age = document.querySelector("#age");
const profession = document.querySelector("#profession");
const party = document.querySelector("#party");
const whyCan = document.querySelector("#why-can");
const about = document.querySelector("#about");
const form = document.querySelector(".candidate-form");


form.addEventListener("submit", (e) => {
	let errors = [];
	
	if(fname.value === "" || fname.value === null){
		errors.push("name required");
		console.log("entered")
	}
	if(lname.value === "" || lname.value === null){
		errors.push("name required");
	}	
	if(city.value === "" || city.value === null){
		errors.push("name required");
	}	
	if(age.value === "" || age.value === null){
		errors.push("name required");
	}	
	if(profession.value === "" || profession.value === null){
		errors.push("name required");
	}	
	if(party.value === "" || party.value === null){
		errors.push("name required");
	}	
	if(whyCan.value === "" || whyCan.value === null){
		errors.push("name required");
	}	
	if(about.value === "" || about.value === null){
		errors.push("name required");
	}		
	
	if(errors.length > 0){
		e.preventDefault();
		showWarning("danger","Please fill in all empty fields");
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
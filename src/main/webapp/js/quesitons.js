
const form = document.getElementById("qustions-form");
const next = document.getElementById("next");
const prev = document.getElementById("prev");
const submit = document.getElementById("submitBtn");
const bar = document.querySelector(".bar");
const wrapper = document.querySelector(".wrapper-question");
const questionIndex = document.querySelector(".question-index");
const wrapperContent = document.querySelector(".wrapper-content");
const totalNum = document.querySelector(".total-num");
const answersArr = document.querySelector(".answersArr");
const title = document.querySelector(".title");
const label = document.querySelectorAll(".answer label");
const smallQWrap = document.querySelector(".small-q-wrap");
const smallSubmit = document.querySelector(".small-submit");

if(JSON.parse(sessionStorage.getItem("list")) !== null){
	sessionStorage.removeItem("list");
	sessionStorage.removeItem("ans");
}


//get all the questions 
const questions = [...wrapperContent.getAttribute("data-questions").split("%")];

let ques;
	
	if(sessionStorage.getItem("ques") === null){
		ques = [];
	}else{
		ques = JSON.parse(sessionStorage.getItem("ques"));
	}
	
	ques.push(questions);
	sessionStorage.setItem("ques", JSON.stringify(ques))
	
	

//Global variables
let TOTAL = questions.length;
let VALUE = 0;
let tempVal = 0;
let allAnswered = false;



insertSmallQ(questions);
const smallQ = document.querySelectorAll(".small-q");




// calculate percentage of the progress bar
let amount = calculate(questions.length);

// add event listener to next button
next.addEventListener("click", nextUpdate);

//add eventlistener to prev button
prev.addEventListener("click", prevUpdate)

window.addEventListener("load", () => {
	prev.disabled = true;
	prev.classList.add("btn-disabled")
	wrapper.textContent = questions[0];
	bar.style.width = calculate(questions.length) + "%";
	totalNum.textContent = questions.length;
	smallQ[VALUE].classList.add("small-q-border")
});

/*const question = questionIterator(questions);*/



let answers = questions.map(q => "");

/*let answers = [];

for(let i = 0; i < questions.length - 1; i++){
answers.push("");
}*/
console.log(answers)

// this function is called when the user click next button
function nextUpdate(e) {
	e.preventDefault();

	const getName = document.getElementsByName("score");


	for (let i = 0; i < getName.length; i++) {
		if (getName[i].checked) {
			answers.splice(VALUE, 1, getName[i].value)
		}
	}

	/*	const isDone = question.next();*/
	let index = +questionIndex.textContent + 1;

	//if all questions are answered turn everthing into disabled mode and leave the update function
	if (index === questions.length + 1) {
		allAnswered = true;
		next.style.display = "none";
		submit.style.display = "block";
		title.classList.add("disabled");
		questionIndex.classList.add("disabled");
		submit.classList.add("ready-submit");
		wrapper.textContent = "All quesions were answered!"
		wrapper.style.color = "#c4c4c4";

		label.forEach(i => {
			i.style.color = "#c4c4c4";
		})

		const getName = document.getElementsByName("score");

		for (let i = 0; i < getName.length; i++) {
			getName[i].disabled = true;
		}
		smallQ[VALUE].classList.add("btn-disabled")
		answersArr.value = answers.join("%");
		console.log(answers)
		return;
	}

	smallQ[VALUE].classList.add("btn-disabled")

	VALUE++;
	
	smallQ[VALUE].classList.add("btn-disabled")
	
	for (let i = 0; i < getName.length; i++) {
		if (getName[i].checked) {
			answers.splice(VALUE, 1, getName[i].value)
		}
	}

	//after increasing value delete border class from previous one and then add it to the current one
	updateBorder(smallQ);

	//check the radio button that checked before
	if (answers[VALUE] !== "") {
		var num = parseInt(answers[VALUE]);
		getName[parseInt(num) - 1].checked = true;
	}


	//if the user on the first question, disable the prev button
	if (VALUE !== 0) {
		const oldList =
			prev.disabled = false;
		prev.classList.remove("btn-disabled")
	}


	//add updated answers to input that has class of answerArr as value
	answersArr.value = answers.join("%");
	console.log(answers)


	//as long as the current index is less than the total question number, update the ui
	if (VALUE <= TOTAL) {
		questionIndex.textContent = index;
		bar.style.width = (VALUE + 1) * amount + "%";
		wrapper.textContent = questions[VALUE];

	}


}

//This function is called when the prev button is clicked
function prevUpdate() {
	if (VALUE > 0) {
		if (allAnswered) {
			next.style.display = "block";
			submit.style.display = "none";
			title.classList.remove("disabled");
			questionIndex.classList.remove("disabled");
			submit.classList.remove("ready-submit");
			wrapper.textContent = questions[questions.length - 1]
			wrapper.style.color = "#000";

			label.forEach(i => {
				i.style.color = "#000";
			})

			const getName = document.getElementsByName("score");

			for (let i = 0; i < getName.length; i++) {
				getName[i].disabled = false;
			}
			allAnswered = false;
			return;
		} else {

			const getCurName = document.getElementsByName("score");


			for (let i = 0; i < getCurName.length; i++) {
				if (getCurName[i].checked) {
					answers.splice(VALUE, 1, getCurName[i].value)
				}
			}

			smallQ[VALUE].classList.add("btn-disabled")

			console.log(answers)
			VALUE--;

			updateBorder(smallQ);

			const getName = document.getElementsByName("score");

			if (answers[VALUE] !== "") {
				var num = parseInt(answers[VALUE]);
				getName[parseInt(num) - 1].checked = true;
			}


			let index = +questionIndex.textContent - 1;

			questionIndex.textContent = index;
			bar.style.width = (VALUE + 1) * amount + "%";
			wrapper.textContent = questions[VALUE];

			if (VALUE === 0) {
				prev.disabled = true;
				prev.classList.add("btn-disabled")
			}
		}
	}
}

//insert the question navigation
function insertSmallQ(questions) {
	let small = questions.map((i, index) => `<div class="small-q" data-small="${index + 1}">${index + 1}</div>`).join("");
	smallQWrap.innerHTML = small;
}

//after increasing value delete border class from previous one and then add it to the current one
function updateBorder(x) {
	x.forEach(i => {
		if (i.classList.contains("small-q-border")) {
			i.classList.remove("small-q-border")
		}
	})

	x[VALUE].classList.add("small-q-border")
}


//add eventlistener to each small q button
smallQ.forEach(s => {
	s.addEventListener("click", () => {

		if (allAnswered) {
			next.style.display = "block";
			submit.style.display = "none";
			title.classList.remove("disabled");
			questionIndex.classList.remove("disabled");
			submit.classList.remove("ready-submit");
			wrapper.textContent = questions[questions.length - 1]
			wrapper.style.color = "#000";

			label.forEach(i => {
				i.style.color = "#000";
			})

			const getName = document.getElementsByName("score");


			for (let i = 0; i < getName.length; i++) {
				getName[i].disabled = false;
			}
			allAnswered = false;
		}


		const getCurName = document.getElementsByName("score");

		for (let i = 0; i < getCurName.length; i++) {
			if (getCurName[i].checked) {
				answers.splice(VALUE, 1, getCurName[i].value)
			}
		}

		smallQ[VALUE].classList.add("btn-disabled")

		const index = +s.getAttribute("data-small");
		VALUE = index - 1;

		smallQ[VALUE].classList.add("btn-disabled")

		for (let i = 0; i < getCurName.length; i++) {
			if (getCurName[i].checked) {
				answers.splice(VALUE, 1, getCurName[i].value)
			}
		}

		answersArr.value = answers.join("%");

		questionIndex.textContent = VALUE + 1;
		bar.style.width = (VALUE + 1) * amount + "%";
		wrapper.textContent = questions[VALUE];

		const getName = document.getElementsByName("score");

		//if the question is answered before select the answered radio button
		if (answers[VALUE] !== "") {
			var num = parseInt(answers[VALUE]);
			getName[parseInt(num) - 1].checked = true;
		}

		//if the value equels to 0 disable the prev button
		if (VALUE === 0) {
			prev.disabled = true;
			prev.classList.add("btn-disabled")
		}

		if (VALUE !== 0 && prev.classList.contains("btn-disabled")) {
			const oldList =
				prev.disabled = false;
			prev.classList.remove("btn-disabled")
		}


		updateBorder(smallQ);

	})
})

//this function calculates percentage for the progress bar
function calculate(x) {
	return 100 / x;
}


//create error messages
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


//if the user clicks the submit button without answering all the questions show an error
submit.addEventListener("click", (e) => {
	answersArr.value = answersArr.value + "%";

	console.log(answersArr)
	const err = [];

	smallQ.forEach(i => {
		if (!i.classList.contains("btn-disabled")) {
			err.push("err")
		}
	})

	if (err.length > 0) {
		e.preventDefault();

		showWarning("normal", "Please answer all questions...")
	}else{
		let ans;

		if (sessionStorage.getItem("ans") === null) {
			ans = [];
		} else {
			cans = JSON.parse(sessionStorage.getItem("ans"));
		}

		ans.push(answers);
		sessionStorage.setItem("ans", JSON.stringify(ans))
	}
})


smallSubmit.addEventListener("click", function(){handleSmallSubmit(answers)})

function handleSmallSubmit(answers){
	
	const getName = document.getElementsByName("score");
	
	for (let i = 0; i < getName.length; i++) {
		if (getName[i].checked) {
			answers.splice(VALUE, 1, getName[i].value)
		}
	}
	
	const err = [];

	smallQ.forEach(i => {
		if (!i.classList.contains("btn-disabled")) {
			err.push("err");
		}
	})

	if (err.length > 0) {
		showWarning("normal", "Please answer all questions...")
	} else {

		let ans;

		if (sessionStorage.getItem("ans") === null) {
			ans = [];
		} else {
			ans = JSON.parse(sessionStorage.getItem("ans"));
		}

		ans.push(answers);
		sessionStorage.setItem("ans", JSON.stringify(ans))

		document.getElementById("qustions-form").submit();
	}

}


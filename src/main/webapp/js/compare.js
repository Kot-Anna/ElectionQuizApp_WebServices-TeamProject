
const candidateAnswers = document.querySelectorAll(".compare-candidate-answer");
const btnContainer = document.querySelector(".compare-btn-container");
const yourAnswer = document.querySelector(".your-answer");
const questionList = document.querySelector(".question-list");


function getAllData() {
	return new Promise((resolve, reject) => {
		let canList = JSON.parse(sessionStorage.getItem("list"));
		let ansList = JSON.parse(sessionStorage.getItem("ans"));
		let questions = JSON.parse(sessionStorage.getItem("ques"))[0];

		resolve({ canList, ansList, questions })
		reject("something went wrong")
	})
}

getAllData()
	.then(res => {

		let { canList, ansList, questions } = res;
		
		const temp1 = canList[0];
		const temp2 = canList[1];
		const temp3 = canList[2];
		
		canList = [temp2, temp1, temp3];
		
		const buttonList = `
		<div class="compare-btn-wrap">
          <p>1</p>
          <button class="compare-btn compare-btn-active"}>${canList[0].name}</button>
        </div>
		<div class="compare-btn-wrap">
          <p>2</p>
          <button class="compare-btn">${canList[1].name}</button>
        </div>
		<div class="compare-btn-wrap">
          <p>3</p>
          <button class="compare-btn">${canList[2].name}</button>
        </div>
	`

		btnContainer.innerHTML = buttonList;
		const buttons = document.querySelectorAll(".compare-btn");



		const q = questions.map((item, index) => `
	<div class="question-card">
          <div class="question-card-q compare-text">
            <h2 class="index">Question ${index + 1}</h2>
            <p class="question-text compare-text">
             ${item}
            </p>
          </div>
          <div class="compare-container">
            <div class="compare-inner">
              <h3 class="compare-candidate-you ">Your answer</h3>
              <div class="compare-answer your-answer">${check(parseInt(ansList[0][index]))}</div>
            </div>
            <div class="compare-inner compare-candidate-answer">
              <h3 class="compare-candidate">${canList[0].name}</h3>
              <div class="compare-answer can-answer">${check(+canList[0].list[index])}</div>
            </div>
          </div>
        </div>
	`).join("");


		questionList.innerHTML = q;
		const compareCan = document.querySelectorAll(".compare-candidate");

		buttons.forEach((item, index) => {
			

			item.addEventListener("click", (e) => {
				const canAnswer = document.querySelectorAll(".can-answer");
				const name = canList[index].name;

				removeActive(buttons);
				e.target.classList.add("compare-btn-active");


				canAnswer.forEach((c, i) => {
					compareCan[i].textContent = name;
					c.textContent = check(parseInt(canList[index].list[i]));
				});
			});
		});

	})
	.catch(err => {
		console.log(err)
		window.location.href= "http://localhost:8080/index.jsp"
	})


const removeActive = (buttons) => {
	buttons.forEach((i) => {
		if (i.classList.contains("compare-btn-active")) {
			i.classList.remove("compare-btn-active");
		}
	});
};

function check(x) {
	switch (x) {
		case 1:
			return "Strongly Disagree";
		case 2:
			return "Disagree";

		case 3:
			return "Neutral";

		case 4:
			return "Agree";

		case 5:
			return "Strongly Agree";
	}
}

window.onbeforeunload = function() {
	sessionStorage.clear();
}




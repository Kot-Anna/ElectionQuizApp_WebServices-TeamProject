const circle = document.querySelectorAll(".circle");
const wrap = document.querySelectorAll(".top-wrap");
const takeAgain = document.querySelector(".take-again");

getAllData()
.then(res => console.log(res))
.catch(err => {
	sessionStorage.clear();
	window.location.href= "http://localhost:8080/index.jsp"
})

let top3 = [];

Array.from(wrap).forEach(item => {
	const name = item.getAttribute("data-name");
	const list = item.getAttribute("data-list").split("%");

	list.pop();

	const newCan = { name, list };

	top3.push(newCan);

	let cans;

	if (sessionStorage.getItem("list") === null) {
		cans = [];
	} else {
		cans = JSON.parse(sessionStorage.getItem("list"));
	}

	cans.push(newCan);
	sessionStorage.setItem("list", JSON.stringify(cans))
})

console.log(top3);


circle.forEach((item) => {
	const all = item.children;

	const half1 = all[0];
	const half2 = all[1];
	const half = all[2];
	const per = all[all.length - 1].children[1];

	const number = +item.getAttribute("data-val");

	// Animate percentage
	let num = 0;
	setInterval(() => {
		if (num < number) {
			++num;
			per.textContent = num + "%";
		} else {
			clearInterval();
		}
	}, calculateTime(number));

	// Animate progress bar
	const portion = number * 3.6;
	const time = calculateTime(portion);

	let i = 0;
	setInterval(() => {
		i++;

		if (i <= portion) {
			if (i <= 180) {
				half1.style.transform = `rotate(${i}deg)`;
			}

			if (i === 180) {
				half.style.opacity = "0";
			}

			half2.style.transform = `rotate(${i}deg)`;
		} else {
			clearInterval();
		}
	}, time);
});

function calculateTime(x) {
	return 2000 / x;
}

function getAllData() {
	return new Promise((resolve, reject) => {
		let canList = JSON.parse(sessionStorage.getItem("list"));
		let ansList = JSON.parse(sessionStorage.getItem("ans"));
		let questions = JSON.parse(sessionStorage.getItem("ques"))[0];

		resolve({ canList, ansList, questions })
		reject("something went wrong")
	})
}

takeAgain.addEventListener("click", () => {
	sessionStorage.clear();
})



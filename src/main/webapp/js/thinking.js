const candidates = document.querySelectorAll(".ask-answer");
const button = document.querySelector(".ask-candidate-btn");

let maxTime = [];

candidates.forEach((item) => {
  const val = check(+item.getAttribute("data-answer"));
  const time = Math.random() * 3 * 1000;
  maxTime.push(time);
  setTimeout(() => {
    item.children[1].children[0].children[0].classList.add("thinking-text-out");
    setTimeout(() => {
      item.children[1].children[0].children[0].style.display = "none";
    }, 300);
    item.children[1].children[0].children[1].style.display = "none";
    item.children[1].children[0].children[2].style.display = "flex";
    item.children[1].children[0].children[3].style.display = "flex";
    item.children[1].children[0].children[3].textContent = val;
  }, time);
});

setTimeout(() => {
  button.disabled = false;
  button.classList.remove("btn-disabled");
}, Math.max(...maxTime) + 400);

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

const startBtn = document.querySelector("#start");
const listBtn = document.querySelector("#list");

startBtn.addEventListener("click", () => {
  location.replace("detecting.html");
});

listBtn.addEventListener("click", () => {
  location.replace("list.html");
});

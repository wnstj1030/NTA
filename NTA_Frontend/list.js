const listGoMainBtn = document.querySelector("#list-button");
const listBox = document.querySelector(".list-content-box");
const listCancelBtn = document.querySelector("#cancel-button");

listGoMainBtn.addEventListener("click", () => {
  location.replace("/");
});

listCancelBtn.addEventListener("click", () => {
  fetch("http://3.38.210.145:8080/api/list", {
    method: "DELETE",
  });
  while (listBox.firstChild) {
    listBox.removeChild(listBox.firstChild);
  }
});

fetch("http://3.38.210.145:8080/api/list")
  .then((response) => response.json())
  .then((listData) => {
    if (listData && Array.isArray(listData)) {
      listData.forEach((item) => {
        const listItem = document.createElement("div");
        listItem.classList.add("list-content");
        listItem.textContent = item.message;

        listBox.appendChild(listItem);
      });
    }
  })
  .catch((error) => {
    console.error("Error:", error);
  });

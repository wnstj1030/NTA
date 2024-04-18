const detectedTitle = document.querySelector("#DetectedTitle");
const detectedGoMainBtn = document.querySelector("#DetectingCancelBtn");

fetch("http://3.38.210.145:8080/api")
  .then((response) => response.json())
  .then((data) => {
    if (data.type != null) {
      detectedTitle.innerText = `${data.type} Attack Detected!`;
    }
  });

detectedGoMainBtn.addEventListener("click", () => {
  fetch("http://3.38.210.145:8080/api", { method: "DELETE" }).then(() => {
    location.replace("/");
  });
});

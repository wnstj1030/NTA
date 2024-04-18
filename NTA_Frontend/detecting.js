const cancelBtn = document.querySelector("#DetectingCancelBtn");

cancelBtn.addEventListener("click", () => {
  location.replace("/");
});

setInterval(() => {
  fetch("http://3.38.210.145:8080/api")
    .then((response) => response.json())
    .then((data) => {
      if (
        data.type == "icmpflood" ||
        data.type == "synflood" ||
        data.type == "udpflood"
      ) {
        location.replace("/detected.html");
      }
    });
}, 500);

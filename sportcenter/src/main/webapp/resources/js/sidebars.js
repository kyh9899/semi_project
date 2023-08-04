/* JavaScript */
(() => {
  'use strict';
  const tooltipTriggerList = Array.from(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
  tooltipTriggerList.forEach(tooltipTriggerEl => {
    new bootstrap.Tooltip(tooltipTriggerEl);
  });
})();

document.getElementById("toggleButton").addEventListener("click", function() {
  var content = document.querySelector(".intro_wrap");
  if (content.classList.contains("hidden")) {
    content.classList.remove("hidden");
    this.textContent = "콘텐츠 숨기기";
  } else {
    content.classList.add("hidden");
    this.textContent = "콘텐츠 보기";
  }
});


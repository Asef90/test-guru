document.addEventListener('turbolinks:load', function() {
  var timerField = document.querySelector('.timer-countdown');


  if (timerField) {
    var finishTime = timerField.textContent;
    var myTimer = setInterval(countDown, 1000, finishTime, timerField);
  }
})

function countDown(finishTime, timerField) {
  var now = new Date();
  var remainTime = new Date(finishTime) - now;
  //var remainSeconds = new Date(finishTime).getSeconds() - now.getSeconds();
  var remainMinutes = Math.floor(remainTime / 1000 / 60);
  var remainSeconds = Math.floor(remainTime / 1000 % 60);

  if (remainMinutes < 0 && remainSeconds < 0) {
    timerField.style.color = "red";
    clearInterval(myTimer);
  }

  remainMinutes = remainMinutes < 10 ? "0" + remainMinutes : remainMinutes;
  remainSeconds = remainSeconds < 10 ? "0" + remainSeconds : remainSeconds;


  timerField.innerHTML = "Timer: " + remainMinutes + " : " + remainSeconds;
  timerField.classList.remove('hide');
}

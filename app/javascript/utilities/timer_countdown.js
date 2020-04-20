document.addEventListener('turbolinks:load', function() {
  var timerField = document.querySelector('.timer-countdown');


  if (timerField) {
    var remainTime = timerField.dataset.remainTime;

    startTimer(remainTime, timerField);
  }
})

function startTimer(time, field) {
  var redirectPath = window.location.href + '/result';

  var timer = time, minutes, seconds;
  var timerOn = setInterval(function() {
    minutes = parseInt(timer / 60, 10);
    seconds = parseInt(timer % 60, 10);

    minutes = minutes < 10 ? "0" + minutes : minutes;
    seconds = seconds < 10 ? "0" + seconds : seconds;

    field.innerHTML = "Timer: " + minutes + " : " + seconds;

    if (--timer < 0) {
      clearInterval(timerOn);
      alert("Time is over");
      window.location.href = redirectPath;
    }
  }, 1000)
}

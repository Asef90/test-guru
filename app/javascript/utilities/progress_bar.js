document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress_bar')

  if (progressBar) {
    countProgress();
  }
})

function countProgress() {
  var currentProgress = document.querySelector('.current_progress');
  var current = currentProgress.dataset.current - 1;
  var max = currentProgress.dataset.max;
  currentProgress.style.width = (current / max) * 100 + "%";
}



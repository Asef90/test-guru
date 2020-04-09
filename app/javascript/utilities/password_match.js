document.addEventListener('turbolinks:load', function() {
  var form = document.querySelector('.password-match');

  if (form) {
    form.oninput = checkPasswordMatch;
  }
})

function checkPasswordMatch() {
  var password = this.querySelector('#user_password');
  var password_confirm = this.querySelector('#user_password_confirmation');
  var key = this.querySelector('.octicon-key');

  if (password_confirm.value) {

    var result = compare(password.value, password_confirm.value);

    result ? key.setAttribute('fill', 'green') : key.setAttribute('fill', 'red');

    key.classList.remove('hide');
  } else {
    key.classList.add('hide');
  }
}

function compare(value1, value2) {
  if (value1 === value2) {
    return true;
  } else {
    return false;
  }
}

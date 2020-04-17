document.addEventListener('turbolinks:load', function() {
  var rule_name = document.querySelector('.rule-name-control');

  if (rule_name) {
    buildRuleValueForm();
    rule_name.addEventListener('change', buildRuleValueForm)
  }
})

function buildRuleValueForm() {
  var form_value = document.querySelector('.rule-name-control').value
  var rule_value_control = document.querySelector('.rule-value-control');
  var rule_value_category = rule_value_control.querySelector('.rule-value-category');
  var rule_value_level = rule_value_control.querySelector('.rule-value-level');


  rule_value_control.classList.remove('hide');
  if (form_value === 'Category') {
    rule_value_category.classList.remove('hide');
    rule_value_level.classList.add('hide');
    rule_value_level.disabled = true;
    rule_value_category.disabled = false;
  } else if (form_value === 'Level') {
    rule_value_category.classList.add('hide');
    rule_value_level.classList.remove('hide');
    rule_value_category.disabled = true;
    rule_value_level.disabled = false;
  } else {
    rule_value_control.classList.add('hide');
  }
}

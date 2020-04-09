document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title');

  if (control) { control.addEventListener('click', sortRowsByTitle); }
})

function sortRowsByTitle() {
  var table = document.querySelector('table');

  // Node list
  var rows = table.querySelectorAll('tr');

  var sortedRows = [];

  // all table rows except the first one
  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i]);
  }


  var chevronUp = this.querySelector('.octicon-chevron-up');
  var chevronDown = this.querySelector('.octicon-chevron-down');

  if (chevronUp.classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc);
    chevronUp.classList.remove('hide');
    chevronDown.classList.add('hide');
  } else {
    sortedRows.sort(compareRowsDesc);
    chevronDown.classList.remove('hide');
    chevronUp.classList.add('hide');
  }

  var sortedTable = document.createElement('table');

  sortedTable.classList.add('table', 'table-striped', 'text-center', 'mt-5');
  sortedTable.appendChild(rows[0]);

  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i]);
  }

  table.parentNode.replaceChild(sortedTable, table);
}

function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent;
  var testTitle2 = row2.querySelector('td').textContent;

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0;
}

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent;
  var testTitle2 = row2.querySelector('td').textContent;

  if (testTitle1 > testTitle2) { return -1 }
  if (testTitle1 < testTitle2) { return 1 }
  return 0;
}

require("utilities")

const signUpForm = document.getElementById('user-sign-up')
if(signUpForm.length) new passwordConfirmation(signUpForm)

const tablesToSort = document.getElementsByClassName('sortable-table')
if(tablesToSort.length) tablesToSort.forEach( table => { new sortTableRowsByTitle(table) })
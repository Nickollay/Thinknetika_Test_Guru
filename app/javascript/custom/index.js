class passwordConfirmation {

    constructor(form) {
        this.form = form
        this.password = this.form.elements.user_password
        this.password_confirm = this.form.elements.user_password_confirmation

        this.setup()
    }

    setup() {
        this.form.addEventListener('input', event => {
            if(this.password.value != null) this.checkPasswords()
        })
    }

    checkPasswords() {
        if (this.password_confirm.value.length == 0) {
            this.password_confirm.parentElement.querySelector('.octicon-x').classList.add('hide')
            this.password_confirm.parentElement.querySelector('.octicon-check').classList.add('hide')
        } else if (this.password_confirm.value == this.password.value) {
            this.password_confirm.parentElement.querySelector('.octicon-x').classList.add('hide')
            this.password_confirm.parentElement.querySelector('.octicon-check').classList.remove('hide')
        } else {
            this.password_confirm.parentElement.querySelector('.octicon-x').classList.remove('hide')
            this.password_confirm.parentElement.querySelector('.octicon-check').classList.add('hide')
        }
    }
}

class sortTableRowsByTitle {
    constructor(table) {
        this.table = table
        this.control = table.querySelector('.sort-by-title')
        this.columnIndex = this.control.cellIndex

        this.setup()
    }

    setup() {
        if(this.control) this.control.addEventListener('click', event => { this.sortRowsByTitle() })
    }


    sortRowsByTitle() {
        const rowsToSort = Array.from(this.table.rows).slice(1)
        let sortedRows

        if(this.control.querySelector('.octicon-arrow-up').classList.contains('hide')) {
                sortedRows = rowsToSort
                .sort((rowA, rowB) => rowA.cells[this.columnIndex].innerHTML > rowB.cells[this.columnIndex].innerHTML ? 1 : -1);

            this.control.querySelector('.octicon-arrow-up').classList.remove('hide')
            this.control.querySelector('.octicon-arrow-down').classList.add('hide')
        } else {
            sortedRows = rowsToSort
                .sort((rowA, rowB) => rowA.cells[this.columnIndex].innerHTML > rowB.cells[this.columnIndex].innerHTML ? -1 : 1);

            this.control.querySelector('.octicon-arrow-down').classList.remove('hide')
            this.control.querySelector('.octicon-arrow-up').classList.add('hide')
        }

        this.table.tBodies[0].append(...sortedRows);
    }
}

document.addEventListener('turbolinks:load', () => {
    const signUpForm = document.getElementById('new_user')

    if(signUpForm) new passwordConfirmation(signUpForm)

    const tablesToSort = document.getElementsByClassName('sortable-table')

    if(tablesToSort.length) Array.prototype.forEach.call(tablesToSort, table => { new sortTableRowsByTitle(table) })
})

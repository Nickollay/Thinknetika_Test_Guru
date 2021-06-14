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

class editTestTitle {
    constructor(table) {
        this.table = table
        this.formInlineLinks = this.table.getElementsByClassName('form-inline-link')

        this.setup()
    }

    setup() {
        if(this.formInlineLinks) { Array.prototype.forEach.call(this.formInlineLinks, link => { link.addEventListener('click', event => { this.formInlineLinkHandler(event, link) }) }) }
    }

    formInlineLinkHandler(event, link) {
        event.preventDefault()

        const testId = link.dataset.testId

        new formInlineHandler(testId)
    }
}

class  formInlineHandler {
    constructor(testId) {
        this.testId = testId

        this.formInlineHandler(testId)
    }

    formInlineHandler(testId) {
        const link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')

        let testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]'),
            formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

        if (formInline) {
            if (formInline.classList.contains('hide')) {
                testTitle.classList.add('hide')
                formInline.classList.remove('hide')
                link.textContent = I18n.t('cancel')
            } else {
                formInline.classList.add('hide')
                testTitle.classList.remove('hide')
                link.textContent = I18n.t('edit')
            }
        }
    }
}

class setProgressBar {
    constructor(progressBar) {
        this.userBar = progressBar.querySelector('div#user-bar')
        this.questionNumber = document.querySelector('[data-question-number]').dataset.questionNumber
        this.NumberOfQuestions = document.querySelector('[data-number-of-questions]').dataset.numberOfQuestions

        this.setProgress()
    }

    setProgress() {
        let progress = this.questionNumber / this.NumberOfQuestions * 100
        this.userBar.setAttribute('style', 'width: ' + progress + '%')
        // debugger
    }

}

document.addEventListener('turbolinks:load', () => {
    I18n.locale = $('body').data('locale')

    // editTestTitle
    const adminTables = document.getElementsByClassName('admin table')

    if(adminTables) Array.prototype.forEach.call(adminTables, table => { new editTestTitle(table) })

    // formInlineHandler after errors occurred on resource edit
    const error = document.getElementsByClassName('resource-errors')[0]

    if(error) {
        const resourceId = error.dataset.resourceId

        new formInlineHandler(resourceId)
    }

    // progress bar
    const progressBar = document.getElementById('progress-bar')

    if(progressBar) new setProgressBar(progressBar)

    // passwordConfirmation
    const signUpForm = document.getElementById('new_user')

    if(signUpForm) new passwordConfirmation(signUpForm)

    // sortTableRowsByTitle
    const tablesToSort = document.getElementsByClassName('sortable-table')

    if(tablesToSort) Array.prototype.forEach.call(tablesToSort, table => { new sortTableRowsByTitle(table) })
})

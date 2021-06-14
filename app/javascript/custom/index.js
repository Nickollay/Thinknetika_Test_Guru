import { sortTableRowsByTitle } from './sort_table_rows_by_title.js'
import { passwordConfirmation } from './password_confirmation.js'
import { editTestTitle } from './edit_test_title.js'
import { formInlineHandler } from './form_inline_handler.js'
import { setProgressBar } from "./set_progress_bar";

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

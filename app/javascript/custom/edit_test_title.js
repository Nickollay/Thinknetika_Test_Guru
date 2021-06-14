import { formInlineHandler } from './form_inline_handler.js'

export class editTestTitle {
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

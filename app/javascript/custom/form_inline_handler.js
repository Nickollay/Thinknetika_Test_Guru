export class  formInlineHandler {
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

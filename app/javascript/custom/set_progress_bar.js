export class setProgressBar {
    constructor(progressBar) {
        this.userBar = progressBar.querySelector('div#user-bar')
        this.questionNumber = document.querySelector('[data-question-number]').dataset.questionNumber
        this.NumberOfQuestions = document.querySelector('[data-number-of-questions]').dataset.numberOfQuestions

        this.setProgress()
    }

    setProgress() {
        let progress = this.questionNumber / this.NumberOfQuestions * 100
        this.userBar.setAttribute('style', 'width: ' + progress + '%')
        this.userBar.innerText = Math.round(progress) + '%'
    }
}

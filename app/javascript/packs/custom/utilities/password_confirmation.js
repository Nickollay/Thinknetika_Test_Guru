class passwordConfirmation {
    constructor(form) {
        this.form = form

        this.setup()
    }

    setup() {

    }

    function confirmPassword() {
        let passwordValue = document.querySelector('.password').querySelector('input').value,
            passwordConfirmation = document.querySelector('.password_confirmation'),
            passwordConfirmationValue = passwordConfirmation.querySelector('input').value

        if (passwordConfirmationValue.length == 0) {
            passwordConfirmation.querySelector('.octicon-x').classList.add('hide')
            passwordConfirmation.querySelector('.octicon-check').classList.add('hide')
        } else if (passwordConfirmationValue == passwordValue) {
            passwordConfirmation.querySelector('.octicon-x').classList.add('hide')
            passwordConfirmation.querySelector('.octicon-check').classList.remove('hide')
        } else {
            passwordConfirmation.querySelector('.octicon-x').classList.remove('hide')
            passwordConfirmation.querySelector('.octicon-check').classList.add('hide')
        }
    }
}

document.addEventListener('turbolinks:load', function() {
    let passwordConfirmationInput = document.querySelector('.password_confirmation').querySelector('input')

    if (passwordConfirmationInput) { passwordConfirmationInput.addEventListener('input', confirmPassword) }
})

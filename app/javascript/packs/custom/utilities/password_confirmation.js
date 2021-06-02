class passwordConfirmation {
    constructor(form) {
        this.form = form
        this.password = this.elements.user_password
        this.password_confirm = this.elements.user_password_confirm

        this.setup()
    }

    setup() {
        this.form.addEventListener('input', event => {
            if(this.password.value != null) this.checkPasswords()
            })
    }

    checkPasswords() {
        if (this.password_confirm.value.length == 0) {
            this.password_confirm.querySelector('.octicon-x').classList.add('hide')
            this.password_confirm.querySelector('.octicon-check').classList.add('hide')
        } else if (this.password_confirm.value == this.password.value) {
            this.password_confirm.querySelector('.octicon-x').classList.add('hide')
            this.password_confirm.querySelector('.octicon-check').classList.remove('hide')
        } else {
            this.password_confirm.querySelector('.octicon-x').classList.remove('hide')
            this.password_confirm.querySelector('.octicon-check').classList.add('hide')
        }
    }
}

//     function confirmPassword() {
//         let passwordValue = document.querySelector('.password').querySelector('input').value,
//             passwordConfirmation = document.querySelector('.password_confirmation'),
//             passwordConfirmationValue = passwordConfirmation.querySelector('input').value
//
//         if (passwordConfirmationValue.length == 0) {
//             passwordConfirmation.querySelector('.octicon-x').classList.add('hide')
//             passwordConfirmation.querySelector('.octicon-check').classList.add('hide')
//         } else if (passwordConfirmationValue == passwordValue) {
//             passwordConfirmation.querySelector('.octicon-x').classList.add('hide')
//             passwordConfirmation.querySelector('.octicon-check').classList.remove('hide')
//         } else {
//             passwordConfirmation.querySelector('.octicon-x').classList.remove('hide')
//             passwordConfirmation.querySelector('.octicon-check').classList.add('hide')
//         }
//     }
//

// document.addEventListener('turbolinks:load', function() {
//     let passwordConfirmationInput = document.querySelector('.password_confirmation').querySelector('input')
//
//     if (passwordConfirmationInput) { passwordConfirmationInput.addEventListener('input', confirmPassword) }
// })

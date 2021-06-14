export class passwordConfirmation {

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

// alert('before class  passwordConfirmation')
// class passwordConfirmation {
//
//     constructor(form) {
//         alert('In constructor')
//         this.form = form
//         // this.password = this.elements.user_password
//         // this.password_confirm = this.elements.user_password_confirm
//         //
//         // this.setup()
//     }
//
//     setup() {
//         this.form.addEventListener('input', event => {
//             if(this.password.value != null) this.checkPasswords()
//             })
//     }
//
//     checkPasswords() {
//         if (this.password_confirm.value.length == 0) {
//             this.password_confirm.querySelector('.octicon-x').classList.add('hide')
//             this.password_confirm.querySelector('.octicon-check').classList.add('hide')
//         } else if (this.password_confirm.value == this.password.value) {
//             this.password_confirm.querySelector('.octicon-x').classList.add('hide')
//             this.password_confirm.querySelector('.octicon-check').classList.remove('hide')
//         } else {
//             this.password_confirm.querySelector('.octicon-x').classList.remove('hide')
//             this.password_confirm.querySelector('.octicon-check').classList.add('hide')
//         }
//     }
// }

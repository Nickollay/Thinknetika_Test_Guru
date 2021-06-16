class FeedbacksMailer < ApplicationMailer
  def feedback(feedback, user)
    @feedback = feedback
    @user = user
    admin = Admin.where('email LIKE ?', 'vvv').take

    mail to: admin.email, subject: t('.subject')
  end
end
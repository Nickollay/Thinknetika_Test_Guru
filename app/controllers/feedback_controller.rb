class FeedbackController < ApplicationController
  def show; end

  def create
    FeedbacksMailer.feedback(feedback, current_user).deliver_now

    flash[:success] = t('.success')

    redirect_to root_path
  end

  private

  def feedback
    params.permit(:feedback)
  end
end
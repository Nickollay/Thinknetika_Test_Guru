class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!

  def new;   end

  def create
    FeedbacksMailer.feedback(params[:feedback], current_user).deliver_now

    flash[:success] = t('.success')

    redirect_to root_path
  end

  private

  def feedback
    params.permit(:feedback)
  end
end

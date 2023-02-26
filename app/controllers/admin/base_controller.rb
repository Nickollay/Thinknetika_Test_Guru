class Admin::BaseController < ApplicationController
  before_action :admin_required!

  layout 'admin'

  private

  def admin_required!
    return redirect_to root_path, alert: 'You are not authorized to view this page!' unless current_user.is_a?(Admin)
  end
end

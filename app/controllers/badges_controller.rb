class BadgesController < ApplicationController
  before_action :find_all_badges, only: :index

  def index
    @user_badges_ids = current_user.badges.ids
  end

  private

  def find_all_badges
    @all_badges = Badge.all
  end
end

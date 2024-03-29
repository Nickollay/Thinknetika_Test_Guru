class Admin::BadgesController < Admin::BaseController
  before_action :find_all_badges, only: :index
  before_action :find_badge, only: %i[show edit update destroy]

  def index; end

  def new
    @badge = Badge.new
  end

  def show; end

  def create
    @badge = Badge.new(badge_params)
    @badge.creator = current_user

    if @badge.save
      redirect_to admin_badge_path(@badge), notice: t('.success')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge), notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t('.success')
  end

  def find_rule_values
    rule_type = params[:rule]

    if rule_type == Badge::ALL_FROM_CATEGORY
      @rule_values = Category.pluck(:id, :title).to_h
    elsif rule_type == Badge::ONE_AFTER_FIRST_CATCH
      @rule_values = Test.pluck(:id, :title).to_h
    end

    render json:  @rule_values || {fer: 123}
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :url, :description, :rule_type, :rule_value)
  end

  def find_all_badges
    @badges = Badge.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end
end

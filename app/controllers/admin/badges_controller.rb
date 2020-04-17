class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      flash[:success] = t('.success')
      redirect_to [:admin, @badge]
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      flash[:success] = t('.success')
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    flash[:success] = t('.success')
    redirect_to admin_badges_path
  end

  private

  def badge_params
    result = params.require(:badge).permit(:title, :image, :description, :rule_name, :rule_value)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

end

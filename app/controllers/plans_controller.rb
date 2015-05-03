class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
#  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @plans = Plan.all
  end

  def show
  end

  def new
    @plan = current_user.plans.build
  end

  def edit
  end

  def create
    @plan = current_user.plans.build(plan_params)
    if @plan.save
      redirect_to plans_path, notice: 'Plan was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @plan.update(plan_params)
      redirect_to plans_path, notice: 'Plan was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @plan.destroy
    redirect_to plans_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

#    def correct_user
#      @plan = current_user.plans.find_by(id: params[:id])
#      redirect_to plans_path, notice: "Not authorized to edit this plan" if @plan.nil?
#    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:name, :price, :normal_price, details_attributes:[:content,:_destroy,:id])
    end
end
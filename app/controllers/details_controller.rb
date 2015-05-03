class DetailsController < ApplicationController
#  before_action :set_detail, only: [:show, :edit, :update, :destroy]

#  def show
#    @detail = Detail.find(params[:id])
#  end

#  def new
#    plan = Plan.find(params[:plan_id])
#    @detail = plan.detail.build
#  end

  def create
    @detail = Detail.new(detail_params)
  end

  def update
    @detail.update(detail_params)
  end  

  private
    def set_detail
      @detail = Detail.find(params[:id])
    end

    def detail_params
      params.require(:detail).permit(:plan_id, :content)
    end
end

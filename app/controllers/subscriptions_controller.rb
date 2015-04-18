class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  def show
    @subscription = Subscription.find(params[:id])
  end

  def new
    plan = Plan.find(params[:plan_id])
    @subscription = plan.subscriptions.build
  end

  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      redirect_to @subscription, :notice => "Thank you for subscribing!"
    else
      render :new
    end
  end

  private
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    def subscription_params
      params.require(:subscription).permit(:plan_id, :email)
    end
end

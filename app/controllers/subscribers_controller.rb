class SubscribersController < ApplicationController
  layout "front"
  before_action :set_subscriber, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:new, :create]

  def index
    @subscribers = Subscriber.all
  end

  def show
  end

  def new
    @subscriber = Subscriber.new
  end

  def edit
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      redirect_to root_path, notice: 'Inschrijving voltooid!'
    else
      render action: 'new'
    end
  end

  def update
    @subscriber.update(subscriber_params)
    @subscriber.save
    redirect_to root_path
  end

  def destroy
    @subscriber.destroy
    redirect_to subscribers_url, notice: 'Volger verwijderd!'
  end

  private
    def set_subscriber
      @subscriber = Subscriber.find(params[:id])
    end

    def subscriber_params
      params.require(:subscriber).permit(:email, :first_name, :last_name)
    end
end

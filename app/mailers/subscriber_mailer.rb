class SubscriberMailer < ApplicationMailer
  default from: "info@doamer.com"
  
  def welcome_email(subscriber)
  	@subscriber = subscriber
  	mail(to: @subscriber.email, subject: "Welkom bij Inekevosman.nl!")
  end
end

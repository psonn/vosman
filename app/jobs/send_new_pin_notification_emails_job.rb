class SendNewPinNotificationEmailsJob < ActiveJob::Base
  queue_as :default

  require "mandrill"

  def perform(pin)
    pin = pin
    subscribers = pin.newsletters.pluck(:subscriber_id)

    if subscribers.count > 0
      recipients = convert_subscribers_to_mandrill_recipients(subscribers)
      merge_vars = convert_subscribers_to_mandrill_merge_fields(subscribers)
      body = ActionController::Base.new.
        render_to_string("subscriber_mailer/new_pin_notification_email.html.erb", 
        :layout => false)

      m = Mandrill::API.new
      message = {
        :from_name=> "Ineke Vosman",
        :from_email=>"noreply@inekevosman.nl",
        :to=> recipients,   
        :subject=> "Nieuw artikel: #{pin.title}",  
        :html=> body,  
        :merge_vars => merge_vars,
        :preserve_recipients => false,
        :global_merge_vars => [
          {name: "pin", content: pin.title}, 
          {name: "pin_title", content: pin.title}, 
          {name: "pin_url", content: Rails.application.routes.url_helpers.pin_path(pin)}
        ]
      }  
      m.messages.send message
    end
  end

  def convert_subscribers_to_mandrill_recipients(subscriber_ids)
    subscriber_ids.map do |subscriber_id|
      subscriber = Subscriber.find(subscriber_id)
      {:email => subscriber.email}
    end
  end

  def convert_subscribers_to_mandrill_merge_fields(subscriber_ids)
    subscriber_ids.map do |subscriber_id| 
      subscriber = Subscriber.find(subscriber_id)
      {:rcpt => subscriber.email, :vars => [{:name => "first_name", :content => subscriber.first_name}]}
    end
  end

end

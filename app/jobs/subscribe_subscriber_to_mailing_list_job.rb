class SubscribeSubscriberToMailingListJob < ActiveJob::Base
  queue_as :default

  def perform(subscriber)
    gb = Gibbon::API.new
    gb.lists.subscribe({:id => ENV["MAILCHIMP_LIST_ID"], :email => {:email => subscriber.email}, :merge_vars => {:FNAME => subscriber.first_name, :LNAME => subscriber.last_name}, :double_optin => false})
  end
end

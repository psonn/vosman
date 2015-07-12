class Subscriber < ActiveRecord::Base
  has_many :newsletters

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates_uniqueness_of :email

  after_create :subscribe_subscriber_to_mailing_list
  after_create :send_welcome_email_to_subscriber

  private

  def subscribe_subscriber_to_mailing_list
  	SubscribeSubscriberToMailingListJob.perform_later(self)
  end

  def send_welcome_email_to_subscriber
    SubscriberMailer.welcome_email(self).deliver_later
  end
end

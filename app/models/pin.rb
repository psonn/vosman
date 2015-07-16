class Pin < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, :styles => { :show => "600x600", :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

    validates :image, presence: true
    validates :description, presence: true
    validates :title, presence: true

    acts_as_taggable
	extend FriendlyId
	friendly_id :title, use: :slugged

	has_many :newsletters

#	after_create :notify_subscribers

#	def notify_subscribers
#		SendNewPinNotificationEmailsJob.perform_later(self)
#	end
end

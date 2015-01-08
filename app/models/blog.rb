class Blog < ActiveRecord::Base
	belongs_to :user
	extend FriendlyId
	friendly_id :title, use: :slugged

	validates :title, uniqueness: true
end

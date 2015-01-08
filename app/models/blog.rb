class Blog < ActiveRecord::Base
	belongs_to :user
	extend FriendlyId
	friendly_id :title, use: :slugged
	has_attached_file :image, :styles => { :show => "600x600", :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	validates :title, uniqueness: true
end

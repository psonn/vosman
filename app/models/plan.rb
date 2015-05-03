class Plan < ActiveRecord::Base
	belongs_to :user
	has_many :subscriptions
	
	has_many :details
	accepts_nested_attributes_for :details, allow_destroy: true

    validates :name, presence: true
    validates :price, presence: true
end

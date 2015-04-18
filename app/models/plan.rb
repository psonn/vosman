class Plan < ActiveRecord::Base
	belongs_to :user
	has_many :subscriptions

    validates :name, presence: true
    validates :price, presence: true
end

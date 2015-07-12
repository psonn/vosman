class PinNewsletter < ActiveRecord::Base
	belongs_to :subscriber, dependent: :destroy
	belongs_to :pin, dependent: :destroy
end
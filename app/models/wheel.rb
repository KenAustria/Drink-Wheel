class Wheel < ActiveRecord::Base
	has_and_belongs_to_many :drinks
	has_many :events
end
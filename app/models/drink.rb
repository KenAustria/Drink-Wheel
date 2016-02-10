class Drink < ActiveRecord::Base
  validates :name, presence: true
  mount_uploader :file, DrinkUploader
end 
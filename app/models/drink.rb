class Drink < ActiveRecord::Base
  has_and_belongs_to_many :wheel
  validates :name, presence: true
  mount_uploader :file, DrinkUploader
end 
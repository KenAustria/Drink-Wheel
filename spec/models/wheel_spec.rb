require "rails_helper"

RSpec.describe Wheel, :type => :model do
  it "has a valid model" do
  	wheel = Wheel.new(name: "Fun Wheel", description: "Wheel of fun.")
  	wheel.should be_valid
  end

  # it "must have a name present" do
  # 	Wheel = Wheel.new(description: "A martini for all occassions.")
  # 	Wheel.should_not be_valid
  # end

  # it "does not need a description" do
  # 	Wheel = Wheel.new(name: "Kenntini")
  # 	Wheel.should be_valid
  # end

  # it "creates a Wheel" do
  # 	expect do
  # 	  Wheel.create!(name: "Kenntini", description: "A martini for all occassions.")
  # 	end.to change(Wheel, :count).by(1)
  # end
end
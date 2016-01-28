require "rails_helper"

RSpec.describe Drink, :type => :model do
  it "has a valid model" do
  	drink = Drink.new(name: "Kenntini", description: "A martini for all occassions.")
  	drink.should be_valid
  end

  it "must have a name present" do
  	drink = Drink.new(description: "A martini for all occassions.")
  	drink.should_not be_valid
  end

  it "does not need a description" do
  	drink = Drink.new(name: "Kenntini")
  	drink.should be_valid
  end

  it "creates a drink" do
  	expect do
  	  Drink.create!(name: "Kenntini", description: "A martini for all occassions.")
  	end.to change(Drink, :count).by(1)
  end
end
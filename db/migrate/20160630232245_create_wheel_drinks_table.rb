class CreateWheelDrinksTable < ActiveRecord::Migration
  def change
    create_table :drinks_wheels do |t|
		t.integer :drink_id
		t.integer :wheel_id
    	t.timestamps
    end
  end
end

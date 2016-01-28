class CreateDrinksTable < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.text :description
    	
      t.timestamps # creates 2 columns: created_at, updated_at
    end
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :type
      t.integer :drink_id
      t.integer :wheel_id
      t.integer :user_id
      t.string :timestamps

      t.timestamps null: false
    end
  end
end

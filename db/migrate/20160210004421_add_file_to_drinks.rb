class AddFileToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :file, :string
  end

  # Above is shorthand for what's below
  # def up
  #   add_column :drinks, :file, :string
  # end

  # def down
  #   remove_column :drinks, :file
  # end
end

class AddActivatedToLists < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :activated, :boolean
  end
end

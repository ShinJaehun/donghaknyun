class AddAdditionalInfosToLists < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :period, :integer
    add_column :lists, :floor, :integer
  end
end

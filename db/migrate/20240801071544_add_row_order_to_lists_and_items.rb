class AddRowOrderToListsAndItems < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :row_order, :integer
    add_column :items, :row_order, :integer
  end
end

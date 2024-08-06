class AddColorToItem < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :color, :string
  end
end

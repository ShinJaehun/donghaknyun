class AddScheduleRefToLists < ActiveRecord::Migration[7.1]
  def change
    add_reference :lists, :schedule, null: false, foreign_key: true
  end
end

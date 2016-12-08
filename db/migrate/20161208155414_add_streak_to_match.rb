class AddStreakToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :streak, :integer, default: 1, null: false
    add_index :matches, :streak
  end
end

class AddRoundsToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :rounds, :integer, default: 3
    add_index :matches, :rounds
  end
end

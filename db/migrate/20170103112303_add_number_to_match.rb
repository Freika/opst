class AddNumberToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :number, :integer, default: 0, null: false
    add_index :matches, :number
  end
end

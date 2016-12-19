class AddUserIdToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :user_id, :integer, null: false, default: 0
    add_index :matches, :user_id
  end
end

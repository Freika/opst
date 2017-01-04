class AddPartySizeToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :party_size, :integer, default: 1
    add_index :matches, :party_size
  end
end

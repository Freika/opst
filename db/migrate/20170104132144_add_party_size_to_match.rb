class AddPartySizeToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :party_size, :integer
    add_index :matches, :party_size
  end
end

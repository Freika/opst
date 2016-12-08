class AddSrDiffToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :sr_diff, :integer, default: 0, null: false
    add_index :matches, :sr_diff
  end
end

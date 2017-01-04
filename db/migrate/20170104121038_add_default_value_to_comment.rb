class AddDefaultValueToComment < ActiveRecord::Migration[5.0]
  def change
    change_column :matches, :comment, :text, default: '', null: false
  end
end

class ChangeMatchNumberDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column :matches, :number, :integer, default: 1, null: false
  end
end

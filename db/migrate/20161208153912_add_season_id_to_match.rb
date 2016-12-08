class AddSeasonIdToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :season_id, :integer, default: 0, null: false
    add_index :matches, :season_id
  end
end

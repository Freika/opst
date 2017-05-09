class AddBattletagToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :battletag, :string
    add_index :users, :battletag, unique: true
  end
end

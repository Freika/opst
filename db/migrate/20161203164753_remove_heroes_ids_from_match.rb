class RemoveHeroesIdsFromMatch < ActiveRecord::Migration[5.0]
  def change
    remove_column :matches, :heroes_ids, :text
  end
end

class CreateChosenHeros < ActiveRecord::Migration[5.0]
  def change
    create_table :chosen_heros do |t|
      t.integer :hero_id
      t.integer :match_id

      t.timestamps
    end
    add_index :chosen_heros, :hero_id
    add_index :chosen_heros, :match_id
  end
end

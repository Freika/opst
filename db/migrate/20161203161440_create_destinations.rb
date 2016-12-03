class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.integer :match_id
      t.integer :map_id

      t.timestamps
    end
    add_index :destinations, :match_id
    add_index :destinations, :map_id
  end
end

class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :result
      t.text :heroes_ids, array: true, default: []

      t.timestamps
    end
  end
end

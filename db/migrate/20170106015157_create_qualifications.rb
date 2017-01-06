class CreateQualifications < ActiveRecord::Migration[5.0]
  def change
    create_table :qualifications do |t|
      t.integer :skill_rating
      t.integer :wins
      t.integer :losses
      t.integer :draws
      t.integer :season_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :qualifications, :skill_rating
    add_index :qualifications, :wins
    add_index :qualifications, :losses
    add_index :qualifications, :draws
    add_index :qualifications, :season_id
    add_index :qualifications, :user_id
  end
end

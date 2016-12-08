class CreateSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :seasons do |t|
      t.string :name
      t.datetime :finishes_at

      t.timestamps
    end
  end
end

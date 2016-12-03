class AddSkillRatingToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :skill_rating, :integer
    add_index :matches, :skill_rating
  end
end

class AddCommentToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :comment, :text
  end
end
